<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading"><b>${doctor.user.fullName}</b></h5>
<h5 class="mt-3 mb-3 text-center featurette-heading">${doctor.department}</h5>
<div class="container">
    <a class="btn btn-success btn-lg btn-block mb-3" data-toggle="collapse" href="#unregisteredSchedule" role="button"
       aria-expanded="false"
       aria-controls="collapseExample">Open unregistered schedules</a>
    <div class="collapse" id="unregisteredSchedule">
        <div class="form-group">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Doctor</th>
                    <th scope="col">Time</th>
                    <th scope="col">Control</th>
                </tr>
                </thead>
                <tbody>
        <#list schedules as schedule>
        <#--<tr onclick="window.location='/user/${user.id}';">-->
        <tr>
            <td width="1%">${schedule?counter}</td>
            <td>${schedule.doctor.user.fullName}</td>
            <td width="20%">${schedule.getLocalDateTime()}</td>
            <td width="1%">
                <button type="submit" class="btn btn-outline-success" value="${schedule.id}">Open</button>
            </td>
        </#list>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a class="btn btn-danger btn-lg btn-block mb-3" data-toggle="collapse" href="#registeredSchedule" role="button" aria-expanded="false"
       aria-controls="collapseExample">Open registered tickets</a>
    <div class="collapse" id="registeredSchedule">
        <div class="form-group">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Registered by</th>
                    <th scope="col">Date</th>
                    <th scope="col">Result</th>
                    <th scope="col">Control</th>
                </tr>
                </thead>
                <tbody>
        <#list tickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.user.fullName}</td>
            <td width="1%">${ticket.getSchedule().getLocalDateTime()}</td>
            <td>${ticket.getResult()!}</td>
            <td width="1%">
                <button type="submit" class="btn btn-outline-danger" value="${ticket.id}">Open</button>
            </td>
        </#list>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a class="btn btn-dark btn-lg btn-block mb-3" data-toggle="collapse" href="#expiredTickets" role="button" aria-expanded="false"
       aria-controls="collapseExample">Open expired tickets</a>
    <div class="collapse" id="expiredTickets">
        <div class="form-group">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Registered by</th>
                    <th scope="col">Date</th>
                    <th scope="col">Control</th>
                </tr>
                </thead>
                <tbody>
        <#list expiredTickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.user.fullName}</td>
            <td width="1%">${ticket.getSchedule().getLocalDateTime()}</td>
            <td width="1%">
                <button type="submit" class="btn btn-outline-dark" value="${ticket.id}">Open</button>
            </td>
        </#list>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</@c.page>