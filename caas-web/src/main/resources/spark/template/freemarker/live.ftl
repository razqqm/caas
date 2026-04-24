<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#assign title=i18n("live.title", domain, page.project_name) in page>
<#assign scripts=["/js/live.js"] in page>
<@page.page>
<script>
    var domain = "${domain}";
</script>
    <noscript>${i18n("live.noscript", domain)?no_esc}</noscript>
    <h2>${i18n("live.heading")} ${domain}</h2>
    <div id="result_error_msg"></div>
    <div id="loading_result" class="loader"></div>
</@page.page>
