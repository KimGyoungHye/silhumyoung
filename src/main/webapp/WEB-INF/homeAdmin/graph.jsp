<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="/WEB-INF/top_bottom/main_top.jsp"%> --%>
 <%@include file="/WEB-INF/homeAdmin/top.jsp"%>
<br><br><Br>

<h1>관리자메인!</h1>


<%@include file="/WEB-INF/common/common_bar_graph.jsp"%>
<%@include file="/WEB-INF/common/common_line_graph.jsp"%>
<%@include file="/WEB-INF/common/common_pie_graph.jsp"%>

<h1>바 그래프</h1>
<div id="barDiv">
	<canvas id="bar-chart" width="900" height="380"></canvas>
</div>
<br>
<input type="button" value="나이대별 보험 갯수" onclick="getBarData('ageNBohum.gp','보험 갯수','나이대 별 보험 갯수')">
<br>
<input type="button" value="보험별 특약 갯수" onclick="getBarData('mogNBohum.gp','보험 갯수','보험 별 특약 갯수')">
<br>
<input type="button" value="유저가 찜한 보험 갯수..?" onclick="getBarData('insunameNHeart.gp','보험 갯수','유저가 찜한 보험 갯수')">
<br>
<br>
<h1>라인 그래프</h1>
<div id="lineDiv">
	<canvas id="line-chart" width="900" height="380"></canvas>
</div>
<br>
<input type="button" value="나이대별 보험 갯수" onclick="getLineData('ageNBohum.gp','보험 갯수','나이대 별 보험 갯수')">
<br>
<input type="button" value="보험별 특약 갯수" onclick="getLineData('mogNBohum.gp','보험 갯수','보험 별 특약 갯수')">
<br>
<input type="button" value="유저가 찜한 보험 갯수..?" onclick="getLineData('insunameNHeart.gp','보험 갯수','유저가 찜한 보험 갯수')">
<br>
<br>
<h1>파이 그래프</h1>
<div id="pieDiv">
	<canvas id="pie-chart" width="900" height="380"></canvas>
</div>
<br>
<input type="button" value="나이대별 보험 갯수" onclick="getPieData('ageNBohum.gp','보험 갯수','나이대 별 보험 갯수')">
<br>
<input type="button" value="보험별 특약 갯수" onclick="getPieData('mogNBohum.gp','보험 갯수','보험 별 특약 갯수')">
<br>
<input type="button" value="유저가 찜한 보험 갯수..?" onclick="getPieData('insunameNHeart.gp','보험 갯수','유저가 찜한 보험 갯수')">
<br>
<br>
 <%@include file="/WEB-INF/homeAdmin/bottom.jsp"%>

<%-- <%@include file="/WEB-INF/top_bottom/main_bottom.jsp"%> --%>
    