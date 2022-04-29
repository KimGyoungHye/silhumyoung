<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] genderArr = {"남자","여자"};
	String[] jobArr = {"화이트 칼라","블루 칼라"}; 
	String[] marriageArr = {"미혼","기혼"};
	String[] diseaseArr = {"천식","암","고혈압","당뇨","디스크"}; 
	String[] family_historyArr = {"암","고혈압","당뇨","디스크"}; 
%>
<c:set var="genderArr" value="<%=genderArr %>"/>
<c:set var="jobArr" value="<%=jobArr %>"/>
<c:set var="marriageArr" value="<%=marriageArr %>"/>
<c:set var="diseaseArr" value="<%=diseaseArr %>"/>
<c:set var="family_historyArr" value="<%=family_historyArr %>"/>
