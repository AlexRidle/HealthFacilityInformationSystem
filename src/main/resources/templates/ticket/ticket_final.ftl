<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>Онлайн заказ талона завершен!</b></h5>
<h5 class="mt-3 mb-3 text-center lead">Благодарим за регистрацию.</h5>
<h5 class="mt-3 mb-3 text-center lead">Данный талон будет сохранен в личном кабинете при наличии аккаунта</h5>
<h5 class="mt-3 mb-3 text-center lead">Если же у вас его нет - просим запомнить дату приема.</h5>

<div class="container">
        <#if known>
            <@mainTicket />
            <input type="hidden" value="${user.id}" name="userId">
        <#else>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationFirstName">Имя</label>
                    <input type="text" class="form-control" id="validationFirstName" name="firstName"
                           placeholder="First name" value="${ticket.firstName}" disabled>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationMiddleName">Отчество</label>
                    <input type="text" class="form-control" id="validationMiddleName" name="middleName"
                           placeholder="Middle name" value="${ticket.middleName}" disabled>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationLastName">Фамилия</label>
                    <input type="text" class="form-control" id="validationLastName" name="lastName"
                           placeholder="Last name" value="${ticket.lastName}" disabled>
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
                           placeholder="yyyy-mm-dd" value="${ticket.birthDate}" disabled>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Phone number</label>
                    <input type="tel" class="form-control" id="validationTel" name="phone"
                           placeholder="+375(12)345-67-89" value="${ticket.phone}" disabled>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Address</label>
                    <input type="text" class="form-control" id="validationAddress" name="address"
                           placeholder="Address" value="${ticket.address}" disabled>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">House</label>
                    <input type="text" class="form-control" id="validationHouse" name="house" placeholder="House"
                           value="${ticket.house}" disabled>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Room</label>
                    <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Room"
                           value="${ticket.room}" disabled>
                </div>
            </div>
            <@mainTicket />
        </#if>
</div>
</@c.page>

<#macro mainTicket>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationDepartment">Department</label>
            <select class="custom-select" id="validationDepartment" name="department" disabled>
                <option value="${ticket.department}">${ticket.department}</option>
            </select>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Doctor</label>
            <select class="custom-select" id="validationDoctor" name="doctor" disabled>
                <option value="${ticket.doctor}">${ticket.doctor.user.fullName}</option>
            </select>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDate">Date</label>
            <select class="custom-select" id="validationDate" name="schedule" disabled>
            <option value="${ticket.schedule.id}">${ticket.schedule.localDateTime}</option>
            </select>
        </div>
    </div>
</#macro>