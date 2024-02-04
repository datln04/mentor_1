<%-- 
    Document   : staff
    Created on : Jan 22, 2024, 9:12:16 PM
    Author     : ptd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Staff Page</title>
        <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background-color: #b2e0df;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
            /*            body{
                            margin: 0;
                            padding: 0;
                            background-color: #b2e0df;
                            height: 100vh;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                        }*/

            .search-container{

                margin-top: 2rem;
                width: 300px;
                background: #fff;
                height: 30px;
                border-radius: 30px;
                padding: 10px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                transition: 0.8s;
                /*box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
                inset -7px -7px 10px 0px rgba(0,0,0,.1),
               7px 7px 20px 0px rgba(0,0,0,.1),
               4px 4px 5px 0px rgba(0,0,0,.1);
               text-shadow:  0px 0px 6px rgba(255,255,255,.3),
                          -4px -4px 6px rgba(116, 125, 136, .2);
              text-shadow: 2px 2px 3px rgba(255,255,255,0.5);*/
                box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
                    -4px -4px 6px 0 rgba(116, 125, 136, .2), 
                    inset -4px -4px 6px 0 rgba(255,255,255,.2),
                    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
            }

            .search-container:hover > .search-input{
                width: 400px;
            }

            .search-container .search-input{
                background: transparent;
                border: none;
                outline:none;
                width: 0px;
                font-weight: 500;
                font-size: 16px;
                transition: 0.8s;

            }

            .search-container .search-btn .fas{
                color: #5cbdbb;
            }

            @keyframes hoverShake {
                0% {transform: skew(0deg,0deg);}
                25% {transform: skew(5deg, 5deg);}
                75% {transform: skew(-5deg, -5deg);}
                100% {transform: skew(0deg,0deg);}
            }

            .search-container:hover{
                animation: hoverShake 0.15s linear 3;
            }
        </style>


    </head>
    <body>
        <h1 style="text-align: center">Hello ${sessionScope.ACCOUNT.fullName}, <a href="DispatcherServlet?action=Logout">Logout</a></h1>
        <div style="width: 100%; justify-content: center; display: flex"> 
            <form action="DispatcherServlet">
                <input type="text" name="search" placeholder="Search..." style="border-radius: 20px; padding: 8px; width: 300px" value="${param.search}">
                <input type="submit" name="action" value="Search" class="btn btn-success"/>
            </form>
        </div>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Mobile</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Mobile</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Mobile Id</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Mobile Name</th>
                                <th>Year Of Production</th>
                                <th>Quantity</th>
                                <th>Not Sale</th>

                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.MOBILE_DATA}" var="m">
                                <tr>
                                    <td>
                                        <img src="./assets/images/${m.image}" alt="Default Image" style="width: 50px; height: 50px">
                                    </td>
                                    <td>${m.mobileId}</td>
                                    <td>${m.description}</td>
                                    <td>${m.price}</td>
                                    <td>${m.mobileName}</td>
                                    <td>${m.yearOfProduction}</td>
                                    <td>${m.quantity}</td>
                                    <td>${m.notSale}</td>

                                    <td>
                                        <a href="#editEmployeeModal" class="edit" data-toggle="modal"
                                           data-update-mobile-id="${m.mobileId}"
                                           data-update-mobile-description="${m.description}"
                                           data-update-mobile-price="${m.price}"
                                           data-update-mobile-quantity="${m.quantity}"
                                           data-update-mobile-notsale="${m.notSale}"
                                           >
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" data-mobile-id="${m.mobileId}"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ADDMobileServlet" method="POST" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Mobile</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>MobileId</label>
                                <input type="text" class="form-control" required name="mobileId">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" required name="description">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" required name="price">
                            </div>
                            <div class="form-group">
                                <label>Mobile Name</label>
                                <input type="text" class="form-control" required name="mobileName">
                            </div>
                            <div class="form-group">
                                <label>Year Of Production</label>
                                <input type="number" class="form-control" required name="yearOfProduction">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" required name="quantity">
                            </div>
                            <div class="form-group">
                                <label>Not Sale</label>
                                <input type="checkbox" class="" name="notSale">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" class="form-control" required name="image">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="AddModile" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="DispatcherServlet" method="POST">
                        <input type="hidden" name="mobileId" value="" id="updateId"/>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Mobile</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" required name="description" id="updateDescription">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" required name="price" id="updatePrice">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" required name="quantity" id="updateQuantity">
                            </div>
                            <div class="form-group">
                                <label>Not Sale</label>
                                <input type="checkbox" class="" name="notSale" id="mobileNotSale">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="UpdateMobile" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="DispatcherServlet" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <!-- Other modal content... -->
                        <input type="hidden" id="mobileId" name="mobileId" value="">
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="DeleteMobile" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
        $(document).ready(function () {
            $('.delete').on('click', function () {
                var mobileId = $(this).data('mobile-id');
                $('#mobileId').val(mobileId);
            });
        });
        $(document).ready(function () {
            $('.edit').on('click', function () {

                var mobileId = $(this).data('update-mobile-id');
                $('#updateId').val(mobileId);
                var description = $(this).data('update-mobile-description');
                $('#updateDescription').val(description);
                var price = $(this).data('update-mobile-price');
                $('#updatePrice').val(price);
                var quantity = $(this).data('update-mobile-quantity');
                $('#updateQuantity').val(quantity);


                // Extract data from the clicked link and log it
                var notSale = $(this).data('update-mobile-notsale');

                // Check if notSale is undefined and handle accordingly
                if (typeof notSale === 'undefined') {
                    console.error('notSale is undefined');
                    // Handle undefined case here, e.g., uncheck the checkbox or show an error
                } else {
                    // Set the checkbox state
                    $('#mobileNotSale').prop('checked', notSale === 'true' || notSale === true);
                }
            });
        });
        if (${requestScope.POSITIVE_NUMBER_ERROR != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.POSITIVE_NUMBER_ERROR}',
                icon: "error",
                button: "Ok"
            });
        }
        if (${requestScope.POSITIVE_PRICE != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.POSITIVE_PRICE}',
                icon: "error",
                button: "Ok"
            });
        }
    </script>
</html>