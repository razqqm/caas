<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#import "includes/graph.ftl" as graph>
<#import "includes/stat.ftl" as stat>
<#assign description=i18n("test.meta_description", test.full_name()) in page>
<#assign scripts=["/js/graph.js","/js/d3.min.js"] in page>
<#assign stylesheets=["/css/graph.css","/css/stat.css"] in page>
<#assign title=i18n("test.title", test.full_name(), page.project_name) in page>

<@page.page>
    <script>
        var data = JSON.parse('${historic_data?no_esc}');
        $(function () {
            drawGraph(data, function gotoHistoric(data) {
                console.log(data);
                var url = window.location.protocol + "//" + location.hostname + ":" + location.port + "/historic/iteration/" + data.iteration;
                window.location = url;
            })
        });
    </script>
    <h2>${test.full_name()}</h2>

    <@stat.stat></@stat.stat>

    <p class="sub_heading">${test.description()}</p>

    <a href="${test.url()}" class="button">${i18n("test.read_spec")}</a>
    <br><br>

    <@graph.graph> </@graph.graph>

      <div id="server_results" class="results_container">
        <#list results as domain,passed>
            <div class="result chip clickable ${passed?then("passed","failed")}" onclick="location.href='/server/${domain}/'">
            ${domain}
                <#if passed>
                <div class="result_image">
                    <img src="/img/passed.svg">
                </div>
                <#else>
                <div class="result_image">
                    <img src="/img/failed.svg">
                </div>
                </#if>
        </div>
        </#list>
      </div>

</@page.page>
