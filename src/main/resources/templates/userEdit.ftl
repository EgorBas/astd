<#import "parts/common.ftl" as c>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Редактировать пользователя</h2>
    </div>

    <form action="/user" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" value="${user.username}" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Фамилия:</label>
            <div class="col-sm-6">
                <input type="text" name="lastname" value="${user.lastname}" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя:</label>
            <div class="col-sm-6">
                <input type="text" name="firstname" value="${user.firstname}" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Отчество:</label>
            <div class="col-sm-6">
                <input type="text" name="patronymic" value="${user.patronymic}" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">E-mail:</label>
            <div class="col-sm-6">
                <input type="email" name="email" value="${user.email}" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" value="${user.password}" class="form-control"/>
            </div>
        </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Права:</label>
                <div class="col-sm-6">
                    <#list roles as role>
                    <label><input class="mr-3" type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label><br>
                    </#list>
                </div>
            </div>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>