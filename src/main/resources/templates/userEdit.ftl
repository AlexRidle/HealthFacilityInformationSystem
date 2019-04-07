<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading">Edit: <b>${user.username}</b></h5>
<div class="container mt-3 mb-3">
    <form action="/user" method="post">
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationUsername">Username</label>
                <input type="text" class="form-control" id="validationUsername" name="username" value="${user.username}"
                       placeholder="Username"
                       required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="inputRole">Role</label>
                <select class="custom-select" id="inputRole" name="inputRole">
                    <#list roles as role>
                    <option value="${role}" ${user.roles?seq_contains(role)?string("selected", "")}>${role}</option>
                    </#list>
                </select>

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

        <button type="submit" class="btn btn-lg btn-primary">Save</button>
    </form>
</div>

</@c.page>