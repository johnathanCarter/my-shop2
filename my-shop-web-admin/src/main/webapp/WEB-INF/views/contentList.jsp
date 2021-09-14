<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>contentList</title>
    <link rel="stylesheet" href="../../static/assets/plugins/icheck/css/all.css">
    <link rel="stylesheet" href="../../static/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../static/assets/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../static/assets/dist/css/_all-skins.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/datatables/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="../../static/assets/plugins/treetable/css/jquery.treetable.css">


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

                    <table id="tree_table" class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>name</th>
                            <th>order</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${tbContentCategories}" var="tbContentCategories">
                                <tr data-tt-id="${tbContentCategories.id}" data-tt-parent-id="${tbContentCategories.parentId}">
                                    <td>${tbContentCategories.id}</td>
                                    <td>${tbContentCategories.name}</td>
                                    <td>${tbContentCategories.sortOrder}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
<script src="../../static/assets/plugins/treetable/js/jquery.treetable.js"></script>
<script src="../../static/assets/plugins/jquery/jquery-ui.min.js"></script>

<script>
    $(function () {
        $("#tree_table").treetable({
            expandLevel: 2,
            clickableNodeNames: true,
            expandable: true,

            column: 1
        });
    });
</script>
</body>
</html>