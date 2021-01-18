<#import "parts/common.ftl" as c>

<@c.page>
    <div class="mb-3 text-center">
        <h2>Список пользователей</h2>
    </div>

    <table class="table table-hover table table-bordered">
        <thead class="thead-light text-center">
        <tr>
            <th>Логин</th>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Отчество</th>
            <th>E-mail</th>
            <th>Статус</th>
            <th>Права</th>
            <th>Действия</th>
        </tr>
        </thead>
        <tbody class="text-center align-middle">
        <#list users as user>
            <tr>
                <td class="align-middle">${user.username}</td>
                <td class="align-middle">${user.lastname}</td>
                <td class="align-middle">${user.firstname}</td>
                <td class="align-middle">${user.patronymic}</td>
                <td class="align-middle">${user.email}</td>
                <td class="align-middle">
                    <#if user.active==true>Активен
                    <#else>Заблокирован
                    </#if>
                </td>
                <td class="align-middle"><#list user.roles as role>${role}<#sep><br> </#list></td>
                <td class="align-middle">
                    <a href="/user/${user.id}" title="Изменить"><i class="far fa-edit"></i></a><br>
                    <a href="/user/del/${user.id}" title="Удалить"><i class="far fa-trash-alt"></i></a><br>
                </td>
            </tr>
        </#list>

    </tbody>
</table>

<a class="btn btn-primary" href="/userAdd">Добавить</a>

</@c.page>