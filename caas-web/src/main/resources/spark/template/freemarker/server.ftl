<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#import "includes/graph.ftl" as graph>
<#import "includes/stat.ftl" as stat>
<#import "includes/result.ftl" as result>
<#assign description=i18n("server.meta_description", domain) in page>
<#assign title=i18n("server.title", domain, page.project_name) in page>
<#assign stylesheets=["/css/server.css","/css/graph.css","/css/stat.css"] in page>
<#assign scripts=["/js/graph.js","/js/subscribe.js","/js/d3.min.js","/js/server.js"] in page>

<@page.page>

    <script>
        var data = JSON.parse('${historic_data?no_esc}');
        var domain = "${domain}";
        var timestamp = "${timestamp}";
    </script>

    <h2>${i18n("server.heading")} <a href="http://${domain}">${domain}</a></h2>

    <@stat.stat></@stat.stat>

   <button id="download_report" onclick="print_report('${softwareName!}','${softwareVersion!}')">${i18n("server.download_report")}</button>
    <br><br>

    <#if softwareName??>
        ${i18n("server.running")} ${softwareName} ${softwareVersion!}
    <#else>
        ${i18n("server.running_unknown")}
    </#if>

    <br><br>

    <@graph.graph>
    </@graph.graph>

    <@result.result>
    </@result.result>

    <div id="server_run">
        ${i18n("server.tests_last_ran")} ${timeSince}<br>
        <button onclick="location.href='/live/${domain}/'">${i18n("server.rerun")}</button>
    </div>

    <#if helps??>
    <p>
        ${i18n("server.admin_note")}
    </p>
    </#if>

    <div id="additional_server">

        <#if mailExists>
        <div class="card" id="subscribe_server">
            <h3>${i18n("server.subscribe.heading")}</h3>
            <form id="form_subscribe" action="#subscribe" method="post">
                <div>
                    <label for="email" class="input_label_subscribe">${i18n("server.subscribe.email")}</label>
                    <input id="email" name="email" class="input_subscribe" type="text"/>
                </div>
                <div id="loading_subscribe">
                    <div class="loader"></div>
                    <div>${i18n("server.subscribe.loading")} ${domain}</div>
                </div>
                <div id="input_msg"></div>
                <div>
                    <input type="submit" class="button" id="subscribe_button" value="${i18n("server.subscribe.button")}"/>
                </div>
            </form>
        </div>
        </#if>

        <div class="card" id="embed_server">
            <h3>${i18n("server.badge.heading")}</h3>
            ${badgeCode?no_esc}
            <br><br>
            <div class="code">
                ${badgeCode}
            </div>
        </div>
    </div>

    <#if helps??>
    <div id="help_container">
        <#list helps as test,help>
            <div class="card help" id="${test}">
                <a class="close" href="#${test}">&times;</a>
                <h3>${i18n("server.help.for")} <a href="/test/${test}">${tests[test].full_name()}</a>* :</h3>
                ${help?no_esc}
                <p class="footnote">
                    ${i18n("server.help.footnote")}
                </p>
            </div>
        </#list>
    </div>
    </#if>

</@page.page>
