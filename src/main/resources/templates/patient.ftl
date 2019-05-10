<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <h5 class="mt-3 mb-3 text-center featurette-heading">Прием пациента</h5>
    <#if isDoctor>
        <div class="container">
            <a class="btn btn-danger btn-lg btn-block mb-3" data-toggle="collapse" href="#registeredSchedule"
               role="button" aria-expanded="false"
               aria-controls="collapseExample">Список зарегистрированных талонов</a>
            <div class="collapse show" id="registeredSchedule">
                <div class="form-group">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Отделение</th>
                            <th scope="col">Кем зарегестрирован</th>
                            <th scope="col">Дата</th>
                            <th scope="col">Управление</th>
                        </tr>
                        </thead>
                        <tbody>
        <#list tickets as ticket>
        <tr>
            <td width="1%">${ticket?counter}</td>
            <td width="1%">${ticket.department}</td>
            <#if ticket.getUser()??>
            <td>${ticket.user.fullName}</td>
            <#else>
            <td>Неизвестный пользователь</td>
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
            <a class="btn btn-dark btn-lg btn-block mb-3" data-toggle="collapse" href="#expiredTickets" role="button"
               aria-expanded="false"
               aria-controls="collapseExample">Открыть использованные талоны</a>
            <div class="collapse" id="expiredTickets">
                <div class="form-group">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Отделение</th>
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
    <#else>
    <h4 class="mt-3 mb-3 text-center featurette-heading"><b>Данный раздел доступен только врачу</b></h4>
    </#if>
    <#include "parts/footer.ftl">

</@c.page>