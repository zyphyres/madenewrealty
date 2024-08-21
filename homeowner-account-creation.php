<?php
include("config.php");

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
                                    <h1 class="account-title">Homeowner Account Creation</h1>
                                    <p class="account-subtitle">Access to our dashboard</p>
                                    <?php echo $error; ?><?php echo $msg; ?>
                                    <label id="user-type" style="display: none;"><?php echo $user['utype']; ?></label>
                                    <form method="post">
                                        <div id="broker-fields" style="display: none;">
                                            <div class="form-group">
                                                <label for="license_number">License Number</label>
                                                <input type="text" name="license_number" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="agency_name">Agency Name</label>
                                                <input type="text" name="agency_name" class="form-control">
                                            </div>
                                        </div>

                                        <label>I. Personal Details</label>
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" value="<?php echo $user['uname'] ?>" class="form-control" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Email</label>
                                            <input type="text" value="<?php echo $user['uemail'] ?>" class="form-control" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Phone</label>
                                            <input type="text" value="<?php echo $user['uphone'] ?>" class="form-control" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Country</label>
                                            <input type="text" value="<?php echo $user['ucountry'] ?>" class="form-control" disabled>
                                        </div>

                                        <label>II. Important Question <span style="color: red;">*</span></label>
                                        <div class="form-group">
                                            <label>Do you have an appointed Broker or Agent?</label>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="uapp" value="Yes">Yes
                                                </label>
                                            </div>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="uapp" value="No" checked>No
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group" id="appointed" style="display: none;">
                                            <label for="agent_name">Referror Broker / Agent :</label>
                                            <input type="text" name="agent_name" id="agent_name" class="form-control" required>
                                        </div>

                                        <label>III. Objectives <span style="color: red;">*</span></label>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="uobb" value="Sell">To Sell a Personal property
                                            </label>
                                            <div class="form-group" id="tosell" style="display: none;">
                                                <label>Type of Ownership</label>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="uown" value="Other"> Owned
                                                        <input type="radio" class="form-check-input" name="uown" value="Other"> Parents
                                                        <input type="radio" class="form-check-input" name="uown" value="Other"> Relatives
                                                        <input type="radio" class="form-check-input" name="uown" value="Other"> Friends
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="uobb" value="Buy">To Buy a property
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="uobb" value="Rent">To Rent a Property
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="uobb" value="Other">Other Services
                                            </label>
                                        </div>




                                        <div class="form-group">
                                            <label for="password">New Password</label>
                                            <input type="password" name="password" id="password" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirm_password">Confirm Password</label>
                                            <input type="password" name="confirm_password" id="confirm_password" class="form-control" required>
                                        </div>

                                        <div id="broker-fields" style="display: none;">
                                            <div class="form-group">
                                                <input type="text" name="license_number" class="form-control" placeholder="License Number">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="agency_name" class="form-control" placeholder="Agency Name">
                                            </div>
                                        </div>
                                        <button type="submit" name="create_password" class="btn btn-primary">Create Password</button>
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
            // Show/hide the appointed div based on selected radio button
            $('input[name="uapp"]').change(function() {
                if ($(this).val() === 'Yes') {
                    $('#appointed').show();
                } else {
                    $('#appointed').hide();
                }
            });

            $('input[name="uobb"]').change(function() {
                if ($(this).val() === 'Sell') {
                    $('#tosell').show();
                } else {
                    $('#tosell').hide();
                }
            });
            // Check the value of the hidden label
            var userType = $('#user-type').text().trim();

            // If the user type is agent, show the broker fields
            if (userType === 'agent') {
                $('#broker-fields').show();
                $('.account-title').text('Broker Account Creation')
            }
        });
    </script>
</body>

</html>