<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/member/top.jsp"%>
<%
	String myMog = "모그";
%>

<div class="container">
	<table class="table table-striped">
		<tr class="table-light" style="width: 100%">
			<td>
				<h3>${bohumDataDetailInfoArr[0].prdNm  }</h3>
			</td>
			<c:if test="${bohumDataDetailInfoArr[0].cimage!=null}">
				<td><img
					src="<%=request.getContextPath() %>/resources/company/${bohumDataDetailInfoArr[0].cimage}"
					style="float: right;" width=100 height=100></td>
			</c:if>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<td>회사 코드</td>
			<td>${bohumDataDetailInfoArr[0].cmpyCd  }</td>
			<td>회사 이름</td>
			<td>${bohumDataDetailInfoArr[0].cmpyNm  }</td>
		</tr>
		<tr>
			<td>보험 이름</td>
			<td>${bohumDataDetailInfoArr[0].prdNm  }</td>
			<td>보험 종류</td>
			<td>${bohumDataDetailInfoArr[0].mog  }</td>
		</tr>
		<c:if test="${bohumDataDetailInfoArr[0].link!=null  }">
			<tr>
				<td>보험 기본 보장 정보</td>
				<td>${bohumDataDetailInfoArr[0].maincont  }</td>
				<td>링크</td>
				<td><a href="${bohumDataDetailInfoArr[0].link  }">${bohumDataDetailInfoArr[0].link  }</a></td>
			</tr>
		</c:if>
		<tr>
			<td>보험 종류</td>
			<td>${bohumDataDetailInfoArr[0].ptrn  }</td>
			<td>정보 수정 일</td>
			<td>${bohumDataDetailInfoArr[0].basDt }</td>
		</tr>
	</table>
	<c:set value="0" var="totalPriceF" />
	<c:set value="0" var="totalPriceM" />
	<c:set value="<%=myMog%>" var="myMog" />
	<div class="row">
		<div class="col-6">
			<table class="table" style="display: inline; width: 100%">
				<tr class="table-light">
					<th>특약 종류</th>
					<c:if test="${memberGender!='여자' }">
						<th>${bohumDataDetailInfoArr[0].age }대남자보험료</th>
					</c:if>
					<c:if test="${memberGender!='남자' }">
						<th>${bohumDataDetailInfoArr[0].age }대여자보험료</th>
					</c:if>
				</tr>
				<c:if test="${fn:length(bohumDataDetailInfoArr)==0 }">
					<tr>
						<td colspan="6">DB정보가 없거나 특약 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${bohumDataDetailInfoArr }" varStatus="status"
					var="bohumData">
					<tr>
						<td>${bohumData.mog }</td>
						<c:if test="${memberGender!='여자' }">
							<td align="right"><fmt:formatNumber
									value="${bohumData.mlInsRt }" groupingUsed="true" />원<br>
							</td>
							<c:set value="${totalPriceM+ bohumData.mlInsRt}"
								var="totalPriceM" />
						</c:if>

						<c:if test="${memberGender!='남자' }">
							<td align="right"><fmt:formatNumber
									value="${bohumData.fmlInsRt }" groupingUsed="true" />원<br>
							</td>
							<c:set value="${totalPriceF+ bohumData.fmlInsRt}"
								var="totalPriceF" />
						</c:if>
					</tr>
					<c:set value="${myMog},${bohumData.mog }" var="myMog" />
				</c:forEach>
				<tr class="table-light">
					<td>특약 전체 총 액</td>
					<c:if test="${memberGender!='여자' }">
						<td align="right"><fmt:formatNumber value="${totalPriceM }"
								groupingUsed="true" />원<br></td>
					</c:if>
					<c:if test="${memberGender!='남자' }">
						<td align="right"><fmt:formatNumber value="${totalPriceF }"
								groupingUsed="true" />원<br></td>
					</c:if>
				</tr>
			</table>
		</div>

		<div class="col-6">
			<div class="accordion accordion-flush" id="avgAgeNBohum">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button btn-secondary collapsed"
							type="button" data-bs-toggle="collapse"
							data-bs-target="#flush-collapseOne" aria-expanded="false"
							aria-controls="flush-collapseOne">
							${bohumDataDetailInfoArr[0].age }대 평균보험료 보기</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne" data-bs-parent="#avgAgeNBohum">
						<div class="accordion-body">
							<c:set value="0" var="totalPriceF" />
							<c:set value="0" var="totalPriceM" />
							<table class="table" style="display: inline; margin: auto;">
								<tr class="table-active">
									<th>특약 종류</th>
									<c:if test="${memberGender!='여자' }">
										<th>${bohumDataDetailInfoArr[0].age }대남자평균보험료</th>
									</c:if>
									<c:if test="${memberGender!='남자' }">
										<th>${bohumDataDetailInfoArr[0].age }대여자평균보험료</th>
									</c:if>
								</tr>
								<c:if test="${fn:length(avgByAgeArr)==0 }">
									<tr>
										<td colspan="6">DB정보가 없거나 평균 정보가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${avgByAgeArr }" varStatus="status"
									var="bohumData">
									<tr
										<c:if test="${fn:contains(myMog,bohumData.mog) }">
										 class="table-light"
										</c:if>>
										<td>${bohumData.mog }</td>
										<c:if test="${memberGender!='여자' }">
											<td align="right"><fmt:formatNumber
													value="${bohumData.mlInsRt }" groupingUsed="true" />원<br>
											</td>
											<c:set value="${totalPriceM+ bohumData.mlInsRt}"
												var="totalPriceM" />
										</c:if>

										<c:if test="${memberGender!='남자' }">
											<td align="right"><fmt:formatNumber
													value="${bohumData.fmlInsRt }" groupingUsed="true" />원<br>
											</td>
											<c:set value="${totalPriceF+ bohumData.fmlInsRt}"
												var="totalPriceF" />
										</c:if>
									</tr>
								</c:forEach>
								<tr class="table-active">
									<td align="center">특약 전체 총 액</td>
									<c:if test="${memberGender!='여자' }">
										<td align="right"><fmt:formatNumber value="${totalPriceM }"
								groupingUsed="true" />원<br></td>
									</c:if>
									<c:if test="${memberGender!='남자' }">
										<td align="right"><fmt:formatNumber value="${totalPriceF }"
								groupingUsed="true" />원<br></td>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/member/bottom.jsp"%>
