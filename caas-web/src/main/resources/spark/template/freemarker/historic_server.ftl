<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#import "includes/result.ftl" as result>
<#assign title=i18n("historic_server.title", iteration.getIterationNumber()?c, domain, page.project_name) in page>
<@page.page>
    <h2>${i18n("historic_server.heading", iteration.getIterationNumber()?c, domain)}</h2>
    <h3>${i18n("historic_server.ran", timeSince, iteration.getBegin()?string, iteration.getEnd()?string)}</h3>
    <@result.result>
    </@result.result>
    <a href="/historic/iteration/${iteration.getIterationNumber()}/">
        <button>
            ${i18n("historic_server.see_full", iteration.getIterationNumber()?c)}
        </button>
    </a>
</@page.page>
