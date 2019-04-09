<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <link rel="stylesheet" href="/static/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
    Successfully edited account
    </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading"><b>Personal cabinet</b></h5>
<div class="container" >
    <a class="btn btn-secondary btn-lg btn-block" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">Edit personal account</a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data" action="/account">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationUsername">Username</label>
                        <input type="text" class="form-control" id="validationUsername" name="username"
                               value="${user.username}"
                               placeholder="Username"
                               required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationPassword">Password</label>
                        <input type="password" class="form-control" id="validationPassword" name="password"
                               value="${user.password}" placeholder="Password"
                               required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationFirstName">First name</label>
                        <input type="text" class="form-control" id="validationFirstName" name="firstName"
                               value="${user.firstName}"
                               placeholder="First name" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationMiddleName">Middle name</label>
                        <input type="text" class="form-control" id="validationMiddleName" name="middleName"
                               value="${user.middleName}"
                               placeholder="Middle name" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationLastName">Middle name</label>
                        <input type="text" class="form-control" id="validationLastName" name="lastName" placeholder="Last name"
                               value="${user.lastName}"
                               required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationEmail">Email</label>
                        <input type="email" class="form-control" id="validationEmail" name="email" placeholder="email" value="${user.email}"
                               required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationTel">Phone number</label>
                        <input type="tel" class="form-control" id="validationTel" name="phone" placeholder="+375(12)345-67-89"
                               value="${user.phone}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationAddress">Address</label>
                        <input type="text" class="form-control" id="validationAddress" name="address" placeholder="Address"
                               value="${user.address}" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationHouse">House</label>
                        <input type="text" class="form-control" id="validationHouse" name="house" placeholder="House"
                               value="${user.house}" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationRoom">Room</label>
                        <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Room"
                               value="${user.room}" required>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

</@c.page>