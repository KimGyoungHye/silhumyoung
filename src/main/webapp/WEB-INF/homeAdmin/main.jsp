<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%@include file="/WEB-INF/top_bottom/main_top.jsp"%> --%>
<%@include file="/WEB-INF/homeAdmin/top.jsp"%>
<%@include file="/WEB-INF/common/common_bar_graph.jsp"%>
<%@include file="/WEB-INF/common/common_line_graph.jsp"%>
<%@include file="/WEB-INF/common/common_pie_graph.jsp"%>


<main class="container">

<br>

<h1>회사 그래프</h1>
<table width="600" height="200">
   <tr align="center">
      <td>
         <a href="javascript:getBarData('companyDiv','ageNBohum.gp','보험 갯수','나이대 별 보험 갯수')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-bar-chart" viewBox="0 0 16 16">
           <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
         </svg>
         나이대별 보험 갯수
         </a>
      </td>
      <td>
         <a href="javascript:getBarData('companyDiv','mogNBohum.gp','보험 갯수','보험 별 특약 갯수')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-bar-chart-fill" viewBox="0 0 16 16">
              <path d="M1 11a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3zm5-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2z"/>
            </svg>
            보험 별 특약 갯수
         </a>
      </td>
   </tr>
   <tr align="center">
      <td>
      <a href="javascript:getBarData('companyDiv','companyNinsu.gp','보험 갯수','회사별 보험 갯수')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-bar-chart-fill" viewBox="0 0 16 16">
              <path d="M1 11a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3zm5-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2z"/>
            </svg>
            회사별 보험 갯수
            </a>
      </td>
      <td>
         <a href="javascript:getBarData('companyDiv','categoryNinsu.gp','보험 갯수','회사별 보험 갯수')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-bar-chart" viewBox="0 0 16 16">
           <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
         </svg>
         카테고리별 보험 갯수
         </a>
      </td>
   </tr>
   
</table>
<div id="companyDiv">
   <div style='position: relative; width:400px; height:500px;'>
      <canvas id="bar-chart-companyDiv" width="100%" height="500px"></canvas>
   </div>
</div>
<h1>일반 회원 그래프</h1>
<table width="600" height="200">
   <tr align="center">
      <td>
         <a href="javascript:getBarData('memberDiv','insunameNHeart.gp','보험 갯수','유저가 찜한 보험 갯수')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-file-bar-graph" viewBox="0 0 16 16">
           <path d="M4.5 12a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1zm3 0a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm3 0a.5.5 0 0 1-.5-.5v-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-.5.5h-1z"/>
           <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
         </svg>
         유저가 찜한 보험 갯수
         </a>
      </td>   
      <td>
         <a href="javascript:getPieData('memberDiv','gender.gp','남/여','남여 성별 비율')">
         <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-pie-chart-fill" viewBox="0 0 16 16">
           <path d="M15.985 8.5H8.207l-5.5 5.5a8 8 0 0 0 13.277-5.5zM2 13.292A8 8 0 0 1 7.5.015v7.778l-5.5 5.5zM8.5.015V7.5h7.485A8.001 8.001 0 0 0 8.5.015z"/>
         </svg>
         회원가입한 남여 비율
         </a>
      </td>
   </tr>
</table>
<div id="memberDiv" >
   <div style='position: relative; width:1000px; height:500px;'>
      <canvas id="bar-chart-memberDiv" ></canvas>
   </div>
</div>
<br><br>



<br>
</main>
<%@include file="/WEB-INF/homeAdmin/bottom.jsp"%>

<%-- <%@include file="/WEB-INF/top_bottom/main_bottom.jsp"%> --%>