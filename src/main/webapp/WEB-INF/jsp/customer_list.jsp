<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://boot.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2018/10/10
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />

    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>客户管理</title>
    <style type="text/css" rel="stylesheet">
       a:hover{text-decoration: none;color: #bd362f}

    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a href="javascript:void(0)" onclick="todeletes()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a data-href="" data-target="#newCustomerDialog" data-toggle="modal" class="btn btn-primary radius"  href="javascript:void(0)" onclick="clearCustomer()"><i class="Hui-iconfont">&#xe600;</i> 添加客户</a> </span>  <span class="r" >共有数据：<span style="color: red">${count}</span>条</span></div>
    <table class="table table-border table-bordered table-hover table-bg radius" id="tableId">
        <thead>
        <tr>
            <th scope="col" colspan="9">客户管理</th>
        </tr>
        <tr class="text-c">
            <th width=""><input type="checkbox" value="" name=""></th>
            <th width="">ID</th>
            <th width="">客户姓名</th>
            <th width="">性别</th>
            <th width="">客户级别</th>
            <th width="">客户行业</th>
            <th width="">客户邮箱</th>
            <th width="">客户电话</th>
            <th width="">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.rows}" var="row">
          <tr class="text-c">
              <td><input type="checkbox" value="" name="case" id="case"></td>
              <td>${row.cust_id}</td>
              <td>${row.cust_name}</td>
              <td>${row.cust_sex}</td>
              <td>${row.cust_level}</td>
              <td>${row.cust_industry}</td>
              <td>${row.cust_email}</td>
              <td>${row.cust_phone}</td>
              <td class="f-14"><a title="修改" href="javascript:;" data-toggle="modal" data-target="#editCustomerModal" onclick="editCustomer(${row.cust_id})" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="deleteCustomer(${row.cust_id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
          </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="mt-20">
        <div id="#DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">

            <itheima:page url="${pageContext.request.contextPath }/list.do" />

        </div>
        <%--<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">--%>
        <%--<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_previous">上一页</a>--%>
        <%--<span>--%>
        <%--<a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0">1</a>--%>
        <%--</span>--%>
        <%--<a class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" id="DataTables_Table_0_next">下一页</a>--%>
        <%--</div>--%>
        <%----%>
    </div>
</div>


<%--新建客户(模态框)--%>
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加客户信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_customer_form">
                    <div class="row cl">
                        <label for="new_custName" class="form-label col-xs-4 col-sm-3">客户姓名：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="new_custName" name="cust_name">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="new_custSex" class="form-label col-xs-4 col-sm-3">性别：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select class="select" id="new_custSex" name="cust_sex">
                                <option value="">--请选择--</option>
                                <c:forEach items="${sexType}" var="item">
                                   <option value="${item.dict_id}">
                                           ${item.dict_item_name}
                                   </option>
                                </c:forEach>

                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="new_custLevel" class="form-label col-xs-4 col-sm-3">客户级别：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select class="select" id="new_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}">
                                            ${item.dict_item_name}
                                    </option>
                                </c:forEach>



                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="new_custIndustry" class="form-label col-xs-4 col-sm-3">所属行业：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select	class="select" id="new_custIndustry" name="cust_industry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dict_id}">
                                            ${item.dict_item_name}
                                    </option>
                                </c:forEach>



                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                    <div class="row cl">
                        <label for="email" class="form-label col-xs-4 col-sm-3">客户邮箱：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="email" name="cust_email">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                    <div class="row cl">
                        <label for="new_custPhone" class="form-label col-xs-4 col-sm-3">客户电话：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="new_custPhone" name="cust_phone">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="createCustomer()">
                    保存客户
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--修改客户(模态框)--%>
<div class="modal fade" id="editCustomerModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    修改客户信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_customer_form" >

                    <input type="hidden" id="edit_cust_id" name="cust_id"/>

                    <div class="row cl">
                        <label for="edit_custName" class="form-label col-xs-4 col-sm-3">客户姓名：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="edit_custName" name="cust_name">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="edit_custSex" class="form-label col-xs-4 col-sm-3">性别：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select class="select" id="edit_custSex" name="cust_sex">
                                <option value="">--请选择--</option>
                                <c:forEach items="${sexType}" var="item">
                                   <option value="${item.dict_id}" <c:if test="${item.dict_id==custSex}">selected</c:if>>
                                       ${item.dict_item_name}
                                   </option>
                                </c:forEach>
                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="edit_custLevel" class="form-label col-xs-4 col-sm-3">客户级别：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select class="select" id="edit_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}" <c:if test="${item.dict_id==custLevel}">selected</c:if>>
                                            ${item.dict_item_name}
                                    </option>
                                </c:forEach>
                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                    <div class="row cl">
                        <label for="edit_custIndustry" class="form-label col-xs-4 col-sm-3">所属行业：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <span class="select-box">
                            <select	class="select" id="edit_custIndustry" name="cust_industry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dict_id}" <c:if test="${item.dict_id==custIndustry}">selected</c:if>>
                                            ${item.dict_item_name}
                                    </option>
                                </c:forEach>
                            </select>
                            </span>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                    <div class="row cl">
                        <label for="edit_email" class="form-label col-xs-4 col-sm-3">客户邮箱：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="edit_email" name="cust_email">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                    <div class="row cl">
                        <label for="edit_phone" class="form-label col-xs-4 col-sm-3">客户电话：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" id="edit_phone" name="cust_phone">
                        </div>
                        <div class="col-3">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="updateCustomer()">
                    保存客户
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->


<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    //清空添加客户模态框中原有的数据
    function clearCustomer() {
        $("#new_custName").val("");
        $("#new_custSex").val("")
        $("#new_custIndustry").val("")
        $("#new_custLevel").val("")
        $("#new_custPhone").val("");
        $("#email").val("");
    }
    //新建客户
    function createCustomer() {
        $.post("<%=basePath%>create.do",
            $("#new_customer_form").serialize(),function(data){
                if(data =="OK"){
                    alert("客户创建成功！");
                    window.location.reload();
                }else{
                    alert("客户创建失败！");
                    window.location.reload();
                }
            });
    }
    //修改客户,先获取客户的信息
    function editCustomer(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>getCustomerById.do",
            data:{"id":id},
            success:function(data) {
                $("#edit_cust_id").val(data.cust_id);
                $("#edit_custName").val(data.cust_name);
                $("#edit_custSex").val(data.cust_sex)
                $("#edit_custIndustry").val(data.cust_industry)
                $("#edit_custLevel").val(data.cust_level)
                $("#edit_email").val(data.cust_email);
                $("#edit_phone").val(data.cust_phone);
            }
        });
    }
    
    function updateCustomer() {
        $.post("<%=basePath%>update.do",
            $("#edit_customer_form").serialize(),function(data){
                if(data =="OK"){
                    alert("客户信息更新成功！");
                    window.location.reload();
                }else{
                    alert("客户信息更新失败！");
                    window.location.reload();
                }
            });
    }
    /*管理员-客户-删除*/
    function deleteCustomer(id){
        if(confirm('客户删除需谨慎，确定删除？')) {
            $.post("<%=basePath%>delete.do",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("客户删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除客户失败！");
                        window.location.reload();
                    }
                });
        }
    }

    //批量删除
    function todeletes() {
           var msg = "确认删除选中成员";
           if(confirm(msg)==true){
           var check_value = []; //定义一个数组
             // 利用将name等于ids的多选按钮得到
            $("#tableId").find(":input[id='case']:checked").each(function(){

                //获取id值，因为id单元格在复选框单元格的下一个元素
                var val = $(this).parent().next().text();
                // 将id值添加到数组
                check_value.push(val);
            });
            if (check_value.length == 0) {
                alert("你还没有选择任何内容！");
            }
            if (check_value.length > 0) {
                //在浏览器控制台打印信息
                console.log(check_value);
                location.href = "${pageContext.request.contextPath}/deleteCustomers.do?check_value=" + check_value;
                return false;
            }
        }
    }

</script>
</body>
</html>
