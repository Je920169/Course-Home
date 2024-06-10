<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
	${ student }
    <title>選課紀錄列表</title>
     
</head>
<body>
	 <header>
        <img src="image/NJU.png" alt="">
        <p>Course Enrollment System</p>
      </header>
      
	 <nav>
        <a href="index.html" class="active">首頁</a>
        <a href="index.html" class="active">課程列表</a>
        <a href="index.html" class="active">已選課程</a>
        <a href="index.html" class="active">課表</a>
        <a href="index.html" class="active">登出</a>
    </nav>




    <h2>選課紀錄列表</h2>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" />
    
    
    <a href="${pageContext.request.contextPath}/chooseRecords/new">新增選課紀錄</a>
    
    <table class="pure-table pure-table-bordered" border="1">
        <thead>
            <tr>
                <th>課程序號</th>
                <th>科目</th>
                <th>教師姓名</th>
                <th>必/選修</th>
                <th>上課地點</th>
                <th>上課時間</th>
                <th>人數上限</th>
                <th>學分數</th>
                <th>備註</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="course" items="${ course }">
                <tr>
                    <td>${course.id}</td>
                    <td>${course.subject}</td>
                    <td>${course.teacherId}</td>
                    <td>${course.courseType}</td>
                  	<td>${course.place}</td>
                    <td>${course.time}</td>
                    <td>${course.quota}</td>
                    <td>${course.credits}</td>
                    <td>${course.remark}
                
                        <a href="${pageContext.request.contextPath}/chooseRecords/${chooseRecord.id}">查看</a>
                        <a href="${pageContext.request.contextPath}/chooseRecords/edit/${chooseRecord.id}">編輯</a>
                        <a href="${pageContext.request.contextPath}/chooseRecords/delete/${chooseRecord.id}">刪除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    
    
    
    <table class="pure-table pure-table-bordered" border="1">
        <thead>
            <tr>
                <th>選課序號</th>
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