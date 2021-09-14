<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>UserList</title>
    <link rel="stylesheet" href="../../static/assets/plugins/icheck/css/all.css">
    <link rel="stylesheet" href="../../static/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../static/assets/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../static/assets/dist/css/_all-skins.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/datatables/css/dataTables.bootstrap.min.css">


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="header.jsp"/>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1 class="box-title">User manager<small></small></h1>

            <ol class="breadcrumb" style="float: right">
                <li><a href="/main"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">User Manager</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-info box-info-search" style="display: none;">
                <div class="box-header">
                    <h3 class="box-title">User list</h3>
                </div>
                    <div class="box-body form-horizontal">
                        <div class="row">
                            <div class="col-xs-12 col-sm-3">
                                <div class="form-group">
                                    <label id="username" for="username" class="col-sm-4 control-label">name</label>
                                    <div class="col-sm-8">
                                        <input id="search-username" name="username" class="form-control" placeholder="username"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-3">
                                <div class="form-group">
                                    <label id="phone" for="phone" class="col-sm-4 control-label">phone</label>
                                    <div class="col-sm-8">
                                        <input id="search-phone" name="phone" class="form-control" placeholder="phone"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-3">
                                <div class="form-group">
                                    <label id="email" for="username" class="col-sm-4 control-label">email</label>
                                    <div class="col-sm-8">
                                        <input id="search-email" name="email" class="form-control" placeholder="email"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-info pull-right" onclick="reloadTable()">search</button>
                    </div>
            </div>


        <div class="box">
                <section class="content-header">
                    <h1 class="box-title">User list<small></small></h1>
                </section>
                <div class="box-body">

                        <a href="#" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#modal-default"><i class="fa fa-plus"></i> add</a>&nbsp;&nbsp;
                        <a href="#" type="button" class="btn btn-default btn-sm" onclick="multipleDelete()"><i class="fa fa-trash"></i>delete</a>&nbsp;&nbsp;
                        <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-download"></i>download</a>&nbsp;&nbsp;
                        <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-upload"></i> upload</a>&nbsp;&nbsp;
                        <button type="button" class="btn btn-sm btn-primary" onclick="$('.box-info-search').css('display') == 'none' ? $('.box-info-search').show('fast') : $('.box-info-search').hide('fast')"><i class="fa fa-search"></i>search</button>

                </div>

            <div class="box-body table-responsive">

                <table id="data_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox" class="minimal icheck_master"/></th>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Number</th>
                        <th>Email</th>
                        <th>Update time</th>
                        <th>Options</th>
                    </tr>
                    </thead>

                    <tbody>
<%--                    <c:forEach items="${users}" var="users">--%>
<%--                        <tr>--%>
<%--                            <th><input id="${users.id}" type="checkbox" class="minimal"/></th>--%>
<%--                            <td>${users.id}</td>--%>
<%--                            <td>${users.username}</td>--%>
<%--                            <td>${users.phone}</td>--%>
<%--                            <td>${users.email}</td>--%>
<%--                            <td>${users.updated}</td>--%>
<%--                            <td>--%>
<%--                                <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-search"></i>detail</a>&nbsp;&nbsp;--%>
<%--                                <a href="#" type="button" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> edit</a>&nbsp;&nbsp;--%>
<%--                                <a href="#" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i>delete</a>&nbsp;&nbsp;--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                    </tbody>
                </table>
            </div>
        </div>


            <%--modal dialog--%>
            <div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New user</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/user/add" method="post" id="inputForm">
                                <div class="form-group">
                                    <label for="username-text" class="col-form-label">Username:</label>
                                    <input type="text" class="form-control required" id="username-text" name="username">
                                </div>
                                <div class="form-group">
                                    <label for="number-text" class="col-form-label">Phone number:</label>
                                    <input type="text" class="form-control" id="number-text" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="email-text" class="col-form-label">Email:</label>
                                    <input type="text" class="form-control required email" id="email-text" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="password-text" class="col-form-label">Password:</label>
                                    <input type="password" class="form-control required" id="password-text" name="password" autocomplete=“off”>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--modal dialog--%>
            <div class="modal fade" id="cf-modal-default" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cf-exampleModalLabel">User Info</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/user/add" method="post" id="cf-inputForm">
                                <div class="form-group">
                                    <label for="username-text" class="col-form-label">Username:</label>
                                    <input type="text" class="form-control" id="cf-username-text" name="username-show" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="number-text" class="col-form-label">Phone number:</label>
                                    <input type="text" class="form-control" id="cf-number-text" name="phone-show" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="email-text" class="col-form-label">Email:</label>
                                    <input type="text" class="form-control required email" id="cf-email-text" name="email-show" readonly>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--modal dialog--%>
            <div class="modal fade" id="ef-modal-default" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ef-exampleModalLabel">Edit User Info</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/user/update" method="post" id="ef-inputForm">
                                <input type="text" id="id" name="id" hidden readonly>
                                <div class="form-group">
                                    <label for="username-text" class="col-form-label">Username:</label>
                                    <input type="text" class="form-control" id="ef-username-text" name="username-show">
                                </div>
                                <div class="form-group">
                                    <label for="number-text" class="col-form-label">Phone number:</label>
                                    <input type="text" class="form-control" id="ef-number-text" name="phone-show">
                                </div>
                                <div class="form-group">
                                    <label for="email-text" class="col-form-label">Email:</label>
                                    <input type="text" class="form-control required email" id="ef-email-text" name="email-show">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </section>
    </div>
    <jsp:include page="footer.jsp"/>
</div>


<script src="../../static/assets/plugins/jquery/jquery.min.js"></script>
<script src="../../static/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../static/assets/plugins/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script src="../../static/assets/plugins/jquery-validation-1.19.3/additional-methods.min.js"></script>
<script src="../../static/assets/plugins/jquery-validation-1.19.3/localization/messages_zh.min.js"></script>
<script src="../../static/assets/app/validate.js"></script>
<script src="../../static/assets/app/app.js"></script>
<script src="../../static/assets/plugins/icheck/js/icheck.min.js"></script>
<script src="../../static/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../static/assets/plugins/fastclick/fastclick.js"></script>
<script src="../../static/assets/dist/js/adminlte.min.js"></script>
<script src="../../static/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="../../static/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>

<script>
    var datatable;
    $(function () {
        var url = "/user/page";
        var column = [
            {data: function (row, type, val, meta) {
                    return '<input id="'+row.id+'" type="checkbox" class="minimal"/>';
                }},
            {data: "id"},
            {data: "username"},
            {data: "phone"},
            {data: "email"},
            {data: "updated"},
            {data: function (row, type, val, meta) {
                    return  '<a href="#" type="button" class="btn btn-default btn-sm" onclick="details('+row.id+', \'/user/details\')"><i class="fa fa-search"></i> detail</a>&nbsp;&nbsp;'+
                        '<a href="#" type="button" class="btn btn-primary btn-sm" onclick="edit('+row.id+', \'/user/details\')" data-toggle="modal" data-target="#ef-modal-default"><i class="fa fa-edit"></i> edit</a>&nbsp;&nbsp;'+
                        '<a href="#" type="button" class="btn btn-danger btn-sm" onclick="delById('+row.id+')"><i class="fa fa-trash"></i> delete</a>&nbsp;&nbsp;';
                }
            },
        ];
        datatable = Zoo.initDatatables(url, column);
    });

    function reloadTable() {
        var username = $("#search-username").val();
        var phone = $("#search-phone").val();
        var email = $("#search-email").val();

        var param = {
            "username": username,
            "phone": phone,
            "email": email
        };

        datatable.settings()[0].ajax.data = param;
        datatable.ajax.reload();

    }

    function multipleDelete() {
        var list = new Array();
        var _checkboxes = Zoo.getCheckbox();
        _checkboxes.each(function () {
            var _id = $(this).attr("id");
            if (_id != null && _id != "undefined" && $(this).is(":checked")) {
                list.push(_id);
            }
        })

        if (list.length <= 0) {
            alert("at least select one element to delete.");
        } else {
            var r = confirm("are you sure to delete?");
            if (r === true) {
                del(list, "/user/delete");
                //alert("deleted successful!");
            } else {

            }
        }
    }

    function details(id, url) {
        $.ajax({
            "url": url,
            "type": "POST",
            "data": {"id": id.toString()},
            "dataType": "JSON",
            "success": function (data) {
                $("#cf-modal-default #cf-username-text").val(data.username);
                $("#cf-modal-default #cf-number-text").val(data.phone);
                $("#cf-modal-default #cf-email-text").val(data.email);
            }
        });
        $("#cf-modal-default").modal("show");
    }

    function edit(id, url) {
        $.ajax({
            "url": url,
            "type": "POST",
            "data": {"id": id.toString()},
            "dataType": "JSON",
            "success": function (data) {
                $("#ef-modal-default #id").val(data.id);
                $("#ef-modal-default #ef-username-text").val(data.username);
                $("#ef-modal-default #ef-number-text").val(data.phone);
                $("#ef-modal-default #ef-email-text").val(data.email);
            }
        })
    }

    function delById(id) {

        var r = confirm("are you sure to delete?");
        if (r === true) {
            $.ajax({
                "url": "/user/deleteById",
                "type": "POST",
                "data": {"id": id.toString()},
                "dataType": "JSON",
            });
            location.reload();
        } else {

        }
    }

    function del(list, url) {
        $.ajax({
            "url": url,
            "type": "POST",
            "data": {"ids": list.toString()},
            "dataType": "JSON",
            "success": function (data) {
                //console.log(data)
                if (data.status === 200) {
                    window.location.reload();
                } else {
                    console.log(data.status);
                    alert("deleted failed!");
                }
            }
        });
        return true;
    }
</script>
</body>
</html>