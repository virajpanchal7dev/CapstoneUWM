<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> UWM - ISSS </title>
    <!-- importing fontawesome kit -->
    <script src="https://kit.fontawesome.com/667417c7ec.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  					crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
	<link rel="stylesheet" href="login.css">
</head>

<body>

    <div class="container">
        <i id="account" class="fas fa-users"></i>
        <div class="tabs">
            <!-- <h2 class="reg-tab">Register</h2> -->
            <h2 class="login-tab">Login</h2>
        </div>
        <!-- login part -->
        <div id="login-form">
            <form action="login" method="post" id="loginForm">
                <input type="text" name="email" id="email" placeholder="Email">
                <input type="password" name="password" id="pass" placeholder="Password">
                <br>${message}	
                <!-- <div class="options">
                    <div class="remember">
                        <input type="checkbox" name="rem" id="rem">
                        <p>Remember Me</p>
                    </div>
                    <a href="#">Forget Password ?</a>
                </div> -->
                <button type="submit">Login</button>
            </form>
        </div>
        <!-- Lets add registration form -->
        <!-- <div id="registration-form">
            <form action="">
                <input type="text" name="username" id="username" placeholder="Enter Username">
                <input type="email" name="email" id="email" placeholder="Enter Email">
                <input type="password" name="pass" id="pass" placeholder="Enter Password">
                <input type="password" name="confirm-pass" id="conform-pass" placeholder="Confirm Password">
                <div class="tnc">
                    <input type="checkbox" name="accept" id="accept">
                    <p>I accept the <a href="#">Terms & Conditions</a></p>
                </div>
                <button type="submit">Register</button>
            </form>
        </div> -->

    </div>
    <!-- lets use some javascript to make these tabs to work -->
    <!-- <script>
        const reg_form = document.querySelector("#registration-form");
        const login_form = document.querySelector("#login-form");

        const reg_tab = document.querySelector('.reg-tab');
        const login_tab = document.querySelector('.login-tab');

        reg_tab.addEventListener('click',e=>{
            login_form.style.display = 'none';
            reg_form.style.display = 'block';
            reg_tab.classList.add('active');
            login_tab.classList.remove('active')
        })
        login_tab.addEventListener('click',e=>{
            reg_form.style.display = 'none';
            login_form.style.display = 'block';
            reg_tab.classList.remove('active');
            login_tab.classList.add('active')
        })

    </script> -->
    <script type="text/javascript">

		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
			
					password: "required",
				},
				
				messages: {
					email: {
						required: "Please enter email",
						email: "Please enter a valid email address"
					},
					
					password: "Please enter password"
				}
			});
	
		});
	</script>
</body>

</html>