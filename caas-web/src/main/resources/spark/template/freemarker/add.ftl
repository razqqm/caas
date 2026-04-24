<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#assign description=i18n("add.meta_description") in page>
<#assign title=i18n("add.title", page.project_name) in page>
<#assign stylesheets=["/css/add.css"] in page>
<#assign scripts=["/js/add.js"] in page>
<@page.page>
 <noscript>${i18n("noscript.enable")}</noscript>
 <h2>${i18n("add.heading")}</h2>
    <form id="form_add" action="/add/" method="post">
        <div>
            <label for="jid" class="input_label_add">${i18n("add.jid")}</label>
            <input name="jid" class="input_add" id="jid" type="text"/>
        </div>
        <div>
            <label for="password" class="input_label_add">${i18n("add.password")}</label>
            <input name="password" class="input_add" id="password" type="password"/>
            <div id="password_toggle" class="show">${i18n("add.password.show")}</div>
        </div>
        <div id="input_error_msg" class="error_message"></div>
        <div id="loading_add" class="loading_status">
            <div class="loader"></div>
            <div>${i18n("add.verifying")}</div>
        </div>
        <div>
            <input type="submit" class="button" id="button_add" value="${i18n("add.submit")}"/>
            <input name="listed" id="listed" type="checkbox"/>
            <label for="listed">${i18n("add.include_in_list")}</label>
        </div>
    </form>
    <div class="note">
         <p style="color:red;">${i18n("add.note.warning")}</p>
        ${i18n("add.note.cli")?no_esc}
    </div>
    <#assign footerText="<br/>" in page>
</@page.page>
