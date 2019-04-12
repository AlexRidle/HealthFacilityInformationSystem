<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Successfully registered a ticket! Check personal cabinet to get all requested tickets!
    </div>
    </#if>
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>Request a ticket</b></h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket">
        <#if known>
            <@mainTicket />
            <input type="hidden" value="${user.id}" name="userId">
        <#else>
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
                    <input type="text" class="form-control" id="validationLastName" name="lastName"
                           placeholder="Last name"
                           required>
                </div>
            </div>
            <div class="form-row">
                <script>
                    $(function () {
                        $('.datepicker').datepicker({
                            todayBtn: true,
                            daysOfWeekDisabled: "5,6",
                            daysOfWeekHighlighted: "5,6",
                            todayHighlight: true
                        });
                    });
                </script>
                <div class="col-md-2 mb-3">
                    <label for="validationBirth">Date of birth</label>
                    <input type="text" class="form-control datepicker" id="validationBirth" name="dateOfBirth" placeholder="Date of birth" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Phone number</label>
                    <input type="tel" class="form-control" id="validationTel" name="phone"
                           placeholder="+375(12)345-67-89" required>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Address</label>
                    <input type="text" class="form-control" id="validationAddress" name="address"
                           placeholder="Address" required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">House</label>
                    <input type="text" class="form-control" id="validationHouse" name="house" placeholder="House"
                           required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Room</label>
                    <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Room"
                           required>
                </div>
            </div>
            <@mainTicket />
        </#if>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="container text-center">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</div>
</@c.page>

<#macro mainTicket>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationDepartment">Department</label>
            <select class="custom-select" id="validationDepartment" name="department" required>
                    <#list departments as department>
                        <option value="${department}">${department}</option>
                    </#list>
            </select>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Doctor</label>
            <input type="text" class="form-control" id="validationDoctor" name="doctor" placeholder="doctor"
                   required>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDate">Date</label>
            <input type="text" class="form-control" id="validationDate" name="date_and_time" placeholder="Date"
                   required>
        </div>
    </div>
</#macro>