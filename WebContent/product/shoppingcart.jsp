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
	        multiselect: true,            // 멀티 체크 기능 구현을 위한 체크박스 생성
	        caption: "My 장바구니 목록"   ,     			  // 그리드 제목 설정
	        colNames:[ '주문번호', '상품번호', '고객 아이디', '수량','주문날짜'],
	        colModel: [
						{ label: 'OrderID', name: 'OrderID', key: true, width: 75 },
	                    { label: 'Customer ID', name: 'CustomerID', width: 150 },
	                    { label: 'Order Date', name: 'OrderDate', width: 150, editable:true},
	                    { label: 'Freight', name: 'Freight', width: 150, editable:true },
	                    { label:'Ship Name', name: 'ShipName', width: 150 }
	         		  ],
	       
	      
		    // navGrid() 메서드는 검색 및 기타기능을 사용하기위해 사용된다.
		    }).navGrid('#pager', {
		        search : false,
		        edit : false,
		        add : false,
		        del : false,
		    });
		   
	    var s = jQuery("#grid").jqGrid('getGridParam', 'selarrrow');
	    
		    // 체크된 항목의 ROW NUMBER를 alert 해줌
		    jQuery("#cm1").click( function() {   
		    	swal("체크된 항목의 ROW NUMBER: ",""+ s, "warning"); 
		    });
		   
		    // 특정행 자동 체크 On/Off
		    // 여러 행일 경우 어떻게...
		    jQuery("#cm1s").click( function() {
		        jQuery("#grid").jqGrid('setSelection', s);
		    });
		    
		    // 체크된 ROW EDIT 기능
		    jQuery("#ed1").click( function() {
		    	if(s==""){
		    		swal("체크된 행이 없습니다.","", "error");
		    		//alert("체크된 행이 없습니다.");
		    		return false;
		    	}
		    	else{
			    	jQuery("#grid").jqGrid('editRow',s);
			    	this.disabled = 'true';
			    	jQuery("#sved1,#cned1").attr("disabled",false);
		    	}
		    });
		    
		    // 체크된 ROW 저장 기능
		    // 여러 행일 경우 어떻게...
		    jQuery("#sved1").click( function() {
		    	jQuery("#grid").jqGrid('saveRow',s);
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
		    });
		    
		  //수정 취소
		    jQuery("#cned1").click( function() {
		    	jQuery("#grid").jqGrid('restoreRow',"13");
		    	jQuery("#sved1,#cned1").attr("disabled",true);
		    	jQuery("#ed1").attr("disabled",false);
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
	    <h1>
	        <a href="javascript:void(0)" id="cm1">체크된 Row Number(행) 확인</a><br/><br/>
	        <br>
	        <a href="javascript:void(0)" id="cm1s">특정 행 체크 Off</a>
	    </h1>
	    <br>
	    <br>
	    <br>
	    <input type="BUTTON" id="ed1" value="체크된 행 수정하기" />
		<input type="BUTTON" id="sved1" disabled='true' value="체크된 행 저장하기" />
		<input type="BUTTON" id="cned1" disabled='true' value="저장 취소" />
		
	</body>

</html>



