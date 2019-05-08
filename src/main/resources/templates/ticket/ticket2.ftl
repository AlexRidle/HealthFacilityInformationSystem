<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "empty">
    <div class="alert alert-warning" role="alert">
        У данного врача нет доступных талонов.
    </div>
    </#if>

<h5 class="mt-3 mb-3 text-center featurette-heading"><b>Онлайн заказ талона</b></h5>
<h5 class="mt-3 mb-3 text-center lead">Выберите нужного врача в нужном вам отделении.</h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket2">
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
            <label for="validationDepartment">Отделение</label>
            <select class="custom-select" id="validationDepartment" name="department1" disabled>
                <option value="${department}">${department}</option>
            </select>
        </div>
        <input type="hidden" value="${department}" name="department" required>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Doctor</label>
            <select class="custom-select" id="validationDoctor" name="doctor" required>
                    <#list doctors as doctor>
                        <option value="${doctor.id}">${doctor.user.fullName}</option>
                    </#list>
            </select>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDate">Date</label>
            <input type="text" class="form-control" id="validationDate" name="date_and_time" placeholder="Date"
                   disabled>
        </div>
    </div>
</#macro>