<#macro user path isAddedForm user userform>

    <#if message?? && messagetype??>
        <div class="alert alert-dismissible fade show mb-4 col-md-6 offset-md-3 alert-${messagetype}" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </#if>

    <form action="${path}" method="post" id="userform">
        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username"
                       class="form-control ${(usernameError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if user!='null'>value="${user.username}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if userform!='null'>value="${userform.username}"</#if>
                            <#else>
                                <#if user!='null'>value="${user.username}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите логин" required autofocus
                />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Фамилия:</label>
            <div class="col-sm-6">
                <input type="text" name="lastname"
                       class="form-control ${(lastnameError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if user!='null'>value="${user.lastname}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if userform!='null'>value="${userform.lastname}"</#if>
                            <#else>
                                <#if user!='null'>value="${user.lastname}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите фамилию" required
                />
                <#if lastnameError??>
                    <div class="invalid-feedback">
                        ${lastnameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Имя:</label>
            <div class="col-sm-6">
                <input type="text" name="firstname"
                       class="form-control ${(firstnameError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if user!='null'>value="${user.firstname}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if userform!='null'>value="${userform.firstname}"</#if>
                            <#else>
                                <#if user!='null'>value="${user.firstname}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите имя" required
                />
                <#if firstnameError??>
                    <div class="invalid-feedback">
                        ${firstnameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Отчество:</label>
            <div class="col-sm-6">
                <input type="text" name="patronymic"
                       class="form-control ${(patronymicError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if user!='null'>value="${user.patronymic}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if userform!='null'>value="${userform.patronymic}"</#if>
                            <#else>
                                <#if user!='null'>value="${user.patronymic}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите отчество" required
                />
                <#if patronymicError??>
                    <div class="invalid-feedback">
                        ${patronymicError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">E-mail:</label>
            <div class="col-sm-6">
                <input type="email" name="email"
                       class="form-control ${(emailError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if user!='null'>value="${user.email}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if userform!='null'>value="${userform.email}"</#if>
                            <#else>
                                <#if user!='null'>value="${user.email}"</#if>
                            </#if>
                        </#if>
                       placeholder="some@some.com" required
                />
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <#if !isAddedForm>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#password"
                            aria-expanded="false" aria-controls="password">
                        Изменить пароль
                    </button>
                    <div class="collapse mt-3 ${(passwordError??)?string('show','')}" id="password">
                        <input type="password" name="password"
                               class="form-control ${(passwordError??)?string('is-invalid','')}"
                                <#if hasvaliderror??>
                                    <#if userform!='null'>value="${userform.password}"</#if>
                                <#else>
                                    <#if user!='null'>value="${user.password}"</#if>
                                </#if>
                               placeholder="Введите новый пароль"
                        />
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                <#else>
                    <input type="password" name="password"
                           class="form-control ${(passwordError??)?string('is-invalid','')}"
                           placeholder="Введите новый пароль" required
                    />
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Статус пользователя:</label>
            <div class="col-sm-6 d-flex align-items-center">
                <select name="active" class="form-control">
                    <#if isAddedForm>
                        <option value="1">Активен</option>
                        <option value="0">Заблокирован</option>
                    <#else>
                        <#if user.active==true>
                            <option value="1" selected>Активен</option>
                            <option value="0">Заблокирован</option>
                        <#else>
                            <option value="1">Активен</option>
                            <option value="0" selected>Заблокирован</option>
                        </#if>
                    </#if>
                </select>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Права:</label>
            <div class="col-sm-6">
                <#list roles as role>
                    <label><input class="mr-3" type="checkbox"
                                <#if isAddedForm> name="${role}">${role}
                        <#else>name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                        </#if>
                    </label><br>
                </#list>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <a type="button" class="btn btn-primary mr-5 offset-md-1" href="/user">Назад</a>
            <button class="btn btn-success mr-5" form="userform"
                    type="submit"><#if isAddedForm>Добавить<#else>Сохранить</#if></button>
            <button class="btn btn-secondary"
                    type="reset"><#if isAddedForm>Сбросить<#else>Исходные значения</#if></button>
        </div>

        <#if !isAddedForm>
            <input type="hidden" value="${user.id}" name="userId">
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>
