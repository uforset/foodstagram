package com.circle.foodstagram.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.codehaus.plexus.util.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.board.model.service.BoardAttachService;
import com.circle.foodstagram.board.model.service.BoardReplyService;
import com.circle.foodstagram.board.model.service.BoardService;
import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.board.model.vo.BoardReply;
import com.circle.foodstagram.common.AttachUtils;
import com.circle.foodstagram.food.model.service.FoodService;
import com.circle.foodstagram.food.model.vo.Food;


@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static JSONParser jsonParser = new JSONParser();

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardAttachService boardAttachService;

	@Autowired
	private BoardReplyService boardReplyService;

	@Autowired
	private AttachUtils attachUtils;
	
	@Autowired
	private FoodService foodService;

	// 페이지 이동처리용 ----------------
	// 게시 원글 쓰기 페이지로 이동 처리용
	@RequestMapping("selectbwform.do")
	public String moveBoardWriteForm( Model model, @RequestParam (value="file_name", required=false )String file_name) {
		try {
			model.addAttribute("file_name", file_name);
			logger.info("이름 : " + file_name);
		}catch (Exception e) {
			
		}
		return "board/selectboardRegistForm";
	}
	
	@RequestMapping("boardTakePictures.do")
	public String moveTakepictureForm() {
		return "board/boardTakePictures";
	}
	
	// AI 사진 이미지 찍기 페이지
	@ResponseBody
   @PostMapping("transmitCam.do")
   public void transmitCam(HttpServletRequest request, HttpServletResponse response) throws Exception{
      String msg = "";
      String img = request.getParameter("img");
      FileOutputStream stream = null;
      try {
         System.out.println("binary file : " + img);
         if(img == null || img.trim().equals("")) {
            throw new Exception();
         }
         img = img.replaceAll("data:image/png;base64,", "");
         byte[] file = Base64.decodeBase64(img.getBytes());
         String filePath = request.getSession().getServletContext().
               getRealPath("resources/uploaded_foodImage");
         Date today = new Date();
         SimpleDateFormat format1;
         format1 = new SimpleDateFormat("yyyy-MM-ddHHmmss");
         msg = format1.format(today) + ".png";
         stream = new FileOutputStream(filePath+ "\\" + msg);
         
         stream.write(file);
         stream.close();
      }catch(Exception e) {
         e.printStackTrace();;
         stream.close();
         msg = "fail";
      }
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.append(msg);
      out.flush();
      out.close();
   }
	
	@GetMapping("filedown.do")
	public ModelAndView filedownMethod(HttpServletRequest request) {
		 String s= request.getSession().getServletContext().getRealPath("resources/uploaded_foodImage");
	      s += "\\cam_food.png";
	      File f=new File(s);
	      return new ModelAndView("afiledown", "downFile", f);
	}
	
   @ResponseBody
   @PostMapping("transmitImg.do")
   public void transmitImg(@RequestParam("file") MultipartFile file
         ,HttpServletRequest request, HttpServletResponse response) throws IOException {
      String imgFilePath = request.getSession().getServletContext().getRealPath("/resources/uploaded_foodImage");
      String fileName = file.getOriginalFilename();
      String renameFilename = "dnd_food." + fileName.substring(fileName.lastIndexOf(".") + 1);
      String msg = "";
      //파일 저장
      File renameFile = new File(imgFilePath + "\\" + renameFilename);
      try {
         file.transferTo(renameFile);
         logger.info(renameFile.getAbsolutePath());
      } catch(Exception e) {
         e.printStackTrace();
         msg = "fail";
      }
      
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.append(msg);
      out.flush();
      out.close();
      
   }
   
   @PostMapping("upImg.do")
   public String upImg(@RequestParam("imgFile") MultipartFile file
         ,HttpServletRequest request, Model model) {
      String keyword = "";
      String imgFilePath = request.getSession().getServletContext().getRealPath("/resources/uploaded_foodImage");
      String fileName = file.getOriginalFilename();
      String renameFilename = "up_food." + fileName.substring(fileName.lastIndexOf(".") + 1);
      String msg = "";
      //파일 저장
      File renameFile = new File(imgFilePath + "\\" + renameFilename);
      try {
         file.transferTo(renameFile);
         logger.info(renameFile.getAbsolutePath());
      } catch(Exception e) {
         e.printStackTrace();
         return "common/error";
      }

      return "board/boardTakePictures";
   }

	// 모든 게시글 목록보기 요청 처리용
	@RequestMapping(value = "blistAll.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardListMethod(@RequestParam("page")int page) throws UnsupportedEncodingException {
			
			ArrayList<BoardAttach> list = boardService.selectListAll(page, 9);
	
			JSONObject sendJson = new JSONObject();
			JSONArray jarr = new JSONArray();
	
			for (BoardAttach boardAttach : list) {
				
				JSONObject jobj = new JSONObject();
				jobj.put("atch_parent_no", boardAttach.getAtch_parent_no());
				jobj.put("atch_file_name", boardAttach.getAtch_file_name());
				jarr.add(jobj);
				
			}

		// 전송용 객체에 jarr 을 담음
		sendJson.put("list", jarr);

		// json 을 json string 타입으로 바꿔서 전송함
		return sendJson.toJSONString(); // 뷰리졸버로 리턴함

	}

	// 마이 페이지 본인 게시글 목록보기 요청 처리용
	@RequestMapping(value = "blistmy.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardListMyMethod(@RequestParam("userid") String userid, @RequestParam("page")int page) throws UnsupportedEncodingException {

		ArrayList<BoardAttach> list = boardService.selectListMy(userid, page, 6);
		int board = boardService.countBoard(userid);
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (BoardAttach boardAttach : list) {
			
			JSONObject jobj = new JSONObject();

			jobj.put("atch_parent_no", boardAttach.getAtch_parent_no());
			jobj.put("atch_file_name", boardAttach.getAtch_file_name());

			jarr.add(jobj);

		}

		sendJson.put("list", jarr);
		sendJson.put("countboard", board);
		
		return sendJson.toJSONString();

	}
	// 마이페이지 친구 이상 공개 목록보기 요청 처리용
	@RequestMapping(value = "blistfriend.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardListFriendMethod(@RequestParam("userid") String userid, @RequestParam("page")int page) throws UnsupportedEncodingException {

		ArrayList<BoardAttach> list = boardService.selectListFriend(userid, page, 6);
		int board = boardService.countBoard(userid);

		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (BoardAttach boardAttach : list) {
			
			JSONObject jobj = new JSONObject();
			jobj.put("atch_parent_no", boardAttach.getAtch_parent_no());
			jobj.put("atch_file_name", boardAttach.getAtch_file_name());

			jarr.add(jobj);

		}

		sendJson.put("list", jarr);
		sendJson.put("countboard", board);
		
		return sendJson.toJSONString();

	}

	// 게시글 상세보기 처리용
	// 영양정보 DB보기 있음 
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetailMethod(ModelAndView mv, 
					@RequestParam("b_no") int b_no) {
		
		boardService.updateAddReadcount(b_no);
		Board board = boardService.selectBoard(b_no);
		Food food = foodService.selectFood(board.getB_category());
		ArrayList<BoardAttach> aList = boardAttachService.selectAttchList(b_no);
		ArrayList<BoardReply> rList = boardReplyService.selectReplyList(b_no);
		ArrayList<Food> fList = foodService.selectFoodList();
		
		if (board != null) {

				mv.addObject("board", board);
				mv.addObject("food", food);
				mv.addObject("aList", aList);
				mv.addObject("rList", rList);
				mv.addObject("fList", fList);
				mv.setViewName("board/boardDetail");
		
		} else {
			mv.addObject("message", b_no + "번 게시글 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 게시 원글 등록 처리용 : 파일 첨부(업로드) 기능 있음
	@RequestMapping(value = "binsert.do", method = RequestMethod.POST)
	public String boardInsertMethod(Board board, Model model, HttpServletRequest request,
			@RequestParam(value="boFiles", required=false) MultipartFile[] boFiles, @RequestParam(value="cam", required=false) String cam) throws IOException {
		logger.info("음음");
		List<BoardAttach> attaches = null;
		if(cam != null) {
			MultipartFile[] camFiles;
			if(boFiles != null && boFiles.length > 0 && boFiles[0].getSize()>0) {
				camFiles = Arrays.copyOf(boFiles, boFiles.length + 1);
				camFiles[boFiles.length] = getMultipartFile(request, cam);
				logger.info("if문");
				logger.info("boFiles"+ boFiles[0]);
			}
			else {
				camFiles = new MultipartFile[1];
				camFiles[0] = getMultipartFile(request, cam);
				logger.info("else문");
			}
			boFiles = camFiles;
		}
		try {
			if (boFiles != null && boFiles.length > 0) {
				attaches = attachUtils.getBoardAttachListByMultiparts(boFiles, "board_upfiles", request);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (boardService.insertBoard(board) > 0) {

			int b_no = board.getB_no();
			if (attaches != null && attaches.size() > 0) {
				for (BoardAttach a : attaches) {
					a.setAtch_parent_no(b_no);
					if (boardAttachService.insertAttach(a) > 0) {
					} else {
						model.addAttribute("message", "게시글 등록 실패");
						return "common/error";
					}
				}
			}
			return "redirect:main.do";
		} else {
			model.addAttribute("message", "게시글 등록 실패");
			return "common/error";
		}
	}
	
    private MultipartFile getMultipartFile(HttpServletRequest request, String file_name) throws IOException {
    	String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploaded_foodImage");
        File file = new File(uploadPath + "\\" + file_name);
        FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());

        try {
            InputStream input = new FileInputStream(file);
            OutputStream os = fileItem.getOutputStream();
            IOUtils.copy(input, os);
            // Or faster..
            // IOUtils.copy(new FileInputStream(file), fileItem.getOutputStream());
        } catch (IOException ex) {
            // do something.
        }

        //jpa.png -> multipart 변환
        MultipartFile mFile = new CommonsMultipartFile(fileItem);
        return mFile;
    }

	// 게시 원글 삭제 처리용
	@RequestMapping(value = "bdel.do", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("b_no") int b_no, Model model) {

		if (boardService.deleteBoard(b_no) > 0) {
			return "redirect:main.do";
		} else {
			model.addAttribute("message", b_no + "번 게시글 삭제 실패");
			return "common/error";
		}
	}

	// 검색한 게시글 목록보기 요청 처리용
	@RequestMapping(value = "bsearch.do", method = RequestMethod.GET)
	public String boardsearchMethod(@RequestParam("b_category") String fname, Model model) {

		ArrayList<BoardAttach> list = boardService.searchBoard(fname);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "board/searchResult";
		} else {
			model.addAttribute("message", fname + " 관련 검색 실패");
			return "common/error";
		}

	}
	
	// 원글 수정 처리용
	@RequestMapping(value="bupdate.do", method=RequestMethod.GET)
	public String boardUpdateMethod(Board board, Model model) {
		if(boardService.updateBoard(board) > 0) {
			return "redirect:bdetail.do?b_no="+ board.getB_no();
		}else {
			model.addAttribute("message", board.getB_no() + "번 글 수정 실패");
			return "common/error";
		}
	}
		
	// 좋아요 수정 처리용
	@RequestMapping(value="addlike.do", method=RequestMethod.GET)
	public String addLikeUpdateMethod(@RequestParam("b_no") int b_no, Model model) {
		if(boardService.addLikeupdateBoard(b_no) > 0) {
			return "redirect:bdetail.do?b_no="+ b_no;
		}else {
			model.addAttribute("message", b_no + "번 글 좋아요 수정 실패");
			return "common/error";
		}
	}
	
	// 게시물 상세보기에서 'AI 인식 Start' 버튼을 눌렀을 때 실행되어야 함 
	@PostMapping("extractImgtoResult.do")
	@ResponseBody
	public void callPy(@RequestParam("b_no") int b_no,Board board, Model model, @RequestParam("index") int index,
			HttpServletResponse response) throws Exception{
		ArrayList<BoardAttach> aList = boardAttachService.selectAttchList(b_no);
		String filename = aList.get(index).getAtch_file_name();
        String command = "C:/Users/yurim/.conda/envs/yolo7_py38/python.exe";
        String arg1 = "C:/doc_thirdprj/ai/yolov7-main/yolov7-main/detect.py";
        String arg2 = "C:/doc_thirdprj/ai/yolov7-main/yolov7-main/runs/train/yolov7_food19/weights/best.pt";
        String arg3 = "C:\\Users\\yurim\\git\\foodstagram\\foodstagram\\src\\main\\webapp\\resources\\board_upfiles\\" + filename;
        
        int idx = 0;
        int exitVal = 0;

        ProcessBuilder builder;
        BufferedReader br;

        String[] cmd = new String[] {command, arg1, "--weights",arg2, "--source",arg3};
        
        builder = new ProcessBuilder(cmd); //python3 error

        builder.redirectErrorStream(true);
        Process process = builder.start();

        // 자식 프로세스가 종료될 때까지 기다림
        int exitval = process.waitFor();

        //// 서브 프로세스가 출력하는 내용을 받기 위해
        br = new BufferedReader(new InputStreamReader(process.getInputStream(),"euc-kr"));

        String line;
        while ((line = br.readLine()) != null) {
        	//System.out.println(">>> " + line);
        	idx=line.indexOf("@");
            if(line.indexOf("@") >= 0) {            	
                String result = line.substring(idx+1);
                System.out.println(result);
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.append(result.strip());
                out.flush();
                out.close();
            }
        }
        
        if(exitval !=0){
            //비정상종료
        	System.out.println(exitval);
        }
    }
	
}
