<#import "parts/common.ftl" as c>

<@c.page>
<h5 class="mt-3 mb-3 text-center featurette-heading">Tickets:</h5>
<div class="mb-3 ml-3 mr-3">
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!}"
                       placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new ticket
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="doctor" placeholder="Doctor"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="time" placeholder="Time">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="ward" placeholder="Ward">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
    <#list tickets as ticket>
        <div class="card my-3">
            <div class="m-2">
                <span>Your doctor: ${ticket.doctor}</span>
                <i>Date: ${ticket.time}</i>
            </div>
            <div class="m-2">
                <i>Ward: ${ticket.ward}</i>
            </div>
            <div class="card-footer text-muted">
                ${ticket.patientName}
            </div>
        </div>
    <#else>
    No message
    </#list>
    </div>
</div>
</@c.page>