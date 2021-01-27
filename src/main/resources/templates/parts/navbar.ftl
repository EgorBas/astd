<#include "security.ftl">
<#import "user.ftl" as u>

<nav class="navbar navbar-expand-sm fixed-top navbar-light" style="background-color: #e3f2fd">
    <span class="brand mb-1 mt-1 mr-5 text-body">АСУОД</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto ">
            <li class="nav-item">
                <a class="nav-link text-body" href="/">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-body" href="/">Справочники</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-body" href="/test">Тест</a>
            </li>
            <#if isServiceManager || isAdmin>
                <li class="nav-item">
                    <a class="nav-link text-body" href="/station">ПТЭ</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link text-body" href="/user">Пользователи</a>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">
            <#if name=="unknown">
                <span class="h6 text-body">Гость</span>
            <#else><span class="h6 text-body">${lastname} ${firstname}</span>
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
