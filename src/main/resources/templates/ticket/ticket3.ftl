<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if message! == "captcha">
<div class="alert alert-danger" role="alert">
    Для подтверждения регистрации талона необходимо заполнить капчу.
</div>
    </#if>
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
                    <input type="text" class="form-control ${(firstNameError??)?string('is-invalid','')}" id="validationFirstName" name="firstName"
                           placeholder="Имя" value="<#if ticket??>${ticket.firstName}</#if>" required>
                <#if firstNameError??>
                    <div class="invalid-feedback">
                        ${firstNameError}
                    </div>
                </#if>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationMiddleName">Отчество</label>
                    <input type="text" class="form-control ${(middleNameError??)?string('is-invalid','')}" id="validationMiddleName" name="middleName"
                           placeholder="Отчество" value="<#if ticket??>${ticket.middleName}</#if>" required>
                <#if middleNameError??>
                    <div class="invalid-feedback">
                        ${middleNameError}
                    </div>
                </#if>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationLastName">Фамилия</label>
                    <input type="text" class="form-control ${(lastNameError??)?string('is-invalid','')}" id="validationLastName" name="lastName" placeholder="Фамилия"
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
                    <input type="text" class="form-control datepicker ${(birthDateError??)?string('is-invalid','')}" id="validationBirth" name="birthDate" placeholder="ГГГГ-ММ-ДД"
                           value="<#if ticket??>${ticket.birthDate}</#if>" required>
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Номер телефона</label>
                    <input type="tel" class="form-control ${(phoneError??)?string('is-invalid','')}" id="validationTel" placeholder="+375-00-000-00-00" name="phone"
                           value="<#if ticket??>${ticket.phone}</#if>" required>
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
                    </div>
                </#if>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Адрес проживания</label>
                    <input type="text" class="form-control ${(addressError??)?string('is-invalid','')}" id="validationAddress" name="address"  placeholder="Адрес"
                           value="<#if ticket??>${ticket.address}</#if>" required>
                <#if addressError??>
                    <div class="invalid-feedback">
                        ${addressError}
                    </div>
                </#if>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">Дом</label>
                    <input type="text" class="form-control ${(houseError??)?string('is-invalid','')}" id="validationHouse" name="house" placeholder="Дом"
                           value="<#if ticket??>${ticket.house}</#if>" required>
                <#if houseError??>
                    <div class="invalid-feedback">
                        ${houseError}
                    </div>
                </#if>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Кв.</label>
                    <input type="text" class="form-control ${(roomError??)?string('is-invalid','')}" id="validationRoom" name="room" placeholder="Кв"
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
        <div class="form-group captcha-center mb-3">
            <div>
                <div class="g-recaptcha" data-sitekey="6LdFkKIUAAAAAJuS7l3QY5g7_-m8S-x6YIA5BIly"></div>
            </div>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-outline-success">Подтвердить регистрацию</button>
        </div>
    </form>
</div>
</@c.page>

<#macro mainTicket>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationDepartment">Отделение</label>
            <select class="custom-select" id="validationDepartment" name="department" disabled>
                <option value="${department}">${department}</option>
            </select>
        </div>
        <input type="hidden" value="${department}" name="department" required>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Врач</label>
            <select class="custom-select" id="validationDoctor" disabled>
                <option value="${ticket.doctor.id}">${ticket.doctor.user.fullName}</option>
            </select>
        </div>
        <input type="hidden" value="${ticket.doctor.id}" name="doctor" required>

        <div class="col-md-4 mb-3">
            <label for="validationDate">Дата приема</label>
            <select class="custom-select" id="validationDate" name="schedule">
            <#list schedules as schedule>
            <option value="${schedule.id}">${schedule.localDateTime}</option>
            </#list>
            </select>
        </div>
    </div>
</#macro>