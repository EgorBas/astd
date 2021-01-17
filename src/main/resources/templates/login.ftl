<#import "parts/common.ftl" as c>

<@c.page>
    <div class="row justify-content-center">
        <form action="/login" method="post" class="form-signin">
            <h1 class="h3 mb-3 font-weight-normal text-center">Авторизация</h1>
            <label for="inputEmail" class="sr-only">Логин</label>
            <input type="text" name="username" id="inputEmail" class="form-control mb-4" placeholder="Логин" required=""
                   autofocus="">
            <label for="inputPassword" class="sr-only">Пароль</label>
            <input type="password" name="password" id="inputPassword" class="form-control mb-4" placeholder="Пароль"
                   required="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</@c.page>