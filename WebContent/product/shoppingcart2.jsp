<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/jquery-ui-1.10.3.custom.min.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/ui.jqgrid.css"/>

<script src = "/resources/js/jquery-1.9.0.min.js" type = "text/javascript"></script>
<script src = "/resources/js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script src = "/resources/js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script > 
	var change_flag=0;
	$(window.document).ready(function() {
	    $("#grid").jqGrid({
	    	url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
	        mtype: "GET",
	        datatype : 'jsonp',     
	        pager : '#pager',            // pager : 도구 모임이 될 div 태그를 지정한다.
	        loadonce : true,            // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
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
	        caption : "My 장바구니 목록"   ,     			  // 그리드 제목 설정
	        colNames :['수정/삭제/저장', '주문번호', '상품번호', '고객 아이디', '수량','주문날짜'],
	        colModel : [
						{name: 'myac', width:130, fixed:true, sortable:false, resize:false, formatter:'actions', formatoptions:{keys:true}},
						{ label: 'OrderID', name: 'OrderID', key: true, width: 70 },
	                    { label: 'Customer ID', name: 'CustomerID', width: 70 },
	                    { label: 'Order Date', name: 'OrderDate', width: 150, editable:true, 
	                    		editoptions: { 
	                    			dataEvents: [{ 
	                    				type: 'change', 
	                    				fn: function(e) {
	                    					swal("데이터가 변경되었습니다.","왼쪽의 전송 버튼을 다시 눌러 작업을 완료하세요.", "warning"); 
	                    					} 
	                    			},
	                    			]}
	                    },
	                    { label: 'Freight', name: 'Freight', width: 130, editable:true , 
		                    	editoptions: { 
		                    		dataEvents: [{ 
		                    			type: 'change', 
		                    			fn: function(e) {
		                    				swal("데이터가 변경되었습니다.","왼쪽의 전송 버튼을 다시 눌러 작업을 완료하세요.", "warning"); 
		                    				} 
		                    		},
		                    		]}
	                    },
	                    { label:'Ship Name', name: 'ShipName', width: 150 }
	         		  ],
	      
		    // navGrid() 메서드는 검색 및 기타기능을 사용하기위해 사용된다.
		    }).navGrid('#pager', {search : false, edit : false, add : false, del : false, });
		   
	    var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
		    
		    // 저장
		    jQuery("#sved1").click( function() {
		    	jQuery("#grid").jqGrid('saveRow',s);
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
		    });
		    
		    $("#jSaveButton_2").click( function() {
		    	alert("sdfsdf");
		    });

	});
	
</script>

<title>jqGrid</title>

</head>

	<body style = "font-size:62.5%;">
	    <table id = "grid"></table>
	    <div id = "pager"></div>
		<br>
		<br>
		
		<input type="BUTTON" id="check1" value="수정된 데이터 확인하기" />
		<input type="button" id="sved1" value="저장하기" />
		
	</body>

</html>



