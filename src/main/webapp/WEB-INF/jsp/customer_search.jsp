<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="itheima" uri="http://boot.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2018/10/13
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/bootstrap.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>客户搜索</title>
    <style type="text/css" rel="stylesheet">
        a:hover{
            text-decoration: none;color: snow;
        }
    </style>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-body">
        <form class="form-inline" method="get"
              action="${pageContext.request.contextPath }/Search.do">
            <div class="form-group">
                <label for="customerName">客户姓名</label>

                <input type="text" class="form-control" id="customerName"
                       value="${custName}" name="custName" />
            </div>
            <div class="form-group">
                <label for="custSex">客户性别</label>
                <select	class="form-control" id="custSex" name="custSex">
                    <option value="">--请选择--</option>
                    <c:forEach items="${sexType}" var="item">
                        <option value="${item.dict_id}"
                                <c:if test="${item.dict_id == custSex}">selected</c:if>>
                                ${item.dict_item_name}
                        </option>
                    </c:forEach>



                </select>
            </div>
            <div class="form-group">
                <label for="custIndustry">所属行业</label>
                <select	class="form-control" id="custIndustry"  name="custIndustry">
                    <option value="">--请选择--</option>
                    <c:forEach items="${industryType}" var="item">
                        <option value="${item.dict_id}"
                                <c:if test="${item.dict_id==custIndustry}">selected</c:if>>
                                ${item.dict_item_name}
                        </option>
                    </c:forEach>



                </select>
            </div>
            <div class="form-group">
                <label for="custLevel">客户级别</label>
                <select	class="form-control" id="custLevel" name="custLevel">
                    <option value="">--请选择--</option>
                    <c:forEach items="${levelType}" var="item">
                        <option value="${item.dict_id}"
                                <c:if test="${item.dict_id == custLevel}">selected</c:if>>
                                ${item.dict_item_name}
                        </option>
                    </c:forEach>



                </select>
            </div>
            <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </form>
    </div>
</div>


<%--查询的客户显示列表--%>
<div class="page-container">

    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="8">客户查询</th>
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

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.rows}" var="row">
            <tr class="text-c">
                <td><input type="checkbox" value="" name=""></td>
                <td>${row.cust_id}</td>
                <td>${row.cust_name}</td>
                <td>${row.cust_sex}</td>
                <td>${row.cust_level}</td>
                <td>${row.cust_industry}</td>
                <td>${row.cust_email}</td>
                <td>${row.cust_phone}</td>

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
<%--分页--%>

</body>
</html>
