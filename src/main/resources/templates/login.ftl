<#import "parts/common.ftl" as c>
    <@c.page>
    ${message!}
<link rel="stylesheet" href="/static/css/signin.css">
<form class="form-signin text-center" action="/login" method="post">
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="username" class="sr-only">Username</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <div class="col-form-label mt-2">
        <a href="/registration">Not registered?</a>
    </div>
    <p class="mt-5 mb-3 text-muted">&copy; 2019 Company, Inc.</p>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
</form>
</@c.page>