package com.circle.foodstagram.notification.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.notification.model.vo.Notification;

@Repository("notificationDao")
public class NotificationDao {
	
	@Autowired
	private SqlSessionTemplate session;


	public ArrayList<Notification> selectList(){
		List<Notification> list = session.selectList("notificationMapper.selectNotiAll");
		return (ArrayList<Notification>)list;
	}
	//최신 공지글 읽음 여부 확인용
	public int updateNotification(String userid) {
		return session.update("notificationMapper.updateNotification", userid);
	}
	public Notification selectNotification(String userid) {
		return session.selectOne("notificationMapper.selectNotification", userid);
	}
}
