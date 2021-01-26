<#macro station path isAddedForm station stationform>

    <#if message?? && messagetype??>
        <div class="alert alert-dismissible fade show mb-4 col-md-6 offset-md-3 alert-${messagetype}" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </#if>

    <form action="${path}" method="post">
        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Номер ПТЭ:</label>
            <div class="col-sm-6">
                <input type="number" name="stationnumber" min="1"
                       class="form-control ${(stationnumberError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if station!='null'>value="${station.stationnumber}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if stationform!='null'>value="${stationform.stationnumber}"</#if>
                            <#else>
                                <#if station!='null'>value="${station.stationnumber}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите номер ПТЭ" required autofocus
                />
                <#if stationnumberError??>
                    <div class="invalid-feedback">
                        ${stationnumberError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Код ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationcode"
                       class="form-control ${(stationcodeError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if station!='null'>value="${station.stationcode}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if stationform!='null'>value="${stationform.stationcode}"</#if>
                            <#else>
                                <#if station!='null'>value="${station.stationcode}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите код ПТЭ" required
                />
                <#if stationcodeError??>
                    <div class="invalid-feedback">
                        ${stationcodeError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Тип ПТЭ:</label>
            <div class="col-sm-6">
                <select name="stationtype" class="form-control">
                    <#if isAddedForm>
                        <option value="Технологическое помещение (АТС)" selected>Технологическое помещение (АТС)
                        </option>
                        <option value="УТКШ">УТКШ</option>
                        <option value="Контейнер">Контейнер</option>
                    <#else>
                        <#if hasvaliderror??>
                            <#switch stationform.stationtype>
                                <#case 'Технологическое помещение (АТС)'>
                                    <option value="Технологическое помещение (АТС)" selected>Технологическое помещение
                                        (АТС)
                                    </option>
                                    <option value="УТКШ">УТКШ</option>
                                    <option value="Контейнер">Контейнер</option>
                                    <#break>
                                <#case 'УТКШ'>
                                    <option value="Технологическое помещение (АТС)">Технологическое помещение (АТС)
                                    </option>
                                    <option value="УТКШ" selected>УТКШ</option>
                                    <option value="Контейнер">Контейнер</option>
                                    <#break>
                                <#case 'Контейнер'>
                                    <option value="Технологическое помещение (АТС)">Технологическое помещение (АТС)
                                    </option>
                                    <option value="УТКШ">УТКШ</option>
                                    <option value="Контейнер" selected>Контейнер</option>
                                    <#break>
                            </#switch>
                        <#else>
                            <#switch station.stationtype>
                                <#case 'Технологическое помещение (АТС)'>
                                    <option value="Технологическое помещение (АТС)" selected>Технологическое помещение
                                        (АТС)
                                    </option>
                                    <option value="УТКШ">УТКШ</option>
                                    <option value="Контейнер">Контейнер</option>
                                    <#break>
                                <#case 'УТКШ'>
                                    <option value="Технологическое помещение (АТС)">Технологическое помещение (АТС)
                                    </option>
                                    <option value="УТКШ" selected>УТКШ</option>
                                    <option value="Контейнер">Контейнер</option>
                                    <#break>
                                <#case 'Контейнер'>
                                    <option value="Технологическое помещение (АТС)">Технологическое помещение (АТС)
                                    </option>
                                    <option value="УТКШ">УТКШ</option>
                                    <option value="Контейнер" selected>Контейнер</option>
                                    <#break>
                            </#switch>
                        </#if>
                    </#if>
                </select>
                <#if stationtypeError??>
                    <div class="invalid-feedback">
                        ${stationtypeError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Название ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationname"
                       class="form-control ${(stationnameError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if station!='null'>value="${station.stationname}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if stationform!='null'>value="${stationform.stationname}"</#if>
                            <#else>
                                <#if station!='null'>value="${station.stationname}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите название ПТЭ" required
                />
                <#if stationnameError??>
                    <div class="invalid-feedback">
                        ${stationnameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Адрес ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationaddress"
                       class="form-control ${(stationaddressError??)?string('is-invalid','')}"
                        <#if isAddedForm>
                            <#if station!='null'>value="${station.stationaddress}"</#if>
                        <#else>
                            <#if hasvaliderror??>
                                <#if stationform!='null'>value="${stationform.stationaddress}"</#if>
                            <#else>
                                <#if station!='null'>value="${station.stationaddress}"</#if>
                            </#if>
                        </#if>
                       placeholder="Введите адрес ПТЭ" required
                />
                <#if stationaddressError??>
                    <div class="invalid-feedback">
                        ${stationaddressError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Статус ПТЭ:</label>
            <div class="col-sm-6">
                <select name="active" class="form-control">
                    <#if isAddedForm>
                        <option value="1">Активен</option>
                        <option value="0">Демонтирован</option>
                    <#else>
                        <#if station.active==true>
                            <option value="1" selected>Активен</option>
                            <option value="0">Демонтирован</option>
                        <#else>
                            <option value="1">Активен</option>
                            <option value="0" selected>Демонтирован</option>
                        </#if>
                    </#if>
                </select>
            </div>
        </div>

        <div class="form-group row offset-md-3 mt-4">
            <a type="button" class="btn btn-primary offset-md-1 mr-5" href="/station">Назад</a>
            <button class="btn btn-success mr-5"
                    type="submit"><#if isAddedForm>Добавить<#else>Сохранить</#if></button>
            <button class="btn btn-secondary"
                    type="reset"><#if isAddedForm>Сбросить<#else>Исходные значения</#if></button>
        </div>

        <#if !isAddedForm>
            <input type="hidden" value="${station.id}" name="stationId">
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>
