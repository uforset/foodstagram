package com.circle.foodstagram.notification.model.service;

import java.util.ArrayList;

import com.circle.foodstagram.notification.model.vo.Notification;

public interface NotificationService {
	ArrayList<Notification> selectAll();
	int updateNotification (String userid);
	Notification selectNotification(String userid);
	int insertNotification(String userid);
}
