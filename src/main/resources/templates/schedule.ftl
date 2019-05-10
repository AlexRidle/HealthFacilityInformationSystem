<#import "parts/common.ftl" as c>
<#--<#include "parts/security.ftl">-->

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Талоны успешно были добавлены
    </div>
    </#if>
    <#if response! == "with errors">
        <div class="alert alert-warning" role="alert">
            Некоторые талоны не были добавлены. Имеются совпадения среди уже доступных талонов
        </div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Талоны</h5>
    <div class="container">
        <a class="btn btn-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#createSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Добавить новый талон</a>
        <div class="collapse <#if response??>show</#if>" id="createSchedule">
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
                            <label for="validationScheduleDates">Даты</label>
                            <input type="text" class="form-control datepicker" id="validationScheduleDates"
                                   name="scheduleDates"
                                   placeholder="yyyy-mm-dd,yyyy-mm-dd..." required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="scheduleTime">Время</label>
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
                            <label for="scheduleDoctors">Врачи</label>
                            <select class="custom-select mb-3" id="scheduleDoctors" name="scheduleDoctors">
                     <#list doctors as doctor>
                         <option value="${doctor.id}">${doctor.user.fullName} (${doctor.department})</option>
                     </#list>
                            </select>
                        </div>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary mb-3">Добавить</button>
                    </div>
                </form>
        </div>
        <a class="btn btn-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#editSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Открыть список врачей</a>
        <div class="collapse" id="editSchedule">
            <div class="form-group">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Имя</th>
                        <th scope="col">Отделение</th>
                        <th scope="col">Управление</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list doctors as doctor>
                        <tr>
                        <td width="1%">${doctor?counter}</td>
                            <td>${doctor.user.fullName}</td>
                            <td width="1%">${doctor.department}</td>
                            <td width="1%"><a class="btn btn-outline-primary" href="/schedule/${doctor.id}">Открыть</a></td>
                        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <a class="btn btn-success btn-lg btn-block mb-3" data-toggle="collapse" href="#unregisteredSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Открыть незарегистрированные талоны</a>
        <div class="collapse" id="unregisteredSchedule">
            <div class="form-group">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Врач</th>
                        <th scope="col">Дата</th>
                        <th scope="col">Управление</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list unregSchedules as unregSchedule>
                        <tr>
                        <td width="1%">${unregSchedule?counter}</td>
                            <td>${unregSchedule.doctor.user.fullName}</td>
                            <td width="10%">${unregSchedule.localDateTime}</td>
                            <td width="1%"><a class="btn btn-success" href="/schedule/delete/${unregSchedule.id}">Удалить</a></td>
                        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <a class="btn btn-danger btn-lg btn-block mb-3" data-toggle="collapse" href="#registeredSchedule" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">Открыть зарегистрированные талоны</a>
        <div class="collapse" id="registeredSchedule">
            <div class="form-group">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Отделение</th>
                        <th scope="col">Врач</th>
                        <th scope="col">Кем зарегистрирован</th>
                        <th scope="col">Дата</th>
                        <th scope="col">Управление</th>
                    </tr>
                    </thead>
                    <tbody>
        <#list tickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.department}</td>
            <td>${ticket.doctor.user.fullName}</td>
            <#if ticket.getUser()??>
            <td>${ticket.user.fullName}</td>
            <#else>
            <td>Unregistered user</td>
            </#if>
            <td width="10%">${ticket.schedule.localDateTime}</td>
            <td width="1%">
                <a class="btn btn-outline-danger" href="/ticket/edit/${ticket.id}">Изменить</a>
            </td>
        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <a class="btn btn-dark btn-lg btn-block mb-3" data-toggle="collapse" href="#expiredTickets" role="button" aria-expanded="false"
           aria-controls="collapseExample">Открыть использованные талоны</a>
        <div class="collapse" id="expiredTickets">
            <div class="form-group">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Отделение</th>
                        <th scope="col">Врач</th>
                        <th scope="col">Кем зарегистрирован</th>
                        <th scope="col">Заключение</th>
                        <th scope="col">Дата</th>
                        <th scope="col">Управление</th>
                    </tr>
                    </thead>
                    <tbody>
        <#list expiredTickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.department}</td>
            <td>${ticket.doctor.user.fullName}</td>
            <#if ticket.getUser()??>
            <td>${ticket.user.fullName}</td>
            <#else>
            <td>Неизвестный пользователь</td>
            </#if>
            <td>${ticket.result}</td>
            <td width="10%">${ticket.schedule.localDateTime}</td>
            <td width="1%">
                <a class="btn btn-outline-dark" href="/ticket/edit/${ticket.id}">Изменить</a>
            </td>
        </#list>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <#include "parts/footer.ftl">

</@c.page>