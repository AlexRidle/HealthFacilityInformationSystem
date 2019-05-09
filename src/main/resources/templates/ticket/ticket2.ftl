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
                    <input type="text" class="form-control ${(firstNameError??)?string('is-invalid','')}" id="validationFirstName" name="firstName"
                           placeholder="First name" value="<#if ticket??>${ticket.firstName}</#if>" required>
                <#if firstNameError??>
                    <div class="invalid-feedback">
                        ${firstNameError}
                    </div>
                </#if>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationMiddleName">Отчество</label>
                    <input type="text" class="form-control ${(middleNameError??)?string('is-invalid','')}" id="validationMiddleName" name="middleName"
                           placeholder="Middle name" value="<#if ticket??>${ticket.middleName}</#if>" required>
                <#if middleNameError??>
                    <div class="invalid-feedback">
                        ${middleNameError}
                    </div>
                </#if>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationLastName">Фамилия</label>
                    <input type="text" class="form-control ${(lastNameError??)?string('is-invalid','')}" id="validationLastName" name="lastName" placeholder="Last name"
                           value="<#if ticket??>${ticket.lastName}</#if>" required>
                <#if lastNameError??>
                    <div class="invalid-feedback">
                        ${lastNameError}
                    </div>
                </#if>
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
                    <label for="validationBirth">Дата рождения</label>
                    <input type="text" class="form-control datepicker ${(birthDateError??)?string('is-invalid','')}" id="validationBirth" name="birthDate" placeholder="yyyy-mm-dd"
                           value="<#if ticket??>${ticket.birthDate}</#if>" required>
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Номер телефона</label>
                    <input type="tel" class="form-control ${(phoneError??)?string('is-invalid','')}" id="validationTel" placeholder="+375(12)345-67-89" name="phone"
                           value="<#if ticket??>${ticket.phone}</#if>" required>
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
                    </div>
                </#if>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Адрес проживания</label>
                    <input type="text" class="form-control ${(addressError??)?string('is-invalid','')}" id="validationAddress" name="address"  placeholder="Address"
                           value="<#if ticket??>${ticket.address}</#if>" required>
                <#if addressError??>
                    <div class="invalid-feedback">
                        ${addressError}
                    </div>
                </#if>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">Дом</label>
                    <input type="text" class="form-control ${(houseError??)?string('is-invalid','')}" id="validationHouse" name="house" placeholder="House"
                           value="<#if ticket??>${ticket.house}</#if>" required>
                <#if houseError??>
                    <div class="invalid-feedback">
                        ${houseError}
                    </div>
                </#if>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Кв.</label>
                    <input type="text" class="form-control ${(roomError??)?string('is-invalid','')}" id="validationRoom" name="room" placeholder="Room"
                           value="<#if ticket??>${ticket.room}</#if>" required>
                <#if roomError??>
                    <div class="invalid-feedback">
                        ${roomError}
                    </div>
                </#if>
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