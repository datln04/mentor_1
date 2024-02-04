<%-- 
    Document   : home
    Created on : Jan 21, 2024, 11:41:20 AM
    Author     : ptd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home Page</title>
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

            /* The Modal (background) */
            #mobileDetailModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* The Modal (background) */
            #addToCartModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
                max-width: 600px; /* Maximum width */
            }

            /* The Close Button */
            .close-button {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close-button:hover,
            .close-button:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .clickable-row{
                cursor: pointer;
            }

        </style>


    </head>
    <body>
        <h1 style="text-align: center">Hello ${sessionScope.ACCOUNT.fullName}, <a href="DispatcherServlet?action=Logout">Logout</a></h1>
        <div style="width: 100%; justify-content: center; display: flex"> 
            <form action="DispatcherServlet">
                <input type="number" name="minPrice" placeholder="min price..." style="border-radius: 20px; padding: 8px; width: 300px" value="${param.minPrice}">
                <input type="number" name="maxPrice" placeholder="max price..." style="border-radius: 20px; padding: 8px; width: 300px" value="${param.maxPrice}">
                <input type="submit" name="action" value="Lookup" class="btn btn-success"/>
            </form>
        </div>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Mobile Id</th>
                                <th>Description</th>
                                <!--                                <th>Price</th>
                                                                <th>Mobile Name</th>
                                                                <th>Year Of Production</th>
                                                                <th>Quantity</th>
                                                                <th>Not Sale</th>-->
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.MOBILE_DATA}" var="m">
                                <!--<form action="DispatcherServlet" method="POST">-->
                            <input type="hidden" name="mobileId" value="${m.mobileId}"/>
                            <tr>

                                <td class="clickable-row" 
                                    data-mobile-id="${m.mobileId}" 
                                    data-mobile-name="${m.mobileName}" 
                                    data-description="${m.description}"
                                    data-price="${m.price}" 
                                    data-year-of-production="${m.yearOfProduction}" 
                                    data-quantity="${m.quantity}" 
                                    data-not-sale="${m.notSale}" 
                                    data-image="${m.image}">
                                    <img src="./assets/images/${m.image}" alt="Default Image" style="width: 250px; height: 150px">
                                </td>
                                <td>${m.mobileId}</td>
                                <td>${m.description}</td>
<!--                                    <td>${m.price}</td>
                                <td>${m.mobileName}</td>
                                <td>${m.yearOfProduction}</td>
                                <td>${m.quantity}</td>
                                <td>${m.notSale}</td>-->
                                <td>
                                    <input type="submit" class="btn btn-outline-success quantity-button-adding" value="Add to cart" data-mobile-cart-id="${m.mobileId}" />
                                </td>
                            </tr>
                            <!--</form>-->
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div> 
            <h3>Cart</h3>
            <div class="table-responsive">
                <div class="table-wrapper">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Cart No.</th>
                                <th>User Id</th>
                                <th>Mobile Id</th>
                                <th>Quantity</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.CARTS}" var="m" varStatus="counter">
                            <form action="DispatcherServlet" method="POST">
                                <input type="hidden" name="cartId" value="${m.cartId}"/>
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${m.userId}</td>
                                    <td>${m.mobileId}</td>
                                    <td>${m.quantity}</td>
                                    <td>
                                        <input type="submit" name="action" value="Remove To Cart" class="btn btn-outline-danger"/>
                                    </td>
                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- The Modal -->
        <div id="mobileDetailModal" style="display:none;">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <h2 id="modalMobileName">Mobile Name</h2>
                <!--<img id="modalImage" alt="Mobile Image" style="width: 100px; height: 100px">-->
                <p><b>Description: </b><span id="modalDescription"></span></p>
                <p id="modalDetails"><b>Price: </b><span id="modalPrice"></span><br>
                    <b>Year of Production: </b><span id="modalYearOfProduction"></span><br>
                    <b>Quantity: </b><span id="modalQuantity"></span><br>
                    <b>Not Sale: </b><span id="modalNotSale"></span>
                </p
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div id="addToCartModal" style="display:none;">
        <div class="modal-content">
            <span class="close-button-quantity">&times;</span>
            <h2>Add to Cart</h2>
            <form method="POST" action="DispatcherServlet">
                <!--<img id="modalImage" alt="Mobile Image" style="width: 100px; height: 100px">-->
                <label for="quantity">Quantity:</label>
                <input type="number" id="cartQuantity" name="quantity" min="1">
                <input type="hidden" id="cartMobileId" name="mobileId">
                <input type="submit" class="btn btn-primary" name="action" value="Add To Cart" />
            </form>
        </div>
    </div>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    if (${requestScope.POSITIVE_NUMBER_ERROR != null}) {
        swal({
            title: "Opps!",
            text: '${requestScope.POSITIVE_NUMBER_ERROR}',
            icon: "error",
            button: "Ok"
        });
    }
    if (${requestScope.INVALID_RANGE != null}) {
        swal({
            title: "Opps!",
            text: '${requestScope.INVALID_RANGE}',
            icon: "error",
            button: "Ok"
        });
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Function to open the modal and display mobile details
        const showModal = (mobileData) => {
            document.getElementById('modalMobileName').textContent = mobileData.mobileName;
            document.getElementById('modalDescription').textContent = mobileData.description;
            document.getElementById('modalPrice').textContent = mobileData.price;
            document.getElementById('modalYearOfProduction').textContent = mobileData.yearOfProduction;
            document.getElementById('modalQuantity').textContent = mobileData.quantity;
            document.getElementById('modalNotSale').textContent = mobileData.notSale;

            document.getElementById('mobileDetailModal').style.display = "block";
        };

        // Function to open the modal and display mobile details
        const showQuantityModal = (mobileData) => {
            console.log('hehe', mobileData.mobileId)
            document.getElementById('cartMobileId').value = mobileData.mobileId;

            document.getElementById('addToCartModal').style.display = "block";
        };

        // Event listener for closing the modal
        document.querySelector('.close-button').addEventListener('click', function () {
            document.getElementById('mobileDetailModal').style.display = "none";
        });

        // Event listener for closing the modal
        document.querySelector('.close-button-quantity').addEventListener('click', function () {
            document.getElementById('addToCartModal').style.display = "none";
        });

        // Attach an event listener to each row
        document.querySelectorAll('.quantity-button-adding').forEach(row => {
            row.addEventListener('click', function () {
                const quantityData = {
                    mobileId: this.getAttribute('data-mobile-cart-id'),
                };

                showQuantityModal(quantityData);
            });
        });

        // Attach an event listener to each row
        document.querySelectorAll('.clickable-row').forEach(row => {
            row.addEventListener('click', function () {
                const mobileData = {
                    mobileId: this.getAttribute('data-mobile-id'),
                    mobileName: this.getAttribute('data-mobile-name'),
                    description: this.getAttribute('data-description'),
                    price: this.getAttribute('data-price'),
                    yearOfProduction: this.getAttribute('data-year-of-production'),
                    quantity: this.getAttribute('data-quantity'),
                    notSale: this.getAttribute('data-not-sale'),
                    image: this.getAttribute('data-image')
                };
                console.log(mobileData)
                showModal(mobileData);
            });
        });

//            // Prevent row click when the "Add To Cart" button is clicked
//            document.querySelectorAll('.btn-add-cart').forEach(button => {
//                button.addEventListener('click', function (e) {
//                    e.stopPropagation();
//                });
//            });
    });
</script>

</html>
