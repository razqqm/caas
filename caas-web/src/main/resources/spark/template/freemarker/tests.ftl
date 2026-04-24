<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#assign description=i18n("tests.meta_description") in page>
<#assign title=i18n("tests.title", page.project_name) in page>
<#assign stylesheets=["/css/tests.css"] in page>
<@page.page>
    <h2>${i18n("tests.heading.compliance")}</h2>
    <div class="tests_container">
    <#list tests as test>
        <div class="test card">
            <h2 style="display: inline;">${test.full_name()}</h2>
            <p>${test.description()}</p>
            <a href="/test/${test.short_name()}">
                <button class="floating_button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" height="40" width="40">
                        <g id="layer1">
                            <rect class="info_component" ry="1.0" y="7" x="7.1" height="6" width="1.8"/>
                            <ellipse class="info_component" ry="1" rx="1" cy="4.5" cx="8"/>
                        </g>
                    </svg>
                </button>
            </a>
        </div>
    </#list>

    </div>
    <h2>${i18n("tests.heading.informational")}</h2>
    <div class="tests_container">
     <#list informationalTests as test>
        <div class="test card">
            <h2 style="display: inline;">${test.full_name()}</h2>
            <p>${test.description()}</p>
            <a href="/test/${test.short_name()}">
                <button class="floating_button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" height="40" width="40">
                        <g id="layer1">
                            <rect class="info_component" ry="1.0" y="7" x="7.1" height="6" width="1.8"/>
                            <ellipse class="info_component" ry="1" rx="1" cy="4.5" cx="8"/>
                        </g>
                    </svg>
                </button>
            </a>
        </div>
     </#list>
    </div>
</@page.page>
