

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                background: linear-gradient(#02173f, #0a315e);
                font-family: sans-serif;
            }
            .container {
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 2rem;
                cursor: pointer;
            }
            .container form {
                flex: 0 1;
                min-height: 300px;
                min-width: 300px;
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                align-items: center;
                column-gap: 10px;
                background-color: #01163d;
                padding: 1rem;
                border-radius: 0.5rem;
                -webkit-border-radius: 0.5rem;
                -moz-border-radius: 0.5rem;
                -ms-border-radius: 0.5rem;
                -o-border-radius: 0.5rem;
                box-shadow: 1px 2px 13px -1px #01163d;
                cursor: pointer;
            }
            .container form h1 {
                font-size: 1.5rem;
                color: white;
                font-weight: 400;
                margin-bottom: 1rem;
            }
            .container form .t-input {
                position: relative;
                width: 100%;
            }
            .container form .t-input input {
                width: 100%;
                min-height: 40px;
                color: white;
                background-color: transparent;
                outline: none;
                border: none;
                font-size: 1rem;
                font-weight: lighter;
                position: relative;
                white-space: 0.5;
                caret-color: #fb32a4;
            }
            .container form .t-input input::placeholder {
                opacity: 0;
            }
            .container form .t-input .b-line {
                content: "";
                position: absolute;
                height: 2px;
                width: 35%;
                background: linear-gradient(90deg, #fb32a4 0%,
                    transparent 100%);
                bottom: 0;
                left: 0;
                transition-duration: 300ms;
            }
            .container form .t-input input:not(:placeholder-shown) ~ .b-line,
            .container form .t-input:hover .b-line,
            .container form .t-input:focus-within .b-line {
                background: linear-gradient(90deg, #fb32a4 0%,
                    transparent 100%);
                width: 100%;
            }
            .container form .t-input label {
                outline: none;
            }
            .container form .t-input:hover label {
                color: #fb32a4;
            }
            .container form .t-input input + label {
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                -webkit-transform: translateY(-50%);
                -moz-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                -o-transform: translateY(-50%);
                color: white;
                transition-duration: 150ms;
            }
            .container form .t-input input:not(:placeholder-shown) + label,
            .container form .t-input input:focus + label {
                font-size: 0.75rem;
                transform: translateY(-180%);
                -webkit-transform: translateY(-180%);
                -moz-transform: translateY(-180%);
                -ms-transform: translateY(-180%);
                -o-transform: translateY(-180%);
                color: #fb32a4;
            }
            .container form .check {
                align-self: flex-start;
                height: 30px;
                position: relative;

            }
            .container form .check input {
                appearance: none;

            }
            .container form .check input + label {
                color: white;
                font-size: 0.75rem;
                padding-left: 1.5rem;
                transition-duration: 100ms;
                cursor: pointer;
            }
            .container form .check input:focus + label,
            .container form .check input:checked + label {
                color:#fb32a4;
            }
            .container form .check input:focus + label::before {
                border-color: #fb32a4;
            }
            .container form .check input + label::before {
                content: "";
                position: absolute;
                width: 1rem;
                height: 1rem;
                border: 2px solid white;
                top: 50%;
                transform: translateY(-60%);
                -webkit-transform: translateY(-60%);
                -moz-transform: translateY(-60%);
                -ms-transform: translateY(-60%);
                -o-transform: translateY(-60%);
                transition-duration: 100ms;
                left: 0;
                outline: none;
            }
            .container form .check input:checked + label::before {
                border: 2px solid #fb32a4;
                width: 6px;
                height: 0.9rem;
                transform: translate(75%, -85%) rotate(45deg);
                -webkit-transform: translate(75%, -85%) rotate(45deg);
                -moz-transform: translate(75%, -85%) rotate(45deg);
                -ms-transform: translate(75%, -85%) rotate(45deg);
                -o-transform: translate(75%, -85%) rotate(45deg);
                border-color: transparent #fb32a4 #fb32a4
                    transparent;
            }
            .container form .check input:checked + label:hover {
                color: #fb32a4;
                opacity: 0.5;
            }
            .container form .check input:checked + label:hover::before {
                border-color: transparent #fb32a4 #fb32a4
                    transparent;
                opacity: 0.5;
            }
            .container form .check input + label:hover {
                color: #fb32a4;
            }
            .container form .button {
                align-self: flex-end;
                width: 100px;
                height: 30px;
                background: transparent;
                position: relative;
                font-size: 1rem;
                border: none;
                transition-duration: 300ms;
                font-weight: 700;
                border: 1px solid #fb32a4;
                color: white;
                z-index: 1;
                border-radius: 2rem;
                animation: neon 2s infinite linear;
                cursor: pointer;
            }
            .container form .button:focus,
            .container form .button:hover {
                background-color: #fb32a4;
                border: none;
                outline: 1px solid #fb32a4;
                color: white;
                animation: none;
                box-shadow: 0 0 20px 10px #fb32a4d1;
            }
            @keyframes neon {
                0% {
                    background-color: #fb32a4;
                    box-shadow: 0 0 20px 10px #fb32a4d1;
                }
                5% {
                    background-color: transparent;
                }
                10% {
                    background-color: #fb32a4;
                }
                15% {
                    background-color: transparent;
                }
                20% {
                    background-color: #fb32a4;
                }
                25% {
                    background-color: transparent;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="DispatcherServlet">
                <h1>Login</h1>
                <div class="username t-input">
                    <input type="text" required="" id="username"
                           name="txtUserId"
                           placeholder="." />
                    <label for="username">Username</label>
                    <div class="b-line"></div>
                </div>
                <div class="password t-input">
                    <input type="password" required="" id="password"
                           name="txtPassword"
                           placeholder="." />
                    <label for="password">Password</label>
                    <div class="b-line"></div>
                </div>

                <input type="submit" name="action" value="Login" class="button"/>
            </form>
        </div>
    </body>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        var tmp = '${requestScope.invalid_credential}';
        if (${requestScope.invalid_credential != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.invalid_credential}',
                icon: "error",
                button: "Ok"
            });
        }
        if (${requestScope.invalid_password != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.invalid_password}',
                icon: "error",
                button: "Ok"
            });
        }
    </script>
</html>
