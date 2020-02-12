<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/jquery-ui-1.10.3.custom.min.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "/resources/css/ui.jqgrid.css"/>

<script src = "/resources/js/jquery-1.9.0.min.js" type = "text/javascript"></script>
<script src = "/resources/js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script src = "/resources/js/jquery.jqGrid.min.js" type = "text/javascript"></script>

<script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                mtype: "GET",
                datatype: "jsonp",
                colModel: [
                    { label: 'OrderID', name: 'OrderID', key: true, width: 75 },
                    { label: 'Customer ID', name: 'CustomerID', width: 150 },
                    { label: 'Order Date', name: 'OrderDate', width: 150 },
                    { label: 'Freight', name: 'Freight', width: 150 },
                    { label:'Ship Name', name: 'ShipName', width: 150 }
                ],
                viewrecords: true,
                height: 250,
                rowNum: 101,
                pager: "#jqGridPager"
            });
        });
</script>
<title>jqGrid</title>
</head>
<body>

<table id="jqGrid"></table>
<div id="jqGridPager"></div>
</body>
</html>



