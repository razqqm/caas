<#ftl output_format="HTML">
<#macro table>
<div id="cover_table_hack"></div>
<div id="div_header"></div>
<div id="div_first_col">
<#list resultsByServer as domain,results>
    <div class="server_name">
        <a href="/server/${domain}">
            ${domain}
        </a>
    </div>
</#list>
</div>
<div id="results_table" class="fixed-table-container">
    <#if resultsByServer?has_content>
        <table>
            <thead>
            <tr>
                <th>${i18n("table.header.server")}</th>
                <th>${i18n("table.header.compliance")}</th>
        <#list tests as test>
                <th>
                    <a href="/test/${test.short_name()}">
                        ${test.full_name()}
                    </a>
                </th>
        </#list>
            </tr>
            </thead>
            <tbody>
        <#list resultsByServer as domain,results>
        <tr server="${domain}">
            <td>
                <a href="/server/${domain}">
                    ${domain}
                </a>
            </td>
            <td class="text">
                ${percentByServer[domain]}
            </td>
            <#list tests as test>
                <#if results[test.short_name()]??>
            <td class="${results[test.short_name()]?then("passed" ,"failed")}">
            </td>
                <#else>
            <td class="not_found">
            </td>
                </#if>
            </#list>
        </tr>
        </#list>
            </tbody>
        </table>
    <#else>
    <h2>
        ¯\_(⊙︿⊙)_/¯
    </h2>
    <h3>
        <#if no_results_found_msg??>${no_results_found_msg?no_esc}<#else>${i18n("table.no_results_fallback")}</#if>
    </h3>
    </#if>
</div>
</#macro>
