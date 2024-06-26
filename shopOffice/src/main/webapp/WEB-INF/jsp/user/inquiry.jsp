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
              <table class="col-lg-12">
              	<tr>
              		<td>
		              	<div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">회원명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="userName" name="userName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-4 col-form-label">답변여부</label>
		                  <div class="col-sm-4">
		                    <select class="form-control" id="replyYn" name="replyYn">
		                    	<option value=''>선택</option>
		                    	<option value='Y'>예</option>
		                    	<option value='N'>아니오</option>
		                    </select>
		                  </div>
		                </div>		
              		</td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick="search();">조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-1 col-form-label">등록일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="regDtFrom" name="regDtFrom">
		                  </div>
		                  ~
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="regDtTo" name="regDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              	</tr>
              </table>
                
                
                
              </form>
              
            </div>
          </div>
           <div class="card">
            <div class="card-body">
              <!-- Table with hoverable rows -->
              <table class="table table-hover" id="userTable">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">문의유형</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의등록일</th>
                    <th scope="col">답변여부</th>
                    <th scope="col">답변등록일</th>
                    <th scope="col">삭제여부</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
  <div class="modal fade" id="memberInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">고객문의</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <table class="table table-hover" id="memberTable">
		    <thead>
		          <tr>
		            <th scope="row">제목</th>
		            <td id="title"></td>
		        </tr>
		        <tr>
		            <th scope="row">유형</th>
		            <td id="boardType"></td>
		        </tr>
		        <tr>
		            <th scope="row">회원ID/명</th>
		            <td id="userIdAndName"></td>
		        </tr>
		        <tr>
		            <th scope="row">문의일</th>
		            <td id="regDt"></td>
		        </tr>
		        <tr>
		            <th scope="row">첨부파일</th>
		            <td id="attchFile"></td>
		        </tr>
		        <tr>
		            <th scope="row">문의내용</th>
		            <td id="content"></td>
		        </tr>
		        <tr>
		            <th scope="row">답변내용</th>
		            <td>
		                <textarea id="replyContent"></textarea>
		            </td>
		        </tr>
		    </thead>
		    <tbody>
		    </tbody>
		</table>

              
              
           </div>
           <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="updateReply();">답변등록</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  	
  	<form id="hiddenform" >
    <input type="hidden" id= "huserId" name="userId" >
    <input type="hidden" id= "boardSeq" name="boardSeq" >
    <input type="hidden" id= "hreplyContent" name="replyContent" >
	</form>
  	
  
 
<script>
	function search(){
		call_server(searchform,'/user/searchinquiry',getInquiryList);
	}
	
	function getInquiryList(list){
		$('#userTable > tbody').empty();
		for(var i=0;i<list.length;i++){
			str="<tr onclick=\"inquiryDetail('"+list[i].userId+"','"+list[i].boardSeq+"');\" style=\"cursor:pointer;\">";
			str+="<th scope=\"row\">1</th>";
			str+="<td>"+list[i].boardType+"</td>";
			str+="<td>"+list[i].userId+"</td>";	
			str+="<td>"+list[i].userName+"</td>";
			str+="<td>"+list[i].title+"</td>";
			str+="<td>"+list[i].regDt+"</td>";
			str+="<td>"+list[i].replyYn+"</td>";
			str+="<td>"+list[i].replyDt+"</td>";
			str+="<td>"+list[i].delYn+"</td>";
			str+="</tr>";
			$('#userTable').append(str);
		}
	}
	
	function inquiryDetail(id,seq){
		$('#huserId').val(id);
		$('#boardSeq').val(seq);
		call_server(hiddenform,'/user/inquiryDetail',displayinquiryDetail);
	}
	
	function  displayinquiryDetail(vo){
		$('#memberTable > tbody').empty();
		 var userIdAndName = vo.userId + " / " + vo.userName;
		  $("#title").text(vo.title);
          $("#boardType").text(vo.boardType);
          $("#userIdAndName").text(userIdAndName);
          $("#regDt").text(vo.regDt);
          $("#attchFile").text(vo.attchFile);
          $("#content").text(vo.content);
          $("#replyContent").val(vo.replyContent);

	  $('#memberInfo').modal('show');
	}
	
	function updateReply(){
	    $("#hreplyContent").val($("#replyContent").val()); 
	    call_server(hiddenform, '/user/updateReply', updateReplyContent);
	}

	function updateReplyContent(cnt) {
		if (cnt > 0 ) {
		    alert("답변등록성공");
		    $('#memberInfo').modal('hide');
		    search();
		} else {
		    alert("답변등록실패");
		}
	}
	

	
	
	
	
	

</script>