<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

        <div class="container">
            <div>
                <c:forEach var="room" items="${ list }">
                	<li><a href="/foodstagram/chat/room?roomId=${room.roomId}">[${room.name}]</a></li>
                </c:forEach>
            </div>
        </div>
        <form action="/foodstagram/chat/room" method="post">
            <input type="text" name="name" class="form-control">
            <button class="btn btn-secondary">개설하기</button>
        </form>


</html>