<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ include file="header.html" %>
		
		<sec:authorize access="isAuthenticated()">
			
			<div class="package">
			
				<div class="submitform">
					File Upload
				        <form method="post" commandName="FORM" action="/submit/upload" enctype="multipart/form-data">
				            <input type="file" name="file"/><br/>
				            <input type="submit"/>
				        </form>
				</div>
				
		    	<div class="submitform">
		    	YouTube
		        <form method="post" action="/submit/youtube">
		            <input type="text" name="url"/><br/>
		            <input type="submit"/>
		        </form>
		        </div>
		        
	        </div>
		
		</sec:authorize>
		
		<br />

		<div id="menu">
			<c:forEach items="${queue}" var="bucket">
			
				<div id="bucket">
				<c:forEach items="${bucket}" var="qi">

					<div class="package">
						
						<c:if test="${not empty qi.file.artLocation}">
							<div class="art">
								<img src="<c:url value="/resources/${qi.file.artLocation}"/>"/>
							</div>
						</c:if>
						
						
							<div class="info">
							<div class="track-data">
									${qi}
								</div>
								<div class="user">
									${qi.userName}
								</div>
							</div>
													
							<div class="control">
								<c:if test="${qi.userName == username}">
									<c:if test='${qi.status != "PLAYING"}'>
										<a href="<c:url value="/a/move/up/${qi.bucket}"/>">Up</a> 
										<a href="<c:url value="/a/move/down/${qi.bucket}"/>">Down</a>
									</c:if>
								</c:if>
								<sec:authorize access="!hasRole('ROLE_ADMIN')">	
									<c:if test="${qi.userName == username}">
									<c:if test='${qi.status != "PLAYING"}'>
										<a href="<c:url value="/a/delete/${qi.bucket}"/>">Del</a>
									</c:if>
								</c:if>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="<c:url value="/a/delete/${qi.bucket}"/>">Del</a>
								</sec:authorize>
								
								
								
								
								
								
								
							</div>
						</div>
					
			</c:forEach>
			</div>
		</c:forEach>
		</div>
<%@ include file="footer.html" %>