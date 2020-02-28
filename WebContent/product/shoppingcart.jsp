<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/jquery-ui.min.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/ui.jqgrid.css"/>
<!--<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">-->

<script src = "/resources/js/jquery-1.9.0.min.js" type = "text/javascript"></script>
<script src = "/resources/js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script src = "/resources/js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<!--  <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#overflowTest {
  background: #4CAF50;
  color: white;
  padding: 15px;
  width: 50%;
  height: 100px;
  overflow: auto;
  border: 1px solid #ccc;
}
</style>

<script > 
	$(window.document).ready(function() {
		
	    $("#grid").jqGrid({
	    	url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
	        mtype: "GET",
	        datatype : 'jsonp',     
	        pager : '#pager',            // pager : 도구 모임이 될 div 태그를 지정한다.
	        loadonce : false,            
	        autowidth : true,            // When autowidth is set to true the grid fits to the width of the parent container.
	        rownumbers : true,           // rownumbers add additional column which count the rows
	        height : '400px',            // height : 그리드의 높이를 지정한다.	
	        /*
	        This example demonstrate the new feature - summary row. Also a ggod thing is that the data from userData array
			can be direct putetd in the summary row just with one option userDataOnFooter - >true.
			Also some new methods available for manipulating this data. getCol - return the entry coll as array.
			FooterData - method get or set a data on footer row.
	        */
	        footerrow : true,
	        userDataOnFooter : true,	
	        multiselect: true,            // 멀티 체크 기능 구현을 위한 체크박스 생성
	        loadComplete: function () {
	        	var moneySum = $("#grid").jqGrid('getCol','Freight', false, 'sum');
                $('#grid').jqGrid('footerData', 'set', { crateName:'합계', Freight:moneySum });
              
        	},
	        caption: "My 장바구니 목록"   ,     			  // 그리드 제목 설정
	        colNames:[ '주문번호', '상품번호', '고객 아이디', '수량','주문날짜'],
	        colModel: [
						{ name: 'OrderID', key: true, width: 75 },
	                    { name: 'CustomerID', width: 150 },
	                    { name: 'OrderDate', width: 150, editable:true, 
                    		editoptions: { 
                    			dataEvents: [{ 
                    				type: 'change', 
                    				fn: function(e) {
                    					swal("데이터 변경 감지","`체크된 행 저장하기` 버튼을 눌러 작업을 완료하세요.", "warning"); 
                    					flag=1; //값 변경되면 flag=1로 지정
                    					} 
                    			},
                    			]}
                    },
	                    { name: 'ShipName', width: 150, editable:true, 
                    		editoptions: { 
                    			dataEvents: [{ 
                    				type: 'change', 
                    				fn: function(e) {
                    					swal("데이터 변경 감지","`체크된 행 저장하기` 버튼을 눌러 작업을 완료하세요.", "warning"); 
                    					flag=1; //값 변경되면 flag=1로 지정
                    					} 
                    			},
                    			]}
                    },
	                    { name: 'Freight',index: 'Freight', width: 150, formatter: 'integer', formatoptions:{thousandsSeparator:","}, summaryType:'sum', summaryTpl: 'Totals :'}
                    
                    
                    	

	         		  ],
	      
		    // navGrid() 메서드는 검색 및 기타기능을 사용하기위해 사용된다.
		    }).navGrid('#pager', {
		        search : false,
		        edit : false,
		        add : false,
		        del : false,
		    });
		   
	   		 var flag=0; //데이터 수정 여부를 알기 위한 변수
			 
		    // 체크된 항목의 ROW NUMBER를 alert 해줌
		    jQuery("#cm1").click( function() { 
		    	var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
		    	if(s==""){
		    		swal("체크된 행이 없습니다.","", "error");
		    		//alert("체크된 행이 없습니다.");
		    		return false;
		    	}
		    	else{
		    		swal("체크된 항목의 ROW NUMBER: ",""+ s, "warning"); 
		    	}
		    });
		   
			// 장바구니 비우기
		    // 여러 행일 경우 어떻게...
		    jQuery("#clear").click( function() {
			        jQuery("#grid").jqGrid('clearGridData');
			        swal("데이터 변경 감지","`주문 완료하기` 버튼을 눌러 작업을 완료하세요.", "warning"); 
		    });
		    
		    // 체크된 ROW 수정 기능
		    jQuery("#ed1").click( function() {
		    	var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
		    	if(s==""){
		    		swal("체크된 행이 없습니다.","", "error");
		    		//alert("체크된 행이 없습니다.");
		    		return false;
		    	}
		    	else{
		    		if(s.length>1) { //체크된 데이터 1개 이상이면 수정이 안되서 if-else문 분기
		    			swal("데이터 한 개만 선택해주세요","초기화 버튼 클릭 후 다시 선택해주세요", "error");
		    		}
		    		else{
				    	jQuery("#grid").jqGrid('editRow',s);
				    	this.disabled = 'true';
				    	jQuery("#sved1,#cned1").attr("disabled",false);
		    		}
		    	}
		    });
		    
		    // 체크된 ROW 저장 기능
		    // 여러 행일 경우 어떻게...
		    var checkScanItemsStr = "";
		    jQuery("#sved1").click( function() {
		    	var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
		    	jQuery("#grid").jqGrid('saveRow',s);
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
		    	swal("데이터가 저장되었습니다.",s+"데이터가 저장되었습니다.", "success");
		    	
		    	//수정되었다면 출력. (수정된 경우 flag:1 아니라면 flag:) 
		    	if(flag==1){
			    	for( var i=0; i<s.length; i++ ) {
			    	    var scanItemInfo = $("#grid").getRowData( s[i] );
			    	    checkScanItemsStr +=  
			    		  "주문번호: "+scanItemInfo.OrderID +", 상품번호: "+ scanItemInfo.CustomerID +", 고객아이디: "+ scanItemInfo.OrderDate + ", 수량: "+ scanItemInfo.Freight;
			    	}
			    	
			    	$("#multiPrint").text(checkScanItemsStr);
				    	checkScanItemsStr += "\n";
				    	
				    //flag 값은 다시 0으로 초기화
				    flag=0;
		    	}	
			    	
		    });
		    
		  //수정 취소
		    jQuery("#cned1").click( function() {
		    	var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
		    	jQuery("#grid").jqGrid('restoreRow',s);
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
		    });
		  
		  //데이터 초기화
		    jQuery("#reset").click( function(){ 
		    	jQuery("#grid").jqGrid('resetSelection');
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
		    	
		    });
	});
	
</script>

<title>jqGrid</title>

</head>

			<body style = "font-size:70.5%;">
			    <table id = "grid"></table>
			    <div id = "pager"></div>
			    <h1>
			    	
			   <div align="right">
				    <input type="BUTTON" id="ed1" value="체크된 행 수정하기" />
					<input type="BUTTON" id="sved1" disabled='true' value="체크된 행 저장하기" />
					<input type="BUTTON" id="cned1" disabled='true' value="저장 취소" />
					<input type="BUTTON" id="reset" value="체크된 항목 초기화" />
					<br>
					<input type="submit" id="submit" name="submit" value="주문 완료하기" />
				</div>
			    	
			    수정된 데이터 history : <br>
			    <div id="overflowTest"> 
			    	<span id="multiPrint"></span>
			    	<br/> 
			    </div>
				
			    <br>
			    	
			    	<a href="javascript:void(0)" id="cm1">체크된 Row Number(행) 확인</a>
			    	
			    <div align="right">
					<input type="BUTTON" id="clear" value="장바구니 비우기" />
				</div>
			    </h1>
			</body>

</html>



