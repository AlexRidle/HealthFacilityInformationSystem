<#include "security.ftl">
<#macro login path isRegisterForm>
    <#if !isRegisterForm>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Please, log in</h5>
    <#else>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Registration</h5>
    </#if>
<form action="${path}" method="post">
        <div class="">
            <input width="500px" type="text" name="username" class="form-control" placeholder="Username"/>
        </div>
        <div>
            <input width="500px" type="password" name="password" class="form-control" placeholder="Password"/>
        </div>
    <#if isRegisterForm>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="Email"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Phone:</label>
        <div class="col-sm-6">
            <input type="tel" name="tel" class="form-control" placeholder="Phone"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">First name:</label>
        <div class="col-sm-6">
            <input type="text" name="firstName" class="form-control" placeholder="First name"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Middle name:</label>
        <div class="col-sm-6">
            <input type="text" name="middleName" class="form-control" placeholder="Middle name"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Last name:</label>
        <div class="col-sm-6">
            <input type="text" name="lastName" class="form-control" placeholder="Last name"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Address:</label>
        <div class="col-sm-6">
            <input type="text" name="address" class="form-control" placeholder="Address"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">House:</label>
        <div class="col-sm-6">
            <input type="text" name="House" class="form-control" placeholder="House"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Room:</label>
        <div class="col-sm-6">
            <input type="text" name="Room" class="form-control" placeholder="Room"/>
        </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="form-group row ml-0">
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        <div class="col-form-label ml-3">
         <#if !isRegisterForm><a href="/registration">Not registered?</a></#if>
        </div>
    </div>

</form>
</#macro>