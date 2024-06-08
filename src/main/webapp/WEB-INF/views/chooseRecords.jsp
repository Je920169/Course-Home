<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>選課紀錄列表</title>
     
</head>
<body>
    <h2>選課紀錄列表</h2>
    
    
    ${ course }
    <a href="${pageContext.request.contextPath}/chooseRecords/new">新增選課紀錄</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>學生ID</th>
                <th>課程ID</th>
                <th>學分數</th>
                <th>選課時間</th>
                <th>動作</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="chooseRecord" items="${ chooseRecordsDtos }">
                <tr>
                    <td>${chooseRecord.id}</td>
                    <td>${chooseRecord.studentid}</td>
                    <td>${chooseRecord.courseid}</td>
                    <td>${chooseRecord.credits}</td>
                  	<td>${chooseRecord.choosetime}</td>
                    <td>${chooseRecord.action}</td>
                    <td>
                    	<span class="date-text" data-chooseRecord-id="${ chooseRecord.id }">
                    	${ chooseRecord.choosetime }
                    	</span>
                    	<input class="date-input" type="date"
                    		   data-chooseRecord-id="${ chooseRecord.id }"
                    		   value="${chooseRecord.choosetime}" style="display: none;" />
        
                        <a href="${pageContext.request.contextPath}/chooseRecords/${chooseRecord.id}">查看</a>
                        <a href="${pageContext.request.contextPath}/chooseRecords/edit/${chooseRecord.id}">編輯</a>
                        <a href="${pageContext.request.contextPath}/chooseRecords/delete/${chooseRecord.id}">刪除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>