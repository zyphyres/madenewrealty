<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/PHPMailer/PHPMailer/src/Exception.php';
require 'vendor/PHPMailer/PHPMailer/src/PHPMailer.php';
require 'vendor/PHPMailer/PHPMailer/src/SMTP.php';

include("config.php");

$error = "";
$msg = "";

if (isset($_POST['reg'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $country = $_POST['country'];
    $utype = $_POST['utype'];
    // $uimage = $_FILES['uimage']['name'];
    // $temp_name1 = $_FILES['uimage']['tmp_name'];

    $query = "SELECT * FROM user WHERE uemail='$email'";
    $res = mysqli_query($con, $query);
    $num = mysqli_num_rows($res);

    if ($num == 1) {
        $error = "<p class='alert alert-warning'>Email already exists!</p>";
    } else {
        if (!empty($name) && !empty($email) && !empty($phone) && !empty($country)) {
            $sql = "INSERT INTO user (uname, uemail, uphone, ucountry, utype) 
                    VALUES ('$name', '$email', '$phone', '$country', '$utype')";
            $result = mysqli_query($con, $sql);
            // move_uploaded_file($temp_name1, "admin/user/$uimage");

            if ($result) {
                // Generate a unique token for the password creation link
                $token = bin2hex(random_bytes(50));
                $expiry_time = date("Y-m-d H:i:s", strtotime("+1 day"));

                // Store the token in the user table
                $sql_token = "UPDATE user SET upass=NULL, reset_token='$token', token_expiry='$expiry_time' WHERE uemail='$email'";
                mysqli_query($con, $sql_token);

                // Determine the appropriate account creation page based on user type
                $creation_page = 'homeowner-account-creation.php';

                // Prepare email content
                $mail = new PHPMailer(true);
                try {
                    //Server settings
                    $mail->isSMTP();
                    $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
                    $mail->SMTPAuth = true;
                    $mail->Username = 'mellomarsh686@gmail.com'; // SMTP username
                    $mail->Password = 'gddoojqokytvmgkh'; // SMTP password
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                    $mail->Port = 587;

                    //Recipients
                    $mail->setFrom('mellomarsh686@gmail.com', 'Made New Realty - MLS');
                    $mail->addAddress($email, $name);

                    // Content
                    $mail->isHTML(true);
                    $mail->Subject = 'Welcome Aboard! Account Creation';
                    $mail->Body = "
                        <h3>Welcome, $name</h3>
                        <p>Thank you for registering. Click the link below to continue the account creation:</p>
                        <a href='http://madenewrealty.test/$creation_page?token=$token'>Click Here!</a>
                        <p>This link will expire in 24 hours.</p>
                    ";

                    $mail->send();
                    $msg = "<p class='alert alert-success'>Registration successful. Check your email to continue the account creation.</p>";
                } catch (Exception $e) {
                    $error = "<p class='alert alert-warning'>Message could not be sent. Mailer Error: {$mail->ErrorInfo}</p>";
                }
            } else {
                $error = "<p class='alert alert-warning'>Registration not successful</p>";
            }
        } else {
            $error = "<p class='alert alert-warning'>Please fill all the fields</p>";
        }
    }
}
?>

<?php include("include/mainheader.php"); ?>

<body>
    <div id="page-wrapper">
        <div class="row">
            <div class="page-wrappers login-body full-row bg-gray">
                <div class="login-wrapper">
                    <div class="container">
                        <div class="loginbox">
                            <div class="login-right">
                                <div class="login-right-wrap">
                                    <h1>Register</h1>
                                    <p class="account-subtitle">Access to our dashboard</p>
                                    <?php echo $error; ?><?php echo $msg; ?>
                                    <form method="post" enctype="multipart/form-data">
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="utype" value="homeowner" checked>Homeowner/Buyer
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="utype" value="broker">Broker/Agent
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control" placeholder="Your Name*" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control" placeholder="Your Email*" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="phone" class="form-control" placeholder="Your Phone*" maxlength="10" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="country" class="form-control" placeholder="Country" required>
                                        </div>

                                        <!-- <div class="form-group">
                                            <label class="col-form-label"><b>User Image</b></label>
                                            <input class="form-control" name="uimage" type="file" required>
                                        </div> -->
                                        <div style="display: flex; justify-content: center; align-items: center; margin-top:20px;">
                                            <button class="btn btn-success" style="border-radius: 10px;" name="reg" value="Register" type="submit">Register</button>
                                        </div>
                                    </form>
                                    <div class="text-center dont-have">Already have an account? <a href="index.php">Login</a></div>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Toggle broker fields based on the selected radio button
            $('input[name="utype"]').change(function() {
                if ($(this).val() === 'broker') {
                    $('#broker-fields').show(); // Show broker fields
                } else {
                    $('#broker-fields').hide(); // Hide broker fields
                }
            });
        });
    </script>

</body>

</html>