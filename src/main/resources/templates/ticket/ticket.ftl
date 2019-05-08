<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "error">
    <div class="alert alert-danger" role="alert">
        Возникла ошибка. Пожалуйста, введите заного необходимую информацию и попробуйте снова.
    </div>
    </#if>
    <#if response! == "empty">
    <div class="alert alert-warning" role="alert">
        На данном отделении нет свободных врачей. Приносим свои извинения.
    </div>
    </#if>
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>Онлайн заказ талона</b></h5>
<h5 class="mt-3 mb-3 text-center lead">Заполните контактную информацию и выберите необходимое отделение</h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket">
        <#if known>
            <@mainTicket />
            <input type="hidden" value="${user.id}" name="userId">
        <#else>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationFirstName">Имя</label>
                    <input type="text" class="form-control" id="validationFirstName" name="firstName"
                           placeholder="Имя" <#if ticket?has_content>value="${ticket.firstName}"</#if> required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationMiddleName">Отчество</label>
                    <input type="text" class="form-control" id="validationMiddleName" name="middleName"
                           placeholder="Отчество" <#if ticket?has_content>value="${ticket.middleName}"</#if> required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationLastName">Фамилия</label>
                    <input type="text" class="form-control" id="validationLastName" name="lastName"
                           placeholder="Фамилия" <#if ticket?has_content>value="${ticket.lastName}"</#if>
                           required>
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
                    <input type="text" class="form-control datepicker" id="validationBirth" name="birthDate" placeholder="ГГГГ-ММ-ДД"
                           <#if ticket?has_content>value="${ticket.birthDate}"</#if> required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationTel">Номер телефона</label>
                    <input type="tel" class="form-control" id="validationTel" name="phone"
                           placeholder="+375(00)000-00-00" <#if ticket?has_content>value="${ticket.phone}"</#if> required>
                </div>
                <div class="col-md-5 mb-3">
                    <label for="validationAddress">Адрес проживания</label>
                    <input type="text" class="form-control" id="validationAddress" name="address"
                           placeholder="Адрес проживания" <#if ticket?has_content>value="${ticket.address}"</#if> required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationHouse">Дом</label>
                    <input type="text" class="form-control" id="validationHouse" name="house" placeholder="Дом"
                           <#if ticket?has_content>value="${ticket.house}"</#if> required>
                </div>
                <div class="col-md-1 mb-3">
                    <label for="validationRoom">Кв.</label>
                    <input type="text" class="form-control" id="validationRoom" name="room" placeholder="Кв."
                           <#if ticket?has_content>value="${ticket.room}"</#if> required>
                </div>
            </div>
            <@mainTicket />
        </#if>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="container text-center">
            <button type="submit" class="btn btn-outline-success">Следующий шаг</button>
        </div>
    </form>
</div>
</@c.page>

<#macro mainTicket>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationDepartment">Отделение</label>
            <select class="custom-select" id="validationDepartment" name="department" required>
                    <#list departments as department>
                        <option value="${department}">${department}</option>
                    </#list>
            </select>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDoctor">Врач</label>
            <input type="text" class="form-control" id="validationDoctor" name="doctor" placeholder="doctor"
                   disabled>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDate">Дата приема</label>
            <input type="text" class="form-control" id="validationDate" name="date_and_time" placeholder="Date"
                   disabled>
        </div>
    </div>
</#macro>