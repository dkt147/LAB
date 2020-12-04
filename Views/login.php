<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <title>Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

                                <!--This is the first page tester will see before Login-->
    <div class="main">

        <section class="signup">

            <div class="container">
                <div class="signup-content" style="width: 300px;margin-left:120px;margin-top: 100px">

                             <!--Login Form-->

                    <form method="POST" action="login.php" id="signup-form" class="signup-form">
                        <h2 class="form-title" style="color: white;">Login Account</h2>
                        <div class="form-group">
                            <input type="hidden" class="form-input" name="id" id="id" placeholder="id" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name" required="Enter username" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" placeholder="Password" required="Enter password" />
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <br>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Login" />
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <?php

      //Checking if button is clicked or not...
        if (isset($_POST['submit'])) {

          //Connection stablishing...
            $con = mysqli_connect("localhost", "root", "", "lab_automation");

          //Getting Data From Form...
            $id = $_POST['id'];
            $name = $_POST['name'];
            $pass = $_POST['password'];

          //Checking if the credentials are right..
            $sql = "SELECT * FROM `users` WHERE u_Name ='$name'  and u_pass = '$pass'";
            $res = mysqli_query($con, $sql);

          //Redirection after checking data..
            if ($row = mysqli_fetch_assoc($res)) {
                session_start();
                echo $_SESSION['id'] = $name;
                header("Location: http://localhost/LAB/Views/dashboard.php");
            } elseif (!isset($_SESSION['id'])) {
                echo "<script>alert('LOGIN FAILED')</script>";
            }
        }


        ?>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>