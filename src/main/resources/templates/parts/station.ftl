<#macro station path isStationAddedForm station>
    <form action="${path}" method="post">

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Номер ПТЭ:</label>
            <div class="col-sm-6">
                <input type="number" name="stationnumber" class="form-control"
                       <#if isStationAddedForm>placeholder="Номер ПТЭ"
                       <#else>value="${station.stationnumber}"</#if>
                />
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Код ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationcode" class="form-control" <#if isStationAddedForm>placeholder="Код ПТЭ"
                       <#else>value="${station.stationcode}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Тип ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationtype" class="form-control" <#if isStationAddedForm>placeholder="Тип ПТЭ"
                       <#else>value="${station.stationtype}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Название ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationname" class="form-control"
                       <#if isStationAddedForm>placeholder="Название ПТЭ"
                       <#else>value="${station.stationname}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Адрес ПТЭ:</label>
            <div class="col-sm-6">
                <input type="text" name="stationaddress" class="form-control"
                       <#if isStationAddedForm>placeholder="Адрес ПТЭ"
                       <#else>value="${station.stationaddress}"</#if>/>
            </div>
        </div>

        <div class="form-group row offset-md-3">
            <label class="col-sm-2 col-form-label">Статус ПТЭ:</label>
            <div class="col-sm-6">
                <select name="active" class="form-control">
                    <#if isStationAddedForm>
                        <option value="none" hidden="">Выберите статус</option>
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

        <#if !isStationAddedForm>
            <input type="hidden" value="${station.id}" name="stationId">
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary offset-md-5"
                type="submit"><#if isStationAddedForm>Добавить<#else>Сохранить</#if></button>
    </form>
</#macro>
