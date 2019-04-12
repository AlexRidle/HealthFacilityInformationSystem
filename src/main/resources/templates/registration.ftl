<#import "parts/common.ftl" as c>

<@c.page>

<link rel="stylesheet" href="/static/css/style.css">
<#if message! == "error">
<div class="alert alert-danger" role="alert">
    This username or email is already registered!
</div>
</#if>
<h5 class="mt-3 mb-3 text-center featurette-heading">Registration</h5>
<div class="container mt-3 mb-3">
    <form action="/registration" method="post">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationefaultDUsername">Username</label>
                <input type="text" class="form-control" id="validationUsername" name="username" placeholder="Username"
                       required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationPassword">Password</label>
                <input type="password" class="form-control" id="validationPassword" name="password" placeholder="Password"
                       required>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationFirstName">First name</label>
                <input type="text" class="form-control" id="validationFirstName" name="firstName"
                       placeholder="First name" required>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationMiddleName">Middle name</label>
                <input type="text" class="form-control" id="validationMiddleName" name="middleName"
                       placeholder="Middle name" required>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationLastName">Middle name</label>
                <input type="text" class="form-control" id="validationLastName" name="lastName" placeholder="Last name"
                       required>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationEmail">Email</label>
                <input type="email" class="form-control" id="validationEmail" placeholder="email" name="email" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationTel">Phone number</label>
                <input type="tel" class="form-control" id="validationTel" placeholder="+375(12)345-67-89" name="phone" required>
            </div>
        </div>
        <div class="form-row">
            <script>
                $(function () {
                    $('.datepicker').datepicker({
                        format: "yyyy-mm-dd",
                        weekStart: 1,
                        todayBtn: true,
                        todayHighlight: true
                    });
                });
            </script>
            <div class="col-md-3 mb-3">
                <label for="validationBirth">Birthday</label>
                <input type="text" class="form-control datepicker" id="validationBirth" name="birthDate" placeholder="yyyy-mm-dd" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationAddress">Address</label>
                <input type="text" class="form-control" id="validationAddress" name="address"  placeholder="Address" required>
            </div>
            <div class="col-md-1 mb-3">
                <label for="validationHouse">House</label>
                <input type="text" class="form-control" id="validationHouse" name="house" placeholder="House" required>
            </div>
            <div class="col-md-1 mb-3">
                <label for="validationRoom">Room</label>
                <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Room" required>
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                <label class="form-check-label" for="invalidCheck2">
                    Agree to terms and conditions
                </label>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit form</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</div>
</@c.page>