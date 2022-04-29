<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fadeM" id="myModal${member.id}" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		<div class="modal-content">
			<div class="modal-header">
<!-- 				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button> -->
				<h4 class="modal-title" id="myModalLabel${member.id}">회원 아이디 [
					${member.id} ]</h4>
			</div>
			<form method="post" action="userStateUpdate.ha">

				<div class="modal-body">
					<p style="text-align:left;">변경할 유저타입을 선택해주세요.</p>
					<div class="row g-10">
					<div class="col-md-14">
					<label class="form-label" >유저타입 </label>
					<input type="text" class="form-control-sm size="10" name="id" value="${member.id}">
				
					<select name="userState" id="userState${member.id}"
						onchange="companyCheck('${member.id}')">
						<c:forEach var="userState" items="${userStateArr}"
							varStatus="status">
							<option
								<c:if test="${member.userState==userState }">
      				selected
      			</c:if>>${userState }</option>
						</c:forEach>
					</select>
			
					<div>
						<p id="cregiP${member.id}" style="display: none;">
							<label for="cregi_num">사업자등록번호</label> <input type="text"
								name="cregi_num" class="form-control-sm" id="cregi_num${member.id }" value="" size="10">
							<input type="button" class="btn btn-outline-primary btn-sm"  value="조회"
								onClick="searchCname('${member.id}')"> <br>
							<label>회사명</label> <input type="text" name="cname"
								id="cname${member.id}" class="form-control-sm" value="${cname }">
						</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-success" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-success">변경 사항 저장</button>
				</div>
			</form>

		</div>
		<!-- 모달 콘텐츠 -->
	</div>
	<!-- 모달 다이얼로그 -->
</div>
<!-- 모달 전체 윈도우 -->