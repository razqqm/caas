<#ftl output_format="HTML">
<#import "page.ftl" as page>
<#assign title=i18n("about.title", page.project_name) in page>
<#assign stylesheets=["/css/about.css"] in page>
<@page.page>
    <h2>
        ${i18n("about.heading")}
    </h2>
    <link rel="stylesheet" href="/css/about.css">

        <p>
            ${i18n("about.intro")?no_esc}
        </p>
    <div class="card">
         <h3>${i18n("about.why.heading")}</h3>
         <p>
             ${i18n("about.why.intro")}
         </p>

         <p class="sub_heading">${i18n("about.why.users_heading")}</p>
         <p>
             ${i18n("about.why.users")}
         </p>

         <p class="sub_heading">${i18n("about.why.admins_heading")}</p>
         <p>
             ${i18n("about.why.admins")?no_esc}
         </p>
     </div>

     <div class="card">
         <h3>${i18n("about.features.heading")}</h3>
         <ul>
             <li>${i18n("about.features.1")}</li>
             <li>${i18n("about.features.2")}</li>
             <li>${i18n("about.features.3")}</li>
             <li>${i18n("about.features.4")}</li>
             <li>${i18n("about.features.5")}</li>
         </ul>
     </div>

</@page.page>
