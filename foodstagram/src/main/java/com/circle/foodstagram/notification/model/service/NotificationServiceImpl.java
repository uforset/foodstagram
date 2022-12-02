package com.circle.foodstagram.notification.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.notification.model.dao.NotificationDao;
import com.circle.foodstagram.notification.model.vo.Notification;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService{
	
	@Autowired
	private NotificationDao notificationDao;

	@Override
	public ArrayList<Notification> selectAll() {
		return notificationDao.selectList();	
	}

	@Override
	public int updateNotification(String userid) {
		return notificationDao.updateNotification(userid);
	}

	@Override
	public Notification selectNotification(String userid) {
		return notificationDao.selectNotification(userid);
	}	
	

}
