<?php
include ("config.php");

$error = "";
$msg = "";

// Check if the token is set
if (isset($_GET['token'])) {
    $token = $_GET['token'];

    // Validate the token and check its expiry
    $query = "SELECT * FROM user WHERE reset_token='$token' AND token_expiry > NOW()";
    $result = mysqli_query($con, $query);
    $user = mysqli_fetch_assoc($result);

    if ($user) {
        // Token is valid
        if (isset($_POST['create_password'])) {
            $password = $_POST['password'];
            $confirm_password = $_POST['confirm_password'];

            if ($password === $confirm_password) {
                // Hash the password
                $hashed_password = sha1($password);

                // Update the user's password and clear the token
                $update_query = "UPDATE user SET upass='$hashed_password', reset_token=NULL, token_expiry=NULL WHERE reset_token='$token'";
                mysqli_query($con, $update_query);

                $msg = "<p class='alert alert-success'>Your password has been set successfully. <a href='index.php'>Login</a></p>";
            } else {
                $error = "<p class='alert alert-warning'>Passwords do not match.</p>";
            }
        }
    } else {
        $error = "<p class='alert alert-warning'>Invalid or expired token.</p>";
    }
} else {
    $error = "<p class='alert alert-warning'>No token provided.</p>";
}
?>

<?php include ("include/mainheader.php"); ?>

<body>
    <div id="page-wrapper">
        <div class="row">
            <div class="page-wrappers login-body full-row bg-gray">
                <div class="login-wrapper">
                    <div class="container">
                        <div class="loginbox">
                            <div class="login-right">
                                <div class="login-right-wrap">
                                    <h1>Homeowner Account Creation</h1>
                                    <p class="account-subtitle">Access to our dashboard</p>
                                    <?php echo $error; ?><?php echo $msg; ?>
                                    <form method="post">
                                        <div class="form-group">
                                            <label for="password">New Password</label>
                                            <input type="password" name="password" id="password" class="form-control"
                                                required>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirm_password">Confirm Password</label>
                                            <input type="password" name="confirm_password" id="confirm_password"
                                                class="form-control" required>
                                        </div>
                                        <button type="submit" name="create_password" class="btn btn-primary">Create
                                            Password</button>
                                    </form>
                                    <div class="text-center dont-have">Already have an account? <a
                                            href="index.php">Login</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>