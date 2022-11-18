package com.circle.foodstagram.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	private static final long serialVersionUID = 1471945737302217844L;
	
	private int noticeno;
	private String userid;
	private String noticetitle;
	private Date noticedate;
	private String noticecontent;
	private String notice_upfile;
	private String notice_refile;
	private int readcount;
	private int importance;
	
	public Notice() {}

	private Notice(int noticeno, String userid, String noticetitle, Date noticedate, String noticecontent,
			String notice_upfile, String notice_refile, int readcount, int importance) {
		super();
		this.noticeno = noticeno;
		this.userid = userid;
		this.noticetitle = noticetitle;
		this.noticedate = noticedate;
		this.noticecontent = noticecontent;
		this.notice_upfile = notice_upfile;
		this.notice_refile = notice_refile;
		this.readcount = readcount;
		this.importance = importance;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public Date getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public String getNotice_upfile() {
		return notice_upfile;
	}

	public void setNotice_upfile(String notice_upfile) {
		this.notice_upfile = notice_upfile;
	}

	public String getNotice_refile() {
		return notice_refile;
	}

	public void setNotice_refile(String notice_refile) {
		this.notice_refile = notice_refile;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getImportance() {
		return importance;
	}

	public void setImportance(int importance) {
		this.importance = importance;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", userid=" + userid + ", noticetitle=" + noticetitle + ", noticedate="
				+ noticedate + ", noticecontent=" + noticecontent + ", notice_upfile=" + notice_upfile
				+ ", notice_refile=" + notice_refile + ", readcount=" + readcount + ", importance=" + importance + "]";
	}
}
