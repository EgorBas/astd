<#include "security.ftl">
<#import "user.ftl" as u>

<nav class="navbar navbar-expand-sm navbar-light bg-secondary">
    <span class="navbar-brand mb-1 mt-1 h1">АСУОД</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Пользователи</a>
            </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/test">test</a>
            </li>
        </ul>

        <div class="navbar-text mr-3">
            <#if name=="unknown">
                Гость
                <#else>${name}
            </#if>
        </div>
        <#if name=="unknown">
            <a class="btn btn-primary" href="/login">Войти</a>
        <#else>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Выход</button>
            </form>
        </#if>
    </div>
</nav>
