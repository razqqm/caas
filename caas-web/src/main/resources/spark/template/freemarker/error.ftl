<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#assign title=i18n("error.title", error_code?c, page.project_name) in page>
<@page.page>
<div class="card error">
    <h1>
        ${i18n("error.heading")} ${error_code}
    </h1>
    <h2>
        ¯\_(⊙︿⊙)_/¯
    </h2>
    <h3>${error_msg}</h3>
</div>
</@page.page>
