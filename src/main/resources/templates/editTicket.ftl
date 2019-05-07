<#import "parts/common.ftl" as c>

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Successfully edited ticket!
    </div>
    </#if>
    <#if response! == "error">
    <div class="alert alert-danger" role="alert">
        An error occurred. Please, try to edit the ticket again.
    </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Ticket editor</h5>

<div class="container">
    <form method="post" enctype="multipart/form-data" action="/ticket/edit/${ticket.id}" >
        <input type="hidden" value="${ticket.id}" name="ticketId">
        <div class="form-group row">
            <label for="validationFirstName" class="col-sm-2 col-form-label">First name</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationFirstName" name="firstName"
                       value="${ticket.firstName}" placeholder="First name" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationMiddleName" class="col-sm-2 col-form-label">Middle name</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationMiddleName" name="middleName"
                       value="${ticket.middleName}" placeholder="Middle name" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationLastName" class="col-sm-2 col-form-label">Middle name</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationLastName" name="lastName"
                       value="${ticket.lastName}" placeholder="Last name" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationBirth" class="col-sm-2 col-form-label">Date of birth</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationBirth" name="birthDate"
                       value="${ticket.birthDate}" placeholder="yyyy-mm-dd" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationTel" class="col-sm-2 col-form-label">Phone number</label>
            <div class="col-sm-10">
                <input type="tel" readonly class="form-control" id="validationTel" name="phone"
                       value="${ticket.phone}" placeholder="+375(12)345-67-89" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationAddress" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationAddress" name="address"
                       value="${ticket.address}" placeholder="Address" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationHouse" class="col-sm-2 col-form-label">House</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationHouse" name="house"
                       value="${ticket.house}" placeholder="House" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationRoom" class="col-sm-2 col-form-label">Room</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control" id="validationRoom" name="room"
                       value="${ticket.room}" placeholder="Room" required>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="form-group row">
            <label for="validationDepartment" class="col-sm-2 col-form-label">Department</label>
            <div class="col-sm-10">
                <select class="custom-select" id="validationDepartment" name="department" required>
                    <#list departments as department>
                        <option value="${department}">${department}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationDoctor" class="col-sm-2 col-form-label">Doctor</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="validationDoctor" name="doctor" placeholder="doctor"
                       value="${ticket.doctor.user.fullName}" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationDate" class="col-sm-2 col-form-label">Date</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="validationDate" name="date_and_time" placeholder="Date"
                       value="${ticket.schedule.localDateTime}" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="validationResult" class="col-sm-2 col-form-label">Result</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="validationResult" name="result"
                       <#if ticket.result?has_content>
                           value="${ticket.result}"
                       </#if>
                       placeholder="Result">
            </div>
        </div>
        <div class="container text-center col-sm-2">
            <button type="submit" class="btn btn-primary">Edit</button>
        </div>
    </form>
</div>
</@c.page>