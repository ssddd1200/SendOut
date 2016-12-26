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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="welcome"></span> <b class="caret"></b></a>
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
                        <a href="employee.jsp"><i class="fa fa-fw fa-table"></i>员工管理</a>
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
                        <a href="/QKSendOutBySSM/getOrder?name=" class="active"><i class="fa fa-fw fa-table"></i>订单管理</a>
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
                            订单管理
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group input-group" id="search-from-list">
                            <input name="search"type="text" class="form-control" placeholder="搜索相关订单">
                            <span class="input-group-btn"><button class="btn btn-default" type="button" id="find()"><i class="fa fa-search"></i></button></span>
                        </div>
                    </div>
                    <div class="col-lg-12"></div>
                    <div class="col-lg-12">

                            <table class="table table-bordered table-striped" id="order_list_table">
                                <thead>
                                    <tr>
                                        <th class="orderId">订单号</th>
                                        <th class="sName">商家</th>
                                        <th class="sAddr">商家地址</th>
                                        <th class="sPhone">商家联系电话</th>
                                        <th class="uName">收货人</th>
                                        <th class="uAddr">收货地址</th>
                                        <th class="uPhone">消费者电话</th>
                                        <th class="rName">骑士</th>
                                        <th class="rPhone">骑士联系电话</th>
                                        <th class="status">状态</th>
                                        <th class="action"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach var="row" items="${order}">
                                   <tr>
                                        <td class="orderId"><c:out value="${row.id }" ></c:out></td>
                                        <td class="sName"><c:out value="${row.name }" ></c:out></td>
                                        <td class="sAddr"><c:out value="${row.merAdd }" ></c:out></td>
                                        <td class="sPhone"><c:out value="${row.merPhone }" ></c:out></td>
                                        <td class="uName"><c:out value="${row.cname }" ></c:out></td>
                                        <td class="uAddr"><c:out value="${row.cadd }" ></c:out></td>
                                        <td class="uPhone"><c:out value="${row.ctel }" ></c:out></td>
                                        <td class="rName"><c:out value="${row.kname }" ></c:out></td>
                                        <td class="rPhone"><c:out value="${row.ktel }" ></c:out></td>
                                        <td class="status"><c:out value="${row.status }" ></c:out></td>
                                        <td class="action">
                                        	<c:if test="${row.status!='中止' }"><button id="${row.id }" type="submit" class="btn btn-default warning" onclick="stop(this)">中止</button></c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
		function stop(obj){
			obj.disabled = true;
			$.ajax({
				url:"/QKSendOutBySSM/changeOrderStatus?id="+obj.id+"&&st=中止",
				type:"post",
				success:function(data){

					if(data == 1){
						document.getElementById(obj.id).parentElement.previousElementSibling.innerHTML="中止";
						alert("修改成功");
					}
				}
			});
		}
		
		$("#find").click(function(){
			var user= document.getElementsByName("seacher")[0].value;
			window.location="fShop?name="+user;
		})
		
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
		
		$.ajax({
			url:"/QKSendOutBySSM/getOrder",
			type:"get",
			success:function(data){
				
			}
		})
	</script>
</body>

</html>