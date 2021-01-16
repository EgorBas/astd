<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Логин" />
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row offset-md-3">
                <label class="col-sm-2 col-form-label">Фамилия:</label>
                <div class="col-sm-6">
                    <input type="text" name="lastname" class="form-control" placeholder="Фамилия" />
                </div>
            </div>

            <div class="form-group row offset-md-3">
                <label class="col-sm-2 col-form-label">Имя:</label>
                <div class="col-sm-6">
                    <input type="text" name="firstname" class="form-control" placeholder="Имя" />
                </div>
            </div>

            <div class="form-group row offset-md-3">
                <label class="col-sm-2 col-form-label">Отчество:</label>
                <div class="col-sm-6">
                    <input type="text" name="patronymic" class="form-control" placeholder="Отчество" />
                </div>
            </div>

            <div class="form-group row offset-md-3">
                <label class="col-sm-2 col-form-label">E-mail:</label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="E-mail" />
                </div>
            </div>
        </#if>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль" />
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row offset-md-3">
                <label class="col-sm-2 col-form-label">Права:</label>
                <div class="col-sm-6">
                    <#list roles as role>
                        <label><input class="mr-3" type="checkbox" name="${role}" >${role}</label><br>
                    </#list>
                </div>
            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary offset-md-5" type="submit"><#if isRegisterForm>Создать<#else>Войти</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Выход</button>
    </form>
</#macro>
