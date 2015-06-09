<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/erpStock/StockIn/page.jsp"/>
<html>
  <head>
    <title>3-2-1 库存管理-入库管理-管理界面</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css"  href="themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css" /> 	
 	
 		<style>
	body,div,table,form{
	margin:0px;
	padding:0px;
	}
	#bigbox{
	width:100%;
	height:95%;
	}
	</style>
 	<script>
 	
 	$(function(){

 		$("#stockface").datagrid({
 			url:'/ERP/stock/StockInServlet',
			fit:true,
 			fitColumns:true,
			type:"post",
 			toolbar: '#tb',
 			pagination:true,
 			//rownumbers:true,
 			pageList:[3,5,10],
 		    pageSize:3,
 			columns:[[
 				{field:'id',checkbox:true}, 
		        {field:'code',title:'入库单号',width:100},    
		        {field:'indate',title:'入库日期',width:100},    
		        {field:'contacter',title:'供应商名',width:100},
		        {field:'nums',title:'数量',width:100},
		        {field:'numsPrice',title:'总货值',width:100},
		        {field:'state',title:'审核状态',width:100},
		        {field:'addUserName',title:'操作员',width:100},
		        {field:'opt',title:'操作',width:100,
		        	formatter: function(value,row,index){
						var content="<input type='button' value='修改' onclick=\"update('"+row.code+"')\"/>";
						content+="<input type='button' value='删除' onclick=\"del('"+row.code+"')\"/>";
						return content;
					}
		        }, 
		    ]],
		    onDblClickRow:function(index,row){
				$("input[name='detailincode']").val(row.code);
				dblclick();
 			},
 		});
 		$("#smallbox").hide(); 
 	})
 	
 	

 	
 	//双击详情
	function dblclick(){
		$("#smallbox").show();
		$("#bigbox").change(
		 		$("#bigbox").height(450),
		 		$("#stockface").datagrid({fit:true,})
		 );
		var incode=$("input[name='detailincode']").val();
		$.ajax({
			url:'/ERP/stock/StockInDetailServlet',
			data:{'incode':incode},
			type:"post",
			dataType:"json",
			async:false,
			error:function(){alert("请求失败")},
			success:function(data){
				$("#detailtb").html("");
				$("#detailtbtr").appendTo("#detailtb");
				for(var i=0;i<data.length;i++){
					var trobj=$("<tr>").appendTo("#detailtb");
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].orderCode);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].PCode);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].nums);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].price);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].pdTotal);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].wareHouse);
					var tdobj=$("<td>").appendTo(trobj);
					var inputobj=$("<input>").appendTo(tdobj).val(data[i].remarks);
				}
			}
		});
	}


 	

 		
 	//添加
 	function addrows(){
 		window.location="";
 	}
 	
 	
 	//修改
 	function update(code){
 		window.location="?code="+code;
	}
 	
 	
 	//单行删除
 	function del(code){
 		$.messager.confirm("删除提醒","确认要执行删除操作吗?",function(r){
			if(r){
				window.location.href="?opt=1&";
			}
		});
 	}
 	//批量删除
 	function delall(){
		var row=$("#stockface").datagrid("getSelections");
		if (row.length==0){
			alert("请选择");
			return;
		}
		$.messager.confirm("批量删除提醒","确认要执行删除操作吗",function(r){
			if(r){
				var ids="";
				for(var i=0;i<row.length;i++){
					if(i!=row.length-1){
						ids+=row[i].code+",";
					}else ids+=row[i].code;
				}
				$("#addallput").val(ids);
				$("#delallff").submit();
			}
		});
 	}

	//搜索
 	function selerows(){
 		$.ajax({
 			url:'',
 			type:"post",
 			data:{
 				'page':'1',
 				'rows':'3',
 				'search':$("input[name='searchcode']").val(),
 				'search':$("input[name='searchcodeName']").val(),
 				'search':$("select[name='searchcateGoryCode']").val(),
 			},
 			
			dataType:"json",
			success:function(data){
				$("#stockface").datagrid("loadData",data);//重读
			}
 		});
 	}
 	
 	
	//导出excel
	function portexcel(){
		window.location="";
	}
 </script>
  </head>
  
  <body>
  	<div id=bigbox>
		<div id="stockface"></div>
	</div>
	
	<div id="tb">
		<div>
			<form id="seleff" action="" method="post" target="_self">
				<span style="color:#E33633" ><b>检索条件</b></span>&nbsp;&nbsp;
				<span><b>入库单号</b></span>
					<input type="text" name="search" />

				<span><b>开始日期</b></span>
					<select name="search">
						<option></option>
					</select>
					
				<span><b>结束日期</b></span>
					<select name="search">
						<option></option>
					</select>
					
				<span><b></b></span>
				<input type="text" name="search" />
				
				<a href="javascript:selerows()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>	
			</form>	
		</div>
		<div>
			<a href="javascript:addrows()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
			<a href="javascript:delall()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</a>
			<a href="javascript:portexcel()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">导出excel</a>
		</div>
	</div>
	
	<div id="smallbox">
			<div id="detailtitle">
				<span><b>单据标号为：</b></span>
				<input type="text" display="display" name="detailincode" style="border-style:none" />
				<span><b>的明细如下所列</b></span>
			</div>

			<table rules="all" border="1" id="detailtb">
				<tr id="detailtbtr">
					<td>订单编号</td><td>件号</td><td>数量</td>
					<td>单价</td><td>金额</td><td>所属仓库</td><td>备注</td>
				</tr>
			</table>
	</div>
	
	
	<form id="delallff" action="/21-part/BCont/BContDelServlet?opt=2" method="post" target="_self">
		<input id="addallput" type="hidden" name="deleteallrows" value="" />
	</form>
	
  </body>
</html>
