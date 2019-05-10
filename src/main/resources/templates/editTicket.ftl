<#import "parts/common.ftl" as c>

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Талон был успешно изменен!
    </div>
    </#if>
    <#if response! == "error">
    <div class="alert alert-danger" role="alert">
        Возникла ошибка. Пожалуйста, попробуйте еще раз.
    </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Просмотр талона</h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket/edit/${ticket.id}" >
        <input type="hidden" value="${ticket.id}" name="ticketId">
        <div class="form-group row">
            <label for="validationFirstName" class="col-sm-2 col-form-label">Имя</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationFirstName" name="firstName"
                       value="${ticket.firstName}" placeholder="Имя" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationMiddleName" class="col-sm-2 col-form-label">Отчество</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationMiddleName" name="middleName"
                       value="${ticket.middleName}" placeholder="Отчество" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationLastName" class="col-sm-2 col-form-label">Фамилия</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationLastName" name="lastName"
                       value="${ticket.lastName}" placeholder="Фамилия" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationBirth" class="col-sm-2 col-form-label">Дата рождения</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationBirth" name="birthDate"
                       value="${ticket.birthDate}" placeholder="ГГГГ-ММ-ДД" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationTel" class="col-sm-2 col-form-label">Номер телефона</label>
            <div class="col-sm-10">
                <input type="tel" readonly class="form-control" id="validationTel" name="phone"
                       value="${ticket.phone}" placeholder="+375-00-000-00-00" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationAddress" class="col-sm-2 col-form-label">Адрес</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationAddress" name="address"
                       value="${ticket.address}" placeholder="Адрес" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationHouse" class="col-sm-2 col-form-label">Дом</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationHouse" name="house"
                       value="${ticket.house}" placeholder="Дом" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationRoom" class="col-sm-2 col-form-label">Квартира</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationRoom" name="room"
                       value="${ticket.room}" placeholder="Квартира" required>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="form-group row">
            <label for="validationDepartment" class="col-sm-2 col-form-label">Отделение</label>
            <div class="col-sm-10">
                <select class="custom-select" id="validationDepartment" name="department" disabled>
                     <option value="${ticket.department}">${ticket.department}</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationDoctor" class="col-sm-2 col-form-label">Врач</label>
            <div class="col-sm-10">
                <select class="custom-select" id="validationDoctor" name="doctor" disabled>
                    <option value="${ticket.doctor}">${ticket.doctor.user.fullName}</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationDate" class="col-sm-2 col-form-label">Дата приема</label>
            <div class="col-sm-10">
                <select class="custom-select" id="validationDate" name="date_and_time" disabled>
                    <option value="${ticket.schedule.id}">${ticket.schedule.localDateTime}</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationResult" class="col-sm-2 col-form-label">Заключение</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="validationResult" name="result"
                       <#if ticket.result?has_content>
                           value="${ticket.result}"
                       </#if>
                       placeholder="Заключение">
            </div>
        </div>
        <div class="container text-center">
            <button class="btn btn-primary" type="submit">Изменить</button>
        </div>
    </form>
</div>
    <#include "parts/footer.ftl">

</@c.page>