<#import "parts/common.ftl" as c>

<@c.page>

<link rel="stylesheet" href="/static/css/style.css">
<#if message! == "error">
<div class="alert alert-danger" role="alert">
    This username or email is already registered!
</div>
</#if>
<h5 class="mt-3 mb-3 text-center featurette-heading">Registration</h5>
<div class="container mt-3 mb-3">
    <form action="/registration" method="post">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationefaultDUsername">Username</label>
                <input type="text" class="form-control ${(usernameError??)?string('is-invalid','')}" id="validationUsername" name="username" placeholder="Username"
                       value="<#if user??>${user.username}</#if>" required>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationPassword">Password</label>
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid','')}" id="validationPassword" name="password" placeholder="Password" required>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationFirstName">First name</label>
                <input type="text" class="form-control ${(firstNameError??)?string('is-invalid','')}" id="validationFirstName" name="firstName"
                       placeholder="First name" value="<#if user??>${user.firstName}</#if>" required>
                <#if firstNameError??>
                    <div class="invalid-feedback">
                        ${firstNameError}
                    </div>
                </#if>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationMiddleName">Middle name</label>
                <input type="text" class="form-control ${(middleNameError??)?string('is-invalid','')}" id="validationMiddleName" name="middleName"
                       placeholder="Middle name" value="<#if user??>${user.middleName}</#if>" required>
                <#if middleNameError??>
                    <div class="invalid-feedback">
                        ${middleNameError}
                    </div>
                </#if>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationLastName">Last name</label>
                <input type="text" class="form-control ${(lastNameError??)?string('is-invalid','')}" id="validationLastName" name="lastName" placeholder="Last name"
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
                <label for="validationTel">Phone number</label>
                <input type="tel" class="form-control ${(phoneError??)?string('is-invalid','')}" id="validationTel" placeholder="+375(12)345-67-89" name="phone"
                       value="<#if user??>${user.phone}</#if>" required>
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
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
                        todayBtn: true,
                        todayHighlight: true
                    });
                });
            </script>
            <div class="col-md-3 mb-3">
                <label for="validationBirth">Birthday</label>
                <input type="text" class="form-control datepicker ${(birthDateError??)?string('is-invalid','')}" id="validationBirth" name="birthDate" placeholder="yyyy-mm-dd"
                       value="<#if user??>${user.birthDate}</#if>" required>
                <#if birthDateError??>
                    <div class="invalid-feedback">
                        ${birthDateError}
                    </div>
                </#if>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationAddress">Address</label>
                <input type="text" class="form-control ${(addressError??)?string('is-invalid','')}" id="validationAddress" name="address"  placeholder="Address"
                       value="<#if user??>${user.address}</#if>" required>
                <#if addressError??>
                    <div class="invalid-feedback">
                        ${addressError}
                    </div>
                </#if>
            </div>
            <div class="col-md-1 mb-3">
                <label for="validationHouse">House</label>
                <input type="text" class="form-control ${(houseError??)?string('is-invalid','')}" id="validationHouse" name="house" placeholder="House"
                       value="<#if user??>${user.house}</#if>" required>
                <#if houseError??>
                    <div class="invalid-feedback">
                        ${houseError}
                    </div>
                </#if>
            </div>
            <div class="col-md-1 mb-3">
                <label for="validationRoom">Room</label>
                <input type="text" class="form-control ${(roomError??)?string('is-invalid','')}" id="validationRoom" name="room" placeholder="Room"
                       value="<#if user??>${user.room}</#if>" required>
                <#if roomError??>
                    <div class="invalid-feedback">
                        ${roomError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                <label class="form-check-label" for="invalidCheck2">
                    Agree to terms and conditions
                </label>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit form</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</div>
</@c.page>