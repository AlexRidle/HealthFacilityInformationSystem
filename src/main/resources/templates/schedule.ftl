<#import "parts/common.ftl" as c>
<#--<#include "parts/security.ftl">-->

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Successfully added new schedule!
    </div>
    </#if>
    <#if response! == "with errors">
        <div class="alert alert-warning" role="alert">
            Some of schedules is already exits, registered unique schedules.
        </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading"><b>Schedule</b></h5>
    <div class="container">
        <a class="btn btn-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#createSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Create new schedule</a>
        <div class="collapse" id="createSchedule">
                <form method="post" enctype="multipart/form-data" action="/schedule">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <div class="form-row">
                        <script>
                            $(function () {
                                $('.datepicker').datepicker({
                                    format: "yyyy-mm-dd",
                                    weekStart: 1,
                                    multidate: true,
                                    multidateSeparator: ", ",
                                    todayBtn: true,
                                    daysOfWeekHighlighted: "6,0",
                                    todayHighlight: true
                                });
                            });
                        </script>
                        <div class="col-md-12 mb-3">
                            <label for="validationScheduleDates">Dates</label>
                            <input type="text" class="form-control datepicker" id="validationScheduleDates"
                                   name="scheduleDates"
                                   placeholder="yyyy-mm-dd,yyyy-mm-dd..." required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="scheduleTime">Time</label>
                            <select class="custom-select" id="scheduleTime" name="scheduleTime">
                                <option value="08:00:00">8:00</option>
                                <option value="08:30:00">8:30</option>
                                <option value="09:00:00">9:00</option>
                                <option value="09:30:00">9:30</option>
                                <option value="10:00:00">10:00</option>
                                <option value="10:30:00">10:30</option>
                                <option value="11:00:00">11:00</option>
                                <option value="11:30:00">11:30</option>
                                <option value="12:00:00">12:00</option>
                                <option value="12:30:00">12:30</option>
                                <option value="13:00:00">13:00</option>
                                <option value="13:30:00">13:30</option>
                                <option value="14:00:00">14:00</option>
                                <option value="14:30:00">14:30</option>
                                <option value="15:00:00">15:00</option>
                                <option value="15:30:00">15:30</option>
                                <option value="16:00:00">16:00</option>
                                <option value="16:30:00">16:30</option>
                                <option value="16:30:00">17:00</option>
                                <option value="16:30:00">17:30</option>
                                <option value="16:30:00">18:00</option>
                                <option value="16:30:00">18:30</option>
                                <option value="16:30:00">19:00</option>
                                <option value="16:30:00">19:30</option>
                                <option value="16:30:00">20:00</option>
                                <option value="16:30:00">20:30</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="scheduleDoctors">Doctors</label>
                            <select class="custom-select mb-3" id="scheduleDoctors" name="scheduleDoctors">
                     <#list doctors as doctor>
                         <option value="${doctor.id}">${doctor.user.fullName} (${doctor.department})</option>
                     </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add schedule</button>
                    </div>
                </form>
        </div>
        <a class="btn btn-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#editSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Open doctors schedule</a>
        <div class="collapse" id="editSchedule">
            <div class="form-group">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Full name</th>
                        <th scope="col">Department</th>
                        <th scope="col">Control</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list doctors as doctor>
                        <tr>
                        <td width="1%">${doctor?counter}</td>
                            <td>${doctor.user.fullName}</td>
                            <td width="1%">${doctor.department}</td>
                            <td width="1%"><a class="btn btn-outline-primary" href="/schedule/${doctor.id}">Edit
                                schedule</a></td>
                        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
                        <#list unregSchedules as unregSchedule>
                        <tr>
                        <td width="1%">${unregSchedule?counter}</td>
                            <td>${unregSchedule.doctor.user.fullName}</td>
                            <td width="20%">${unregSchedule.getLocalDateTime()}</td>
                            <td width="1%"><button type="submit" class="btn btn-outline-success" value="${unregSchedule.id}">Open</button></td>
                        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <a class="btn btn-danger btn-lg btn-block mb-3" data-toggle="collapse" href="#registeredSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Open registered schedules</a>
        <div class="collapse" id="registeredSchedule">
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
                        <#list regSchedules as regSchedule>
                        <tr>
                        <td width="1%">${regSchedule?counter}</td>
                            <td>${regSchedule.doctor.user.fullName}</td>
                            <td width="20%">${regSchedule.getLocalDateTime()}</td>
                            <td width="1%"><button type="submit" class="btn btn-outline-danger" value="${regSchedule.id}">Open</button></td>
                        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</@c.page>