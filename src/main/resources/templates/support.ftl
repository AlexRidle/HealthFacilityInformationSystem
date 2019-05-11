<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
    <#if response! == "error">
<div class="alert alert-danger" role="alert">
    При обработке вашего отзыва возникла ошибка. Повторите запрос еще раз
</div>
    </#if>
    <#if response! == "success">
<div class="alert alert-success" role="alert">
    Ваш отзыв был успешно оставлен и будет рассмотрен в ближайшее время!
</div>
    </#if>
    <#if response! == "captcha">
<div class="alert alert-warning" role="alert">
    Для подтверждения отправки вашего отзыва необходимо заполнить капчу.
</div>
    </#if>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Оставьте свой отзыв:</h5>
    <div class="container">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <div class="container mt-5">
                    <textarea class="form-control ${(textError??)?string('is-invalid','')}" id="textArea" rows="3"
                              name="text" placeholder="Ваш отзыв (не короче 20 символов)" required><#if feedback??>${feedback.text}</#if></textarea>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group captcha-center mb-3">
                <div>
                    <div class="g-recaptcha" data-sitekey="6LdFkKIUAAAAAJuS7l3QY5g7_-m8S-x6YIA5BIly"></div>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-outline-success">Добавить отзыв</button>
            </div>
        </form>
    </div>
    <#include "parts/footer.ftl">
</@c.page>
