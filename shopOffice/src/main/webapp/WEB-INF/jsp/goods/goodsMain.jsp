<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="main" class="main">

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type="hidden" id="ctCd" name="ctCd"> <input
								type="hidden" id="ctLevel" name="ctLevel"> <input
								type="hidden" id="upCtCd" name="upCtCd"> <input
								type="hidden" id="hsupplierCd" name="supplierCd">


							<table class="col-lg-12">
								<tr>
									<td>
										<div class="row mb-4">
											<label for="inputText" class="col-sm-2 col-form-label">상품명</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="goodsName" name="goodsName">
											</div>
										</div>
									</td>
									<td>
										<div class="row mb-4">
											<label for="inputText" class="col-sm-4 col-form-label">상품상태</label>
											<div class="col-sm-4">
												<select class="form-control" id="goodsStatus"
													name="goodsStatus">
													<option value=''>선택</option>
													<option value='T1'>판매중</option>
													<option value='T2'>판매종료</option>
												</select>
											</div>
										</div>
									</td>
									<td >
										<div style="display: flex;" class="row mb-4">
											<label for="inputText" class="col-sm-4 col-form-label">카테고리</label>
											<div class="col-sm-4">
												<select class="form-control" id="topCt" name="topCt"
													onchange="categoryChoose(this,'1')">
													<option value=''>대</option>
												</select> <select class="form-control" id="middleCt" name="middleCt"
													onchange="categoryChoose(this,'2')">
													<option value=''>중</option>
												</select> <select class="form-control" id="subCt" name="subCt"
													onchange="categoryChoose(this,'3')">
													<option value=''>소</option>
												</select>
											</div>
										</div>
									</td>
									<td rowspan="2">
										<div class="row mb-4">
											<label for="inputText" class="col-sm-4 col-form-label">거래처</label>
											<div class="col-sm-4">
												<select class="form-control" id="supplierName"
													name="supplierName">
												</select>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td colspan="5" style="text-align: right;">
										<button type="button" class="btn btn-success"
											onclick="register();">등록</button>
										<button type="button" class="btn btn-info" onclick="search();">조회</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="goodsTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">상품코드</th>
									<th scope="col">상품명</th>
									<th scope="col">카테고리</th>
									<th scope="col">판매가</th>
									<th scope="col">재고량</th>
									<th scope="col">등록일</th>
									<th scope="col">상품상태</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
						<!-- End Pagination with icons -->
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<div class="modal fade" id="goodsInfo" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상품등록/수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<form id = goodsform >
			
				<table class="table table-hover" id="goodsDetailTable">
					<thead>
						<tr>
							<th scope="row">상품코드</th>
							<td>
							<input type="text" class="form-control" id="mgoodsCd" name="goodsCd">
							</td>
							<th>(상품코드는 수정이 불가합니다.)</th>
						</tr>
						<tr>
							<th scope="row">상품명</th>
							<td>
							<input type="text" class="form-control" id="mgoodsName" name="goodsName">
							</td>
						</tr>
						<tr>
							
							<th scope="row">정상가</th>
							<td>
							<input type="text" class="form-control" id="mnormalPrice" name="normalPrice">
							</td>
							<th scope="row">판매가</th>
							<td>
							<input type="text" class="form-control" id="msellPrice" name="sellPrice">
							</td>
						</tr>
						<tr>
							
							<th scope="row">재고수량</th>
							<td>
							<input type="text" class="form-control" id="mivQty" name="ivQty">
							</td>
							<th scope="row">상품상태</th>
							<td>
							<select class="form-control" id="mgoodsStatus" name="goodsStatus">
								<option value=''>선택</option>
								<option value='T1'>판매중</option>
								<option value='T2'>판매종료</option>
							</select>
							</td>
							
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td style="display: flex;">
							<select class="form-control" id="mtopCt" name="topCt" onchange="categoryChoose(this,'1')">
								<option value=''>대</option>
							</select> 
							<select class="form-control" id="mmiddleCt" name="middleCt" onchange="categoryChoose(this,'2')">
								<option value=''>중</option>
							</select>
							 <select class="form-control" id="msubCt" name="subCt" onchange="categoryChoose(this,'3')">
								<option value=''>소</option>
							</select>
							</td>
							<th scope="row">거래처</th>
							<td>
							<select class="form-control" id="msupplierName" name="supplierCd">
							<option value=''>선택</option>
							</select>
							</td>
						</tr>
						<tr>
							<th scope="row">섬네일</th>
							<td>
							<input type="text" class="form-control" id="mthumnailUrl" name="thumnailUrl">
							</td>
						</tr>
						<tr>
							<th scope="row">이미지</th>
						</tr>
						<tr>
							<th scope="row">설명</th>
							<td><textarea id="mcontent" name="content"></textarea></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="updateGoodsDetail();" id='btnUpdate'>수정</button>
				<button type="button" class="btn btn-primary" onclick="insertGoodsDetail();" id="btnInsert">등록</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End Vertically centered Modal-->

<form id="hiddenform">
	<input type="hidden" id="sctCd" name="ctCd"> <input
		type="hidden" id="sctLevel" name="ctLevel"> <input
		type="hidden" id="sgoodsCd" name="goodsCd">
</form>


<script>
 //< ---------------------상품조회---------------------------->
	function search() {
		call_server(searchform, '/goods/searchGoods', getGoodsList);
	}

	function getGoodsList(list) {
		$('#goodsTable > tbody').empty();
		for (var i = 0; i < list.length; i++) {
			str = "<tr onclick=\"goodsDetail('" + list[i].goodsCd
					+ "');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">1</th>";
			str += "<td>" + list[i].goodsCd + "</td>";
			str += "<td>" + list[i].goodsName + "</td>";
			str += "<td>" + list[i].ctName + "</td>";
			str += "<td>" + list[i].sellPrice + "</td>";
			str += "<td>" + list[i].ivQty + "</td>";
			str += "<td>" + list[i].regDt + "</td>";
			str += "<td>" + list[i].goodsStatus + "</td>";
			str += "</tr>";
			$('#goodsTable').append(str);
		}
	} 
 // < ---------------------상품조회끝---------------------------->
 
 // < ---------------------상품디테일---------------------------->
	function goodsDetail(cd) {
		$('#btnUpdate').show();
		$('#btnInsert').hide();
		$('#sgoodsCd').val(cd);
		call_server(hiddenform, '/goods/goodsDetail', displayGoodsDetail);
	}

	function displayGoodsDetail(vo) {
	   $('#mmiddleCt').empty();
        $('#mmiddleCt').append("<option value=''>중</option>");
        $('#msubCt').empty();
        $('#msubCt').append("<option value=''>소</option>");
        
        for (var i = 0; i < vo.mCategoryList.length; i++) {
            $('#mmiddleCt').append(
                    "<option value='"+vo.mCategoryList[i].ctCd+"'>"
                            + vo.mCategoryList[i].ctName + "</option>");
        }
        for (var i = 0; i < vo.sCategoryList.length; i++) {
            $('#msubCt').append(
                    "<option value='"+vo.sCategoryList[i].ctCd+"'>"
                            + vo.sCategoryList[i].ctName + "</option>");
        }
        
		$('#goodsDetailTable > tbody').empty();

		$("#mgoodsCd").val(vo.goodsCd);
		$("#mgoodsName").val(vo.goodsName);
		$("#mnormalPrice").val(vo.normalPrice);
		$("#msellPrice").val(vo.sellPrice);
		$("#mivQty").val(vo.ivQty);
		$("#mtopCt").val(vo.topCt);
		$("#mmiddleCt").val(vo.middleCt);
		$("#msubCt").val(vo.subCt);
		$("#mgoodsStatus").val(vo.goodsStatus);
		$("#msupplierName").val(vo.supplierCd);
		$("#mcontent").val(vo.content);
 
		$('#goodsInfo').modal('show');
	    $('#mgoodsCd').prop('readonly', true);

	}
	
 // < ---------------------상품디테일끝---------------------------->
 
 // < ---------------------카테고리선택---------------------------->
	function categoryChoose(cd, level) {

		$('#ctCd').val($(cd).val());
		$('#ctLevel').val(Number(level) + 1);
		$('#upCtCd').val($(cd).val());
		if (level < 3) {
			call_server(searchform, '/goods/categoryChoose', handleCategoryChoose);
		}
	}

	function handleCategoryChoose(list) {
		if ($('#ctLevel').val() == 1) {
			$('#topCt').empty();
			$('#topCt').append("<option value=''>대</option>");
		} else if ($('#ctLevel').val() == 2) {
			$('#middleCt').empty();
			$('#middleCt').append("<option value=''>중</option>");
		} else if ($('#ctLevel').val() == 3) {
			$('#subCt').empty();
			$('#subCt').append("<option value=''>소</option>");
		}

		for (var i = 0; i < list.length; i++) {
			var str = "<option value='" + list[i].ctCd + "'>" + list[i].ctName
					+ "</option>";
			if ($('#ctLevel').val() == 1) {
				$('#topCt').append(str);
				$('#mtopCt').append(str);
			} else if ($('#ctLevel').val() == 2) {
				$('#middleCt').append(str);
				$('#mmiddleCt').append(str);
			} else if ($('#ctLevel').val() == 3) {
				$('#subCt').append(str);
				$('#msubCt').append(str);
			}
		}
	}
   // < ---------------------카테고리선택끝---------------------------->

   // < ---------------------새상품등록---------------------------->

	function register() {
		$('#btnUpdate').hide();
		$('#btnInsert').show();
		
	    $('#mgoodsCd').val('');
	    $('#mgoodsName').val('');
	    $('#mnormalPrice').val('');
	    $('#msellPrice').val('');
	    $('#mivQty').val('');
	    $('#mgoodsStatus').val('');
	    $('#msupplierName').val('');
	    $('#mcontent').val('');

	    
	    $('#mmiddleCt').empty();
	    $('#mmiddleCt').append("<option value=''>중</option>");
	    $('#msubCt').empty();
	    $('#msubCt').append("<option value=''>소</option>");

	   
	    $('#goodsInfo').modal('show');
	  
	}

	function insertGoodsDetail(){
    	if (confirm("신규상품을 등록하시겠습니까?!")) {
    	call_server(goodsform,'/goods/insertGoodsDetail',insertGoods);
    	}
    }

    function insertGoods(cnt) {
		if (cnt > 0 ) {
		    alert("신규상품 등록성공");
		} else {
		    alert("실패");
		}
	}
    
    // < ---------------------새상품등록끝---------------------------->
	
    // < ---------------------상품수정---------------------------->
    
	 function updateGoodsDetail(){
	    	if (confirm("상품정보를 수정하시겠습니까?")) {
	    		call_server(goodsform,'/goods/updateGoodsDetail',updategoods);
	    	}   
	    }
	  
	    function updategoods(cnt) {
			if (cnt > 0 ) {
			    alert("상품정보 수정성공");
			} else {
			    alert("실패");
			}
		}
	 // < ---------------------상품수정끝---------------------------->
	
	$(document).ready(function() {
		categoryChoose('', '0');
		call_server(searchform, '/goods/supplierName', displySupplierName);
	});

	function displySupplierName(list) {
		$('#supplierName').empty();
		$('#supplierName').append("<option value=''>선택</option>");
		for (var i = 0; i < list.length; i++) {
			var str = "<option value='" + list[i].supplierCd + "'>" + list[i].supplierName + "</option>";
			$('#supplierName').append(str);
			$('#msupplierName').append(str);
			
		}

	}
</script>
