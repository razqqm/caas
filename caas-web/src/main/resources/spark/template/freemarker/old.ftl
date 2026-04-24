<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#import "includes/table.ftl" as table>
<#assign scripts=["/js/table.js"] in page>
<#assign stylesheets=["/css/table.css"] in page>
<#assign description=i18n("meta.description") in page>
<#assign title=i18n("old.title", page.project_name) in page>
<#assign no_results_found_msg=i18n("home.no_results")>
<#assign footerText=i18n("old.footer") in page>
<@page.page>
    <@table.table>
    </@table.table>
</@page.page>
