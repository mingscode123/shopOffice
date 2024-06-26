<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main id="main" class="main">
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body" style="padding-top: 20px;">
                        <form id="searchform">
                            <table class="col-lg-12" >
                                <tr>
                                    <td>
                                        <h2>대분류</h2>
                                        <table id="topCateTable">
                                          <thead>
		                                    <tr>
		                                        <th>대분류코드</th>
		                                        <td>&nbsp;</td>
		                                        <th>대분류명</th>
		                                    </tr>
		                               	 </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <h2>중분류</h2>
                                        <table id="middleCateTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">중분류코드</th>
                                                <td>&nbsp;</td>
                                                <th scope="col">중분류명</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <h2>소분류</h2>
                                        <table id="subCateTable">
                                        	<thead>
                                            <tr>
                                                <th scope="col">소분류코드</th>
                                                <td>&nbsp;</td>
                                                <th scope="col">소분류명</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td rowspan="2">
                                        <button type="button" class="btn btn-info" onclick="search('', '1');">조회</button>
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" id="upCtCd" name="upCtCd" >
                            <input type="hidden" id="ctLevel" name="ctLevel" >
                        </form>
                    </div>
                </div>
	                 <div class="card">
            	<div class="card-body">
            	<form id="cateform">
              <!-- Table with hoverable rows -->
           <table class="table table-hover" id="cateTable">
			    <thead>
			        <tr>
			            <th scope="col">상위분류</th>
			        </tr>
			            <tr>
			          <td style="display: flex;">						
					    <select class="form-control" id = "select1" name ="select1" onchange="categoryChange(this,'1')">
					        <option value=''>대분류선택</option>
					    </select>
					    <select class="form-control" id = "select2" name ="select2" onchange="categoryChange(this,'2')">
					        <option value=''>중분류선택</option>
					    </select>
					    <select class="form-control" id = "select3" name ="select3" onchange="categoryChange(this,'3')">
					        <option value=''>소분류선택</option>
					    </select>
					 </td>
						</tr>
		            <tr>	
		            <th scope="col">카테고리명</th>
		        	</tr>
		            <td>
		                <input type="text" class="form-control" id="ctName" name="ctName">
		            </td>
			    </thead>
			    <tbody>
			    </tbody>
			        <tr>
			            <td colspan="2">
			                <button type="button" class="btn btn-info" onclick="newCategory();">신규</button>
			                <button type="button" class="btn btn-info" onclick="updateCategory();">수정</button>
			            </td>
			        </tr>
			</table>
			<input type="text" id="supCtCd" name="upCtCd" >
			<input type="text" id="sctCd" name="ctCd" >
			<input type="text" id="sctLevel" name="ctLevel" >
			</form>
            </div>
          </div>
        
	            </div>
            </div>
    </section>
</main>
		
		<script>
		    function search(cd, level){
		    	if(level==1){
		    		$('#select1').empty();
		    		$('#select1').append("<option value=''>대분류선택</option>");
		    	}
		    	$('#upCtCd').val(cd);
		        $('#ctLevel').val(level);
		        call_server(searchform,'/goods/searchCategory',searchCategory);
		    }
		
		    function searchCategory(list){
		    	if($('#ctLevel').val()==1){
		    		$('#topCateTable > tbody').empty();
			        $('#middleCateTable > tbody').empty();
			        $('#subCateTable > tbody').empty();	
		    	}else if($('#ctLevel').val()==2){
		    		$('#middleCateTable > tbody').empty();
			        $('#subCateTable > tbody').empty();
		    	}else if($('#ctLevel').val()==3){
		    		$('#subCateTable > tbody').empty();
		    	}
		        for (var i = 0; i < list.length; i++) {
		            var str = "<tr onclick=\"search('" + list[i].ctCd + "', '" + (Number(list[i].ctLevel) + 1) + "');\" style=\"cursor:pointer;\">";
		            if ($('#ctLevel').val() == 1) {
		                str += "<td>" + list[i].ctCd + "</td>";
		                str += "<td>&nbsp;</td>";
		                str += "<td>" + list[i].ctName + "</td>";
		                $('#topCateTable tbody').append(str);
		                $('#select1').append("<option value='"+list[i].ctCd+"'>"+list[i].ctName+"</option>");
		            } else if ($('#ctLevel').val() == 2) {
		                str += "<td>" + list[i].ctCd + "</td>";
		                str += "<td>&nbsp;</td>";
		                str += "<td>" + list[i].ctName + "</td>";
		                $('#middleCateTable tbody').append(str);
		            } else if ($('#ctLevel').val() == 3) {
		                str += "<td>" + list[i].ctCd + "</td>";
		                str += "<td>&nbsp;</td>";
		                str += "<td>" + list[i].ctName + "</td>";
		                $('#subCateTable tbody').append(str);
		            }
		        } 
		    }
		    
		    function categoryChange(cd,level){
		    	$('#ctName').val($(cd).find('option:selected').text());
		    	$('#sctCd').val($(cd).val());
		    	$('#sctLevel').val(Number(level)+1);
		    	$('#supCtCd').val($(cd).val());
		    	if(level<3){
		        	call_server(cateform,'/goods/categoryChange',handleCategoryChange);
		    	}
		    }
		    
		    function handleCategoryChange(list) {
		         if ($('#sctLevel').val() == 2) {
		            $('#select2').empty();
		            $('#select2').append("<option value=''>중분류선택</option>");
		        } else if ($('#sctLevel').val() == 3) {
		            $('#select3').empty();
		            $('#select3').append("<option value=''>소분류선택</option>");
		        }

		        for (var i = 0; i < list.length; i++) {
		            var str = "<option value='" + list[i].ctCd + "'>" + list[i].ctName + "</option>";
		            if ($('#sctLevel').val() == 2) {
		                $('#select2').append(str);
		            } else if ($('#sctLevel').val() == 3) {
		                $('#select3').append(str);
		            }
		        }
		    }

		    function newCategory(){
		    	if (confirm("신규카테고리를 등록하시겠습니까?")) {
		    		if($('#sctLevel').val()==''){
		    			$('#sctLevel').val('1');
		    		}
	        	call_server(cateform,'/goods/newCategory',insertCate);
		    	}
		    }
	    
		    function insertCate(cnt) {
				if (cnt > 0 ) {
				    alert("신규카테고리 등록성공");
				} else {
				    alert("실패");
				}
			}
		   
		    function updateCategory(){
		    	if (confirm("카테고리명을 수정하시겠습니까?")) {
		    		call_server(cateform,'/goods/updateCategory',updateCate);
		    	}   
		    }
		  
		    function updateCate(cnt) {
				if (cnt > 0 ) {
				    alert("카테고리명 수정성공");
				} else {
				    alert("실패");
				}
			}
		    
		    
		    
			
		
		</script>