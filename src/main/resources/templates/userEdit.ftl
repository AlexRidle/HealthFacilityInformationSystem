<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading">Изменение пользователя:</h5>
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>${user.username}</b></h5>
<div class="container mt-3 mb-3">
    <form action="/user/${user.id}" method="post">
        <input type="hidden" value="${user.id}" name="userId">
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
            <div class="col-md-<#if doctor?has_content>3<#else>6</#if> mb-3">
                <label for="inputRole">Роль</label>
                <select class="custom-select" id="inputRole" name="inputRole">
                    <#list roles as role>
                    <option value="${role}" ${user.roles?seq_contains(role)?string("selected", "")}>${role}</option>
                    </#list>
                </select>
            </div>
    <#if doctor?has_content>
            <div class="col-md-3 mb-3">
                <label for="inputDepartment">Отделение</label>
                <select class="custom-select" id="inputDepartment" name="department" required>
                    <#list departments as department>
                        <option value="${department}" <#if doctor?has_content>${doctor.department?matches(department)?string("selected", "")}</#if>>${department}</option>
                    </#list>
                </select>
            </div>
    </#if>
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
                <input type="email" class="form-control ${(emailError??)?string('is-invalid','')}" id="validationEmail" placeholder="Еmail" name="email"
                       value="<#if user??>${user.email}</#if>" required>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <div class="col-md-3 mb-3">
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
            <div class="col-md-3 mb-3">
                <label for="validationBirth">Дата рождения</label>
                <input type="text" class="form-control datepicker ${(birthDateError??)?string('is-invalid','')}" id="validationBirth" name="birthDate" placeholder="ГГГГ-ММ-ДД"
                       value="<#if user??>${user.birthDate}</#if>" required>
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-row">
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
            <div class="col-md-3 mb-3">
                <label for="validationHouse">Дом</label>
                <input type="text" class="form-control ${(houseError??)?string('is-invalid','')}" id="validationHouse" name="house" placeholder="Дом"
                       value="<#if user??>${user.house}</#if>" required>
                <#if houseError??>
                    <div class="invalid-feedback">
                        ${houseError}
                    </div>
                </#if>
            </div>
            <div class="col-md-3 mb-3">
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
        <button type="submit" class="btn btn-lg btn-primary">Сохранить изменения</button>
        </div>
    </form>
</div>

</@c.page>