<#import "parts/common.ftl" as c>

<@c.page 'ASUOD-Login'>
    <div class="row justify-content-center">
        <form action="/login" method="post" class="form-signin">
            <h1 class="h1 mb-5 font-weight-normal text-center text-body">Автоматизированная система<br>учета
                оборудования и
                документации</h1>

            <div class="row justify-content-center">
                <label for="inputEmail" class="sr-only">Логин</label>
                <input type="text" name="username" id="inputEmail" class="form-control mb-4 col-sm-7"
                       data-toggle="tooltip" title="Введите логин"
                       placeholder="Логин" required=""
                       autofocus="">
            </div>

            <div class="row justify-content-center">
                <label for="inputPassword" class="sr-only">Пароль</label>
                <input type="password" name="password" id="inputPassword" class="form-control mb-4 col-sm-7"
                       data-toggle="tooltip" title="Введите пароль"
                       placeholder="Пароль"
                       required="">
            </div>

            <div class="row justify-content-center">
                <button class="btn btn-lg btn-primary btn-block col-sm-3" type="submit">Войти</button>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</@c.page>