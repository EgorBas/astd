<#macro user path isUserAddedForm user>
    <form action="${path}" method="post">
        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control"
                       <#if isUserAddedForm>placeholder="Логин"
                       <#else>value="${user.username}"
                        </#if>
                />
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Фамилия:</label>
            <div class="col-sm-6">
                <input type="text" name="lastname" class="form-control" <#if isUserAddedForm>placeholder="Фамилия"
                       <#else>value="${user.lastname}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Имя:</label>
            <div class="col-sm-6">
                <input type="text" name="firstname" class="form-control" <#if isUserAddedForm>placeholder="Имя"
                       <#else>value="${user.firstname}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Отчество:</label>
            <div class="col-sm-6">
                <input type="text" name="patronymic" class="form-control" <#if isUserAddedForm>placeholder="Отчество"
                       <#else>value="${user.patronymic}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">E-mail:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" <#if isUserAddedForm>placeholder="E-mail"
                       <#else>value="${user.email}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" <#if isUserAddedForm>placeholder="Пароль"
                       <#else>value="${user.password}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Права:</label>
            <div class="col-sm-6">
                <#list roles as role>
                    <label><input class="mr-3" type="checkbox"
                                <#if isUserAddedForm> name="${role}">${role}
                        <#else> name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                        </#if>
                    </label><br>
                </#list>
            </div>
        </div>

        <#if !isUserAddedForm>
            <input type="hidden" value="${user.id}" name="userId">
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary offset-md-5"
                type="submit"><#if isUserAddedForm>Добавить<#else>Сохранить</#if></button>
    </form>
</#macro>
