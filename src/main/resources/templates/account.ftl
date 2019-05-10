<#import "parts/common.ftl" as c>
<#--<#include "parts/security.ftl">-->

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
    Данные аккаунта успешно изменены!
    </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading"><b>Личный кабинет</b></h5>
<div class="container" >
    <a class="btn btn-outline-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#editForm" role="button" aria-expanded="false"
       aria-controls="collapseExample">Редактировать аккаунт</a>
    <div class="collapse <#if response! == "invalid">show</#if>" id="editForm">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data" action="/account">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationUsername">Имя пользователя</label>
                        <input type="text" class="form-control ${(usernameError??)?string('is-invalid','')}" id="validationUsername" name="username" placeholder="Имя пользователя"
                               value="<#if user??>${user.username}</#if>" required>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationPassword">Пароль</label>
                        <input type="password" class="form-control ${(passwordError??)?string('is-invalid','')}" id="validationPassword" name="password" placeholder="Пароль" value="<#if user??>${user.password}</#if>" required>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationFirstName">Имя</label>
                        <input type="text" class="form-control ${(firstNameError??)?string('is-invalid','')}" id="validationFirstName" name="firstName"
                               placeholder="Имя" value="<#if user??>${user.firstName}</#if>" required>
                <#if firstNameError??>
                    <div class="invalid-feedback">
                        ${firstNameError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationMiddleName">Отчество</label>
                        <input type="text" class="form-control ${(middleNameError??)?string('is-invalid','')}" id="validationMiddleName" name="middleName"
                               placeholder="Отчество" value="<#if user??>${user.middleName}</#if>" required>
                <#if middleNameError??>
                    <div class="invalid-feedback">
                        ${middleNameError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationLastName">Фамилия</label>
                        <input type="text" class="form-control ${(lastNameError??)?string('is-invalid','')}" id="validationLastName" name="lastName" placeholder="Фамилия"
                               value="<#if user??>${user.lastName}</#if>" required>
                <#if lastNameError??>
                    <div class="invalid-feedback">
                        ${lastNameError}
                    </div>
                </#if>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationEmail">Email</label>
                        <input type="email" class="form-control ${(emailError??)?string('is-invalid','')}" id="validationEmail" placeholder="email" name="email"
                               value="<#if user??>${user.email}</#if>" required>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationTel">Номер телефона</label>
                        <input type="tel" class="form-control ${(phoneError??)?string('is-invalid','')}" id="validationTel" placeholder="+375-00-000-00-00" name="phone"
                               value="<#if user??>${user.phone}</#if>" required>
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
                    </div>
                </#if>
                    </div>
                    <script>
                        $(function () {
                            $('.datepicker').datepicker({
                                format: "yyyy-mm-dd",
                                weekStart: 1,
                                todayBtn: true,
                                todayHighlight: true
                            });
                        });
                    </script>
                    <div class="col-md-4 mb-3">
                        <label for="validationBirth">Дата рождения</label>
                        <input type="text" class="form-control datepicker ${(birthDateError??)?string('is-invalid','')}" id="validationBirth" name="birthDate" placeholder="ГГГГ-ММ-ДД"
                               value="<#if user??>${user.birthDate}</#if>" required>
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationAddress">Адрес</label>
                        <input type="text" class="form-control ${(addressError??)?string('is-invalid','')}" id="validationAddress" name="address"  placeholder="Адрес"
                               value="<#if user??>${user.address}</#if>" required>
                <#if addressError??>
                    <div class="invalid-feedback">
                        ${addressError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-1 mb-3">
                        <label for="validationHouse">Дом</label>
                        <input type="text" class="form-control ${(houseError??)?string('is-invalid','')}" id="validationHouse" name="house" placeholder="Дом"
                               value="<#if user??>${user.house}</#if>" required>
                <#if houseError??>
                    <div class="invalid-feedback">
                        ${houseError}
                    </div>
                </#if>
                    </div>
                    <div class="col-md-1 mb-3">
                        <label for="validationRoom">Кв</label>
                        <input type="text" class="form-control ${(roomError??)?string('is-invalid','')}" id="validationRoom" name="room" placeholder="Кв"
                               value="<#if user??>${user.room}</#if>" required>
                <#if roomError??>
                    <div class="invalid-feedback">
                        ${roomError}
                    </div>
                </#if>
                    </div>
                </div>
                <div class="container text-center">
                    <button type="submit" class="btn btn-outline-primary">Сохранить</button>
                </div>
            </form>
        </div>
    </div>
    <a class="btn btn-outline-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#ticketHistory" role="button" aria-expanded="false"
       aria-controls="collapseExample">История заказов талонов</a>
    <div class="collapse" id="ticketHistory">
        <div class="form-group">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Отделение</th>
                    <th scope="col">Врач</th>
                    <th scope="col">Дата приема</th>
                    <th scope="col">Заключение</th>
                </tr>
                </thead>
                <tbody>
        <#list tickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.getDepartment()}</td>
            <td width="1%">${ticket.getDoctor().getUser().getFullName()}</td>
            <td width="10%">${ticket.getSchedule().getLocalDateTime()}</td>
            <td>${ticket.getResult()!}</td>
        </#list>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
    <#include "parts/footer.ftl">

</@c.page>