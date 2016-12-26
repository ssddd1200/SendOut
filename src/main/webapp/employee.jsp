<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>QK外卖 - 后台管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">QK外卖 - 后台管理系统</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="welcome"></span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="personal-info.html"><i class="fa fa-fw fa-user"></i>个人信息</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="login.html"><i class="fa fa-fw fa-power-off"></i>退出登陆</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="personal-info.html"><i class="fa fa-fw fa-table"></i>个人信息</a>
                    </li>
                    <li>
                        <a href="password.html"><i class="fa fa-fw fa-table"></i>修改密码</a>
                    </li>
                    <li>
                        <a href="employee.jsp" class="active"><i class="fa fa-fw fa-table"></i>员工管理</a>
                    </li>
                    <li>
                        <a href="/QKSendOutBySSM/getMerchants"><i class="fa fa-fw fa-table"></i>商家管理</a>
                    </li>
                    <li>
                        <a href="/QKSendOutBySSM/getKnight?name="><i class="fa fa-fw fa-table"></i>骑士管理</a>
                    </li>
                    <li>
                        <a href="/QKSendOutBySSM/getCousmer?name="><i class="fa fa-fw fa-table"></i>消费者管理</a>
                    </li>
                    <li>
                        <a href="/QKSendOutBySSM/getOrder?name="><i class="fa fa-fw fa-table"></i>订单管理</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            员工管理
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
				<sql:setDataSource var="waimai" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/waimai?useSSL=false" user="qingke"  password="123456"/>

				<sql:query dataSource="${waimai}" var="result">
					select id,name,telphone,email,(select code from employee_limit where id=employee_limit_id) as lim from employee;
				</sql:query>
                <div class="row">
                    <div class="col-lg-6">

                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th class="eID">员工ID</th>
                                        <th class="eName">姓名</th>
                                        <th class="phoneNum">电话</th>
                                        <th class="email">邮箱</th>
                                        <th class="permission">员工权限</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="row" items="${result.rows}">
                                    <tr>
                                        <td class="eID"><c:out value="${row.id}" /></td>
                                        <td class="eName"><c:out value="${row.name}" /></td>
                                        <td class="phoneNum"><c:out value="${row.telphone}" /></td>
                                        <td class="email"><c:out value="${row.email}" /></td>
                                        <td class="permission"><c:out value="${row.lim}" /></td>
                                        <td>
                                            <a href="#" class="employee-modify">修改</a>
                                            <a href="/QKSendOutBySSM/delEmployee?id=${row.id}" style="float:right;color:red;">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="submit" id="create-employee" class="btn btn-default float-r">创建员工</button>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-4">
                        <form id="employee-form" action="/QKSendOutBySSM/changeEmployeeInfo">

                            <div class="form-group">
                                <label>员工ID</label>
                                <input name="id" class="form-control form-eID" value="001">
                            </div>

                            <div class="form-group">
                                <label>姓名</label>
                                <input name="ename" class="form-control form-eName" value="张三">
                            </div>

                            <div class="form-group">
                                <label>电话</label>
                                <input name="phone" class="form-control form-phoneNum" value="15022553344">
                            </div>

                            <div class="form-group">
                                <label>邮箱</label>
                                <input name="email" class="form-control form-email" value="QK@163.com">
                            </div>

                            <div class="form-group">
                                <label>员工权限</label>
                                <input name="limit" class="form-control form-permission" value="A">
                            </div>
                            <button type="submit" class="btn btn-default">保存修改</button>

                        </form>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/admin.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$.ajax({
			url : "/QKSendOutBySSM/loadWeb",
			type : "get",
			success : function(data) {
				$(".welcome")[0].innerHTML = data;
			},
			error : function(date) {
				window.location="login.html";
				alert("请先登录");
			}
		})
	</script>
</body>

</html>