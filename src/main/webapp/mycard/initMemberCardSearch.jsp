<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String c_memberid = "root";
session.setAttribute("c_memberid", c_memberid);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전기차 타요타요 - 회원카드 조회</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/tayotayo/resources/css/styles.css" rel="stylesheet" />
<style>
.subPage {
	background-color: #f4f4f4;
}

.pageBox {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.pageTit {
	font-size: 36px;
	color: #333;
	text-align: center;
	margin-bottom: 25px;
}

.subPageTab {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.subPageTab li {
	display: inline-block;
	margin-right: 10px;
}

.subPageTab a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	display: block;
	padding: 10px;
	text-align: center;
	border: 2px solid #ccc;
	border-radius: 5px;
}

.subPageTab li.on a {
	background-color: #ddd;
}

.tabPage {
	display: none;
}

.tabPage.on {
	display: block;
}

.formBox {
	margin-top: 20px;
}

.nece {
	color: red;
}

.selectBox, .inputBox {
	margin-top: 10px;
}

.btnBox {
	margin-top: 20px;
}

.btn_agree_next {
	display: inline-block;
	padding: 10px 20px;
	background-color: #212529;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn_agree_next:hover {
	background-color: #0056b3;
}

.srchBox {
	margin-top: 30px;
	border: 1px solid #ddd;
	background-color: #f8f8f8;
	padding: 25px;
	margin-bottom: 30px;
}

.srchBox button {
	display: inline-block;
	border-radius: 5px;
	color: #fff;
	background-color: #011533;
	padding: 2px 10px;
	margin-left: 1rem;
}

.srchBox select {
	display: inline-block;
	background: #fff;
	appearance: none;
	height: 30px;
	width: 200px;
	border: 1px solid #d9d9d9;
	border-radius: 5px;
	padding-left: 10px;
}

.tableBox {
	margin-top: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
}

.contentList {
	margin-top: 10px;
	opacity: 1;
	transform: translateY(0px);
}

.table01 {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 700px;
}

.table01 caption {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.table01 colgroup col {
	width: auto;
}

.table01 th, .table01 td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
}

.table01 th.bdNone {
	border: none;
}

.table01 tbody td[colspan="9"] {
	text-align: center;
	font-weight: bold;
	color: #777;
}

.card-num {
	color: #0d6efd;
	cursor: pointer;
}

.card-num:hover {
	color: #084298;
}

.modal-content {
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.modal-header {
	background-color: #212529;
	color: #fff;
	border-bottom: 1px solid #dee2e6;
}

.modal-title {
	font-size: 1.5rem;
}

.modal-body {
	padding: 20px;
}

.btn-close {
	color: #fff;
}

#cardDetailModalBody p {
	margin-bottom: 10px;
}

#cardDetailModalBody p:nth-child(odd) {
	background-color: #f8f9fa;
	padding: 5px;
	border-radius: 5px;
}

#paymentButton {
	background-color: #FFEB00;
	border: none;
	color: #000;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
	border-radius: 5px;
	margin-left: 35%;
}
</style>

</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">전기차 타요타요</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/tayotayo/index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">관리
							및 조회</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/tayotayo/mycard/initMemberCardAction.jsp">회원카드 관리</a></li>
							<li><a class="dropdown-item" href="#">충전요금 조회</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="subPage" id="subPage">
		<div class="pageBox">
			<h3 class="pageTit js-scrollmotion_up"
				style="opacity: 1; transform: translateY(0px);">회원카드 조회</h3>
			<div class="subWrap">
				<ul class="subPageTab" id="subPageTab">
					<li><a href="/tayotayo/mycard/initMemberCardAction.jsp">회원카드/번호
							신청서</a></li>
					<li class="on"><a href="#">회원카드/번호 발급조회</a></li>
				</ul>
				<div class="tabPage"></div>
				<div class="tabPage on">
					<form id="tabForm02" name="tabForm02" method="post"
						action="/tayotayo/mycard/initMemberCardAction.jsp">
						<input type="hidden" name="card_req_seq" value=""> <input
							type="hidden" id="spageId" name="spageId"
							value="spotInspectionList"> <input type="hidden"
							id="srecordCountPerPage" name="srecordCountPerPage" value="10">
						<!-- 페이지에 표시되는 라인 수 -->
						<input type="hidden" id="spageNo" name="spageNo" value="1">
						<input type="hidden" id="spageSize" name="spageSize" value="10">
						<div class="searchWrap js-scrollmotion_up scrolldelay1"
							style="opacity: 1; transform: translateY(0px);">
							<div class="srchBox">
								<span> <em>발급요청사유</em> <select id="s_req_reason"
									name="s_req_reason" title="발급요청사유 선택">
										<option value="">선택</option>
										<option value="신규">신규</option>
										<option value="분실">분실</option>
										<option value="파손">파손</option>
										<option value="기타">기타</option>
								</select>
								</span> <span> <em>발급상태</em> <select id="s_req_status"
									name="s_req_status" title="발급상태 선택">
										<option value="">선택</option>
										<option value="접수">접수</option>
										<option value="접수완료">접수완료</option>
										<option value="배송처리중">배송처리중</option>
										<option value="배송중">배송중</option>
										<option value="발급완료">발급완료</option>
								</select>
								</span>
								<button onclick="fnSearch(1); return false;">조회</button>
							</div>
						</div>
						<p class="result js-scrollmotion_up scrolldelay2"
							style="opacity: 1; transform: translateY(0px);">
							<span id="listCnt" class="nece" style="font-weight: 500;">0</span>건
							조회
						</p>
						<div class="tableBox"></div>
						<div class="contentList js-scrollmotion_up scrolldelay2"
							style="opacity: 1; transform: translateY(0px);">
							<table class="table01" id="membershipTable">
								<colgroup>
									<col style="width: 60px;">
									<col width="200px">
									<col width="60px">
									<col width="40px">
									<col width="200px">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>신청일자</th>
										<th>카드번호</th>
										<th>차량<br>번호
										</th>
										<th>발급상태</th>
										<th>배송지</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="6">조회된 내역이 없습니다</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- <div class="pageList" id="pageingPosition">
							<a href="javascript:" class="first arrow">첫 페이지로</a><a
								href="javascript:" class="prev arrow">이전 페이지</a><a href="#"
								class="current">1</a><a href="#" class="next arrow">다음 페이지</a><a
								href="#" class="last arrow">마지막 페이지</a>
						</div> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="cardDetailModal" tabindex="-1"
		aria-labelledby="cardDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cardDetailModalLabel">회원카드 상세페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="color: #000 !important;"></button>
				</div>
				<div class="modal-body" id="cardDetailModalBody"></div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

	<!-- Core theme JS-->
	<script src="/tayotayo/resources/js/scripts.js"></script>
	<script>
	var c_memberid = "<c:out value='${c_memberid}'/>";
	console.log(c_memberid);
	<%-- function checkLogin() {
        var loggedIn = '<%=session.getAttribute("c_memberId") != null%>
		';
			if (!loggedIn) {
				alert("로그인이 필요합니다.");
			}
		} --%>
		// 멤버쉽 카드 리스트 불러오기
		function getMembershipList() {
			var c_memberid = "<c:out value='${c_memberid}'/>";
			$.ajax({
				type : "GET",
				url : "getMembershipList",
				data: {c_memberid: c_memberid}, 
				success : function(data) {
					populateTable(data);

					$('#membershipTable tbody').on('click', 'td.card-num',
							function() {
								var cardNum = $(this).text();
								getMembershipCardDetails(cardNum);
							});
				},
				error : function() {
					alert("멤버쉽 리스트를 불러오는데 실패했습니다.");
				}
			});
		}

		function populateTable(data) {
			var tbody = $('#membershipTable tbody');

			tbody.empty();

			if (data.length === 0) {
				tbody.append('<tr><td colspan="5">조회된 내역이 없습니다</td></tr>');
			} else {
				$
						.each(
								data,
								function(index, item) {
									var signDate = new Date(item.card_signday);

									if (isNaN(signDate.getTime())) {
										signDate = new Date(item.card_signday
												.replace(/-/g, '/'));
									}
									var formattedSignDate = signDate
											.getFullYear()
											+ '-'
											+ ('0' + (signDate.getMonth() + 1))
													.slice(-2)
											+ '-'
											+ ('0' + signDate.getDate())
													.slice(-2);

									var row = '<tr>'
											+ '<td>'
											+ formattedSignDate
											+ '</td>'
											+ '<td class="card-num" onclick="getMembershipCardDetails(\''
											+ item.card_num + '\')">'
											+ item.card_num + '</td>' + '<td>'
											+ item.car_number + '</td>'
											+ '<td>' + item.card_reason
											+ '</td>' + '<td>' + item.card_addr
											+ '</td>' + '</tr>';
									tbody.append(row);
								});
			}
		}

	/* 	// 페이지 로드 시 로그인 확인 및 멤버쉽 리스트 조회
		checkLogin(); */
		getMembershipList();

		// 멤버쉽 카드 상세 정보 모달
		function getMembershipCardDetails(cardNum) {
			$.ajax({
				type : "GET",
				url : "getMembershipCardDetails?cardNum=" + cardNum,
				success : function(data) {
					populateCardDetails(data);
					$('#cardDetailModal').modal('show');
				},
				error : function() {
					alert("카드 상세 정보를 불러오는데 실패했습니다.");
				}
			});
		}
		// 모달 본문에 카드 상세 정보를 채우는 함수
		function populateCardDetails(data) {
			var modalBody = $('#cardDetailModalBody');
			modalBody.empty();

			if (data) {
				modalBody.append('<p>카드 번호: ' + data.card_num + '</p>');
				modalBody.append('<p>발급 날짜: ' + data.card_signday + '</p>');
				modalBody.append('<p>차량 모델: ' + data.car_model + '</p>');
				modalBody.append('<p>차량 번호: ' + data.car_number + '</p>');
				modalBody.append('<p>발급 이유: ' + data.card_reason + '</p>');
				modalBody.append('<p>배송지: ' + data.card_addr + '</p>');
				modalBody.append('<p>카드 잔액: ' + data.card_balance + '</p>');
				modalBody.append('<p>포인트 잔액: ' + data.card_point + '</p>');

				modalBody
						.append('<button type="button" id="paymentButton"><img src="${pageContext.request.contextPath}/resources/assets/payment_icon_yellow_small.png" alt="KakaoPay Icon"></button>');
				$('#paymentButton').click(function() {
					callPaymentScript(data.card_num, data.card_balance, data.card_point);
				});
			} else {
				modalBody.append('<p>선택한 카드에 대한 상세 정보가 없습니다.</p>');
			}
		}
		// 카카오페이 결제
		function callPaymentScript(cardNum, cardBalance, cardPoint) {
			var IMP = window.IMP;
			IMP.init('imp42285407');
			IMP.request_pay({
				pg : 'kakaopay.TC0ONETIME',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '타요타요 멤버쉽 충전',
				amount : 30000,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var pointMultiplier = 0.05; 
					var newBalance = cardBalance + rsp.paid_amount;
					var newPoint = cardPoint + Math.floor(rsp.paid_amount * pointMultiplier);
					var msg = '결제가 완료되었습니다. ';
					msg += '결제 금액 : ' + rsp.paid_amount;
					
					if (cardNum) {
	                    updateCardBalance(cardNum, newBalance, newPoint);
	                    alert(msg);
	               		location.reload();
	                }
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
			});
		}
		
		function updateCardBalance(cardNum, newBalance, newPoint) {
		    $.ajax({
		        type: 'POST',
		        url: 'updateCardNewBalance',
		        data: { cardNum: cardNum, newBalance: newBalance, newPoint: newPoint },
		        success: function(response) {
		            console.log('멤버쉽 카드 충전이 완료되었습니다.:', response);
		        },
		        error: function(error) {
		            console.error('멤버쉽 카드 충전이 실패했습니다:', error);
		        }
		    });
		}
	</script>

</body>
</html>