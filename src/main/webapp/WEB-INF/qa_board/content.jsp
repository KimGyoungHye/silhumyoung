<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<style>
   .table{
      width:90%;
   }
</style>
<center>
<br><br>
<div class="container">
      <table class="table table-bordered">
         <tr>
            <td align="center" class="table-light">글번호</td>
            <td align="center">${ qA_BoardBean.no }</td>
            <td align="center" class="table-light">조회수</td>
            <td align="center">${ qA_BoardBean.readcount }</td>
         </tr>
         <tr>
            <td align="center" class="table-light">작성자</td>
            <td align="center">${ qA_BoardBean.writer }</td>
            <td align="center" class="table-light">작성일</td>
            <td align="center">
               <fmt:parseDate var="parseDateDay" value="${qA_BoardBean.reg_date }" pattern="yyyy-MM-dd"/>
               <fmt:formatDate var="formatDateDay" value="${parseDateDay }" pattern="yyyy-MM-dd"/>
               ${formatDateDay }
            </td>
         </tr>
         <tr>
            <td align="center" class="table-light">카테고리</td>
            <td align="center">${ qA_BoardBean.category  }</td>
            <td align="center" class="table-light">보험사</td>
            <td align="center">${ qA_BoardBean.company  }</td>
         </tr>
         <tr>
            <td align="center" class="table-light">글제목</td>
            <td align="center" colspan="3">${ qA_BoardBean.title }</td>
         </tr>
         <tr height="150">
            <td align="center" class="table-light">글내용</td>
            <td align="center" colspan="3">${ qA_BoardBean.content }</td>
         </tr>
         <tr>
            <td align="center" class="table-light">첨부파일</td>
            <td align="center" colspan="3">
               <c:if test="${qA_BoardBean.image==null }">
                  첨부파일 없음
               </c:if>
               <a href="<%=request.getContextPath()%>/resources/qa_board/QA_BoardFiles/${qA_BoardBean.image}">${qA_BoardBean.image}</a>
            </td>
         </tr>
         <tr align="center" height="30">
         <td class="table-light"></td>
            <td colspan="3" class="table-light">
               <input type="button" value="글수정" class="btn btn-success"
               onclick="location.href='update.qa?no=${ qA_BoardBean.no }&pageNumber=${ pageNumber}'">
               <input type="button" value="글삭제" class="btn btn-success"
               onClick="location.href='delete.qa?no=${ qA_BoardBean.no}&pageNumber=${ pageNumber}&image=${qA_BoardBean.image }'">
               <input type="button" value="답글쓰기" class="btn btn-success"
               onClick="location.href='reply.qa?ref=${ qA_BoardBean.getRef()}&re_step=${ qA_BoardBean.getRe_step()}&re_level=${ qA_BoardBean.getRe_level()}&pageNumber=${pageNumber }&no=${qA_BoardBean.no } '">
               <input type="button" value="글목록" class="btn btn-success"
               onClick="location.href='list.qa?pageNumber=${ pageNumber}'">
            </td>
         </tr>
      </table>
      </div>
</center>
<%@include file="/WEB-INF/member/bottom.jsp" %>