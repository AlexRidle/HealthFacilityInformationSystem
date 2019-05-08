<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>Онлайн заказ талона</b></h5>
<h5 class="mt-3 mb-3 text-center lead">Выберите нужного врача в нужном вам отделении.</h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket3">
        <#if known>
            <@mainTicket />
            <input type="hidden" value="${user.id}" name="userId">
        <#else>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationFirstName">Имя</label>
                    <input type="text" class="form-control" id="validationFirstName" name="firstName"
                           placeholder="First name" value="${ticket.firstName}" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationMiddleName">Отчество</label>
                    <input type="text" class="form-control" id="validationMiddleName" name="middleName"
                           placeholder="Middle name" value="${ticket.middleName}" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationLastName">Фамилия</label>
                    <input type="text" class="form-control" id="validationLastName" name="lastName"
                           placeholder="Last name" value="${ticket.lastName}" required>
                </div>
            </div>
            <div class="form-row">
                <script>
                    $(function () {
                        $('.datepicker').datepicker({
                            format: "yyyy-mm-dd",
                            weekStart: 1,
                            // multidate: true,
                            todayBtn: true,
                            daysOfWeekDisabled: "6,0",
                            daysOfWeekHighlighted: "6,0",
                            todayHighlight: true
                        });
                    });
                </script>
                <div class="col-md-2 mb-3">
                    <label for="validationBirth">Date of birth</label>
                    <input type="text" class="form-control datepicker" id="validationBirth" name="birthDate"
                           placeholder="yyyy-mm-dd" value="${ticket.birthDate}" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Phone number</label>
                    <input type="tel" class="form-control" id="validationTel" name="phone"
                           placeholder="+375(12)345-67-89" value="${ticket.phone}" required>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Address</label>
                    <input type="text" class="form-control" id="validationAddress" name="address"
                           placeholder="Address" value="${ticket.address}" required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">House</label>
                    <input type="text" class="form-control" id="validationHouse" name="house" placeholder="House"
                           value="${ticket.house}" required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Room</label>
                    <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Room"
                           value="${ticket.room}" required>
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
            <select class="custom-select" id="validationDepartment" name="department" disabled>
                <option value="${department}">${department}</option>
            </select>
        </div>
        <input type="hidden" value="${department}" name="department" required>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Doctor</label>
            <select class="custom-select" id="validationDoctor" disabled>
                <option value="${ticket.doctor.id}">${ticket.doctor.user.fullName}</option>
            </select>
        </div>
        <input type="hidden" value="${ticket.doctor.id}" name="doctor" required>

        <div class="col-md-4 mb-3">
            <label for="validationDate">Date</label>
            <select class="custom-select" id="validationDate" name="schedule">
            <#list schedules as schedule>
            <option value="${schedule.id}">${schedule.localDateTime}</option>
            </#list>
            </select>
        </div>
    </div>
</#macro>