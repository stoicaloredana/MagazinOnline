<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MagazinOnline.Interfata.Autentificare.Register" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="../../Resurse/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../Resurse/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                    </div>
                                    <form class="user" id="form1" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" CssClass="form-control form-control-user" placeholder="User name" ID="userName"></asp:TextBox>
                                        </div>
                                        <div class="form-group ">
                                            <asp:TextBox runat="server" ID="pass1" TextMode="Password" placeholder="Password" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                        <div class="form-group ">
                                            <asp:TextBox runat="server" ID="pass2" TextMode="Password" placeholder="Repeat Password" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" Text="Register Account" CssClass="btn btn-primary btn-user btn-block" ID="btnRegister" />
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="login.html">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../../Resurse/vendor/jquery/jquery.min.js"></script>
    <script src="../../Resurse/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../Resurse/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../Resurse/js/sb-admin-2.min.js"></script>

</body>

</html>
