<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#import "includes/table.ftl" as table>
<#assign scripts=["/js/table.js"] in page>
<#assign stylesheets=["/css/table.css"] in page>
<#assign title=i18n("historic.title", iteration.getIterationNumber()?c, page.project_name) in page>
<#assign no_results_found_msg=i18n("historic.no_results")>
<#assign footerText=i18n("historic.footer.ran", timeSince, iteration.getBegin()?string, iteration.getEnd()?string) + " &middot; <a href='#' id='colorblind'>" + i18n("historic.footer.colorblind") + "</a> &middot; <a href='#' id='reset_table'>" + i18n("historic.footer.reset") + "</a>" in page>
<@page.page>
    <@table.table>
    </@table.table>
</@page.page>
