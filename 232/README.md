# LLMs


## "Presets"

SOLID, CLARITY (see `TODO:ref`), DDD, GoF...


## Requests 

```
We have to create an automated way to add new services to our system without much friction.

Generally, we have two groups of permissions: front and backend and they will be either public clients or not-public.

---

Currently, we are trying to implement the main frontend endpoint, our `dashboard` (root application), where we will bridge the access and   discovery to multiple applications (from the user perspective). It's the `sisf-web` application.


---

Make a plan to:

- First make keycloak configurable for both application-groups (types) through terraform.
- Configure `sisf-web` (permissions callback etc for auth/authentication in the keycloak layer) through terraform.
```

## App-to-keycloak setup 

``` 
Once we login through keycloak, we must hit `auth-service.funerariafrancana.com.br` on the `/me` endpoint to gather user data.

Then, in case user-login happened (user info is not `nil`/`null`), then we should bypass application's login page.

We are not using keycloak client approach anymore. This is done at the border (Envoy API Gateway + keycloak). If you can land on the application, cookies will  be set on the browser, and upon hitting `/me` application will have user data and also access to everything it needs.
``` 

## Explaining things

### Flows

```
What happens is, after keycloak login, we have cookies in the browser. Calling auth automatically put these cookies in the request. Auth
 recognizes it, and spew out data about the user for us
```

## mcp

```
Document data modeling, connections etc. We have a `mcp-ff` I just cloned here. We can use it to connect to the firebird sql database, make queries etc. So
  you can document technology-agnostically how we should model our data to stablish a correspondence with the legacy system
```


## Asking questions

```
Why isn't sisf-web argocd setup not picking the sisf-web docker image on gitflow push?
```


```
[BffAuth] Request failed with status 0 (likely CORS/network error), redirecting to root index-B7206K9s.js:1:35893
[Auth] checkAuth result: loading index-B7206K9s.js:1:39742
[Auth] Redirect in progress, waiting for OIDC flow index-B7206K9s.js:1:40167
[Interop] Creating TemplateService with config:
Object { baseUrl: "http://localhost:8080", authMode: "BFF (cookies)" }
index-B7206K9s.js:1:41025
[Interop] Creating PreviewService with config:
Object { baseUrl: "http://localhost:8080", authMode: "BFF (cookies)" }
index-B7206K9s.js:1:41285
[Interop] Creating FileDownloadService with config:
Object { baseUrl: "http://localhost:8080", authMode: "BFF (cookies)" }
index-B7206K9s.js:1:41574
📦 Sending flags to Elm: index-B7206K9s.js:1:42581
  - serviceBaseUrl: http://localhost:8080 index-B7206K9s.js:1:42621
  - user: null index-B7206K9s.js:1:42658
  - devMode: false index-B7206K9s.js:1:42751
  - environment: dev index-B7206K9s.js:1:42781
Expected media feature name but found ‘-ms-high-contrast’. cartas-staging.funerariafrancana.com.br:1:20
Expected media feature name but found ‘-ms-high-contrast’. cartas-staging.funerariafrancana.com.br:1:49
Unknown pseudo-class or pseudo-element ‘-ms-track’.  Ruleset ignored due to bad selector. cartas-staging.funerariafrancana.com.br:27:19
Unknown pseudo-class or pseudo-element ‘-ms-thumb’.  Ruleset ignored due to bad selector. cartas-staging.funerariafrancana.com.br:53:19
Error in parsing value for ‘writing-mode’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:62:19
Error in parsing value for ‘-webkit-appearance’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:63:25
Error in parsing value for ‘display’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:80:6745
Unknown property ‘text-decoration-skip’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:81:1824
Unknown property ‘text-decoration-skip’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:81:1927
Error in parsing value for ‘text-align’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:81:2002
Error in parsing value for ‘font-feature-settings’.  Declaration dropped. cartas-staging.funerariafrancana.com.br:3:26
GET
https://cartas-staging.funerariafrancana.com.br/
[HTTP/3 302  111ms]

GET
https://cartas-staging.funerariafrancana.com.br/logo.png
[HTTP/3 200  0ms]

GET
https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/webfonts/fa-solid-900.woff2
[HTTP/3 200  0ms]

GET
https://keycloak-staging.funerariafrancana.com.br/realms/funeraria-staging/protocol/openid-connect/auth?client_id=cartas-frontend-staging&code_challenge=E34IIIr_KpocSDCfPz5VE12947IBk-Y_Yh4pnMu2FfU&code_challenge_method=S256&redirect_uri=https://cartas-staging.funerariafrancana.com.br/callback&response_type=code&scope=openid profile email&state=eyJ1cmwiOiJodHRwczovL2NhcnRhcy1zdGFnaW5nLmZ1bmVyYXJpYWZyYW5jYW5hLmNvbS5ici8iLCJjc3JmX3Rva2VuIjoiZWRkODY3NTBiZTJmMjAwYi5jMXRYMjYvRVFWMEVFUVZzd0Z0dnVjbGhFU3Rwb25xRVl4eUY2V1hsYXR3PSJ9
[HTTP/3 302  150ms]

downloadable font: Glyph bbox was incorrect (glyph ids 1 2 3 4 5 8 9 10 11 12 13 14 16 17 19 22 24 28 32 34 35 38 39 40 43 44 45 46 47 50 51 52 53 55 56 58 60 61 62 64 67 68 70 71 72 73 74 78 79 80 81 83 90 96 101 103 104 105 108 109 115 116 117 118 120 123 125 135 138 139 140 142 143 144 145 146 148 149 154 155 157 161 162 163 164 165 169 170 171 173 179 181 193 195 203 207 208 210 211 214 218 219 223 225 227 228 229 230 235 236 237 238 239 240 245 246 247 248 249 250 251 252 253 254 255 256 257 263 264 266 268 271 275 278 279 280 281 282 283 284 285 286 287 288 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 321 335 338 339 340 342 344 345 346 353 354 356 357 358 359 362 363 365 366 371 373 374 379 381 382 383 386 389 390 391 393 394 406 407 412 413 418 419 420 424 432 433 439 448 449 450 451 454 455 456 457 472 479 480 481 482 485 486 490 491 493 499 500 501 503 508 509 513 515 516 525 527 528 532 535 541 542 543 549 550 551 552 554 555 556 558 560 569 571 593 602 603 604 607 608 609 614 615 617 618 623 626 627 643 644 645 647 650 651 654 655 656 657 662 663 664 665 670 671 672 674 675 679 680 681 682 683 698 699 708 712 714 717 718 729 730 732 735 736 739 746 747 752 761 762 767 774 776 777 778 779 788 789 790 794 796 798 799 800 801 803 804 806 826 828 829 831 835 836 838 839 840 841 842 843 844 845 848 849 856 857 861 862 863 871 873 874 880 882 892 895 900 908 911 913 925 928 929 930 933 936 937 938 941 942 943 944 945 948 949 950 952 958 960 961 962 964 966 967 969 973 974 978 979 980 981 982 989 998 1000 1001 1005 1006 1008 1009 1011 1012 1013 1016 1020 1026 1027 1031 1036 1037 1042 1045 1048 1050 1052 1053 1057 1058 1060 1063 1072 1073 1076 1084 1087 1099 1104 1110 1111 1112 1116 1117 1121 1122 1124 1131 1136 1140 1141 1142 1147 1148 1151 1157 1163 1167 1168 1170 1177 1186 1187 1193 1196 1199 1200 1201 1204 1205 1208 1211 1212 1217 1218 1220 1224 1226 1228 1230 1231 1232 1233 1235 1236 1237 1238 1243 1246 1247 1249 1251 1256 1258 1259 1260 1261 1265 1268 1269 1271 1272 1273 1275 1276 1279 1285 1289 1290 1291 1292 1296 1297 1303 1304 1305 1309 1310 1311 1312 1317 1319 1320 1324 1325 1328 1329 1330 1331 1334 1335 1337 1339 1341 1343 1356 1357 1363 1369 1371 1372 1375 1376 1377 1382 1384 1387) (font-family: "Font Awesome 6 Free" style:normal weight:900 stretch:100 src index:0) source: https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/webfonts/fa-solid-900.woff2
GET
https://cartas-staging.funerariafrancana.com.br/callback?state=eyJ1cmwiOiJodHRwczovL2NhcnRhcy1zdGFnaW5nLmZ1bmVyYXJpYWZyYW5jYW5hLmNvbS5ici8iLCJjc3JmX3Rva2VuIjoiZWRkODY3NTBiZTJmMjAwYi5jMXRYMjYvRVFWMEVFUVZzd0Z0dnVjbGhFU3Rwb25xRVl4eUY2V1hsYXR3PSJ9&session_state=7dc663c2-5512-99d1-0b22-cfcac11fce4e&iss=https://keycloak-staging.funerariafrancana.com.br/realms/funeraria-staging&code=f2a8149c-43a5-81e4-5e79-688783679739.7dc663c2-5512-99d1-0b22-cfcac11fce4e.a5733d76-fa55-41f7-b7c3-d5155e64416e
[HTTP/3 302  137ms]

GET
https://cartas-staging.funerariafrancana.com.br/
[HTTP/3 200  79ms]

GET
https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css
[HTTP/2 200 OK 0ms]

GET
https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css
[HTTP/3 200 OK 0ms]

GET
https://cartas-staging.funerariafrancana.com.br/datepicker-fix.css
[HTTP/3 200 OK 0ms]

GET
https://cartas-staging.funerariafrancana.com.br/template-selection.css
[HTTP/3 200 OK 0ms]

GET
https://cartas-staging.funerariafrancana.com.br/assets/index-B7206K9s.js
[HTTP/3 200  0ms]

GET
https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015
[HTTP/2 200  0ms]

POST
https://cartas-staging.funerariafrancana.com.br/cdn-cgi/rum?
[HTTP/3 204  62ms]

GET
https://cartas-staging.funerariafrancana.com.br/config/favicon.ico
[HTTP/3 404  62ms]

env
Object {  }
index-B7206K9s.js:1:38319
Dev mode: false index-B7206K9s.js:1:38353
GET
https://cartas-staging.funerariafrancana.com.br/cdn-cgi/challenge-platform/scripts/jsd/main.js
[HTTP/3 302  68ms]

XHRPOST
https://cartas-staging.funerariafrancana.com.br/cdn-cgi/rum?
[HTTP/3 204  53ms]

XHRGET
https://cartas-staging.funerariafrancana.com.br/config/app-config.json
[HTTP/3 200  103ms]

[Auth] Config check:
Object { devMode: false, authServiceUrl: "https://auth-service-staging.funerariafrancana.com.br" }
index-B7206K9s.js:1:39229
[Auth] BFF pattern: Checking auth status at https://auth-service-staging.funerariafrancana.com.br index-B7206K9s.js:1:39635
[BffAuth] Checking auth status at: https://auth-service-staging.funerariafrancana.com.br/user/me index-B7206K9s.js:1:34863
GET
https://cartas-staging.funerariafrancana.com.br/config/favicon.ico
[HTTP/3 404  0ms]

[BffAuth] Current origin for redirects: https://cartas-staging.funerariafrancana.com.br index-B7206K9s.js:1:34915
GET
https://cartas-staging.funerariafrancana.com.br/cdn-cgi/challenge-platform/h/g/scripts/jsd/5eaf848a0845/main.js?
[HTTP/3 200  67ms]

XHRGET
https://auth-service-staging.funerariafrancana.com.br/user/me

Object { xkKZ4: "g" }
main.js:1:7475
XHRPOST
https://cartas-staging.funerariafrancana.com.br/cdn-cgi/challenge-platform/h/g/jsd/oneshot/5eaf848a0845/0.28823769061051757:1765542875:HweikrbNu0mCdV1CFt-kFaq3EJHj0W_D_IscOQfsnu4/9acd5c65da8e5221
[HTTP/3 200  96ms]

The resource at “https://cartas-staging.funerariafrancana.com.br/config/favicon.ico” preloaded with link preload was not used within a few seconds. Make sure all attributes of the preload tag are set correctly. cartas-staging.funerariafrancana.com.br

```


```
I have two frontend applications, one in staging `cartas-staging.funerariafrancana.com.br` and one in prod `sisf-web.funerariafrancana.com.br`.

The log messages I have are:

```
index-B7206K9s.js:1 env {}
index-B7206K9s.js:1 Dev mode: false
(index):10  GET https://cartas-staging.funerariafrancana.com.br/config/favicon.ico 404 (Not Found)
VM359 main.js:1 {xkKZ4: 'g'}
/#/sign-in:1 The resource https://cartas-staging.funerariafrancana.com.br/config/favicon.ico was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is       preloaded intentionally.
/#/sign-in:1 The resource https://cartas-staging.funerariafrancana.com.br/config/favicon.ico was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is       preloaded intentionally.
index-B7206K9s.js:1 [Auth] Config check: {devMode: false, authServiceUrl: '/api/auth'}
index-B7206K9s.js:1 [Auth] BFF pattern: Checking auth status at /api/auth
index-B7206K9s.js:1 [BffAuth] Checking auth status at: /api/auth/user/me
index-B7206K9s.js:1 [BffAuth] Current origin for redirects: https://cartas-staging.funerariafrancana.com.br
/#/sign-in:1 The resource https://cartas-staging.funerariafrancana.com.br/config/favicon.ico was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is       preloaded intentionally.
index-B7206K9s.js:1  GET https://cartas-staging.funerariafrancana.com.br/api/auth/user/me 503 (Service Unavailable)
index-B7206K9s.js:1 [BffAuth] Response status: 503
index-B7206K9s.js:1 [BffAuth] Auth request failed with status: 503
index-B7206K9s.js:1 [Auth] checkAuth result: error
index-B7206K9s.js:1 [Auth] BFF auth check failed: Auth request failed with status 503
index-B7206K9s.js:1 [Interop] Creating TemplateService with config: {baseUrl: 'https://api-staging.funerariafrancana.com.br', authMode: 'BFF (cookies)'}
index-B7206K9s.js:1 [Interop] Creating PreviewService with config: {baseUrl: 'https://api-staging.funerariafrancana.com.br', authMode: 'BFF (cookies)'}authMode: "BFF (cookies)"baseUrl: "https://api-staging.funerariafrancana.com.br"[[Prototype]]: Object
index-B7206K9s.js:1 [Interop] Creating FileDownloadService with config: {baseUrl: 'https://api-staging.funerariafrancana.com.br', authMode: 'BFF (cookies)'}
index-B7206K9s.js:1 📦 Sending flags to Elm:
index-B7206K9s.js:1   - serviceBaseUrl: https://api-staging.funerariafrancana.com.br
index-B7206K9s.js:1   - user: null
index-B7206K9s.js:1   - devMode: false
index-B7206K9s.js:1   - environment: staging
index-B7206K9s.js:1 [Deprecation] The keyword 'slider-vertical' specified to an 'appearance' property is not standardized. It will be removed in the future. Use <input type=range style="writing-mode: vertical-lr; direction: rtl"> instead.
/#/sign-in:1 [Deprecation] The keyword 'slider-vertical' specified to an 'appearance' property is not standardized. It will be removed in the future. Use <input type=range style="writing-mode: vertical-lr; direction: rtl"> instead.
/#/sign-in:1 [DOM] Input elements should have autocomplete attributes (suggested: "current-password"): (More info: https://goo.gl/9p2vKq) <input class=<200b>"input" type=<200b>"password" placeholder=<200b>"Digite sua senha"><200b>flex
/#/sign-in:1 The resource https://cartas-staging.funerariafrancana.com.br/config/favicon.ico was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is       preloaded intentionally.

```

AND:

```
main.js:1090 2025-12-12T14:27:07.912Z INFO [funeraria.logger:8] - Initializing Logger...
main.js:1090 2025-12-12T14:27:07.915Z INFO [funeraria.auth.keycloak:32] - [Auth] Initializing auth via Gateway (BFF)...
main.js:1090 2025-12-12T14:27:07.984Z INFO [funeraria.config:30] - [Config] Runtime config loaded
main.js:1090 2025-12-12T14:27:07.987Z INFO [funeraria.config:101] - Loaded config: {:keycloak-url "https://keycloak.funerariafrancana.com.br", :keycloak-realm "funeraria", :keycloak-client-id "frontend-web", :api-url "https://auth-service.                 funerariafrancana.com.br", :inventory-url "https://inventory.funerariafrancana.com.br"}
main.js:1090 2025-12-12T14:27:07.989Z INFO [funeraria.auth.keycloak:37] - [Auth] Checking auth status at: https://auth-service.funerariafrancana.com.br/user/me
main.js:1 {xkKZ4: 'g'}
main.js:1174  GET https://auth-service.funerariafrancana.com.br/user/me 401 (Unauthorized)
main.js:1090 2025-12-12T14:27:27.749Z INFO [funeraria.auth.keycloak:54] - [Auth] Not authenticated (status 401 ), Gateway will handle OIDC flow
main.js:1090 2025-12-12T14:27:27.751Z ERROR [funeraria.auth.keycloak:76] - [Auth] Error: Not authenticated {:status 401}
main.js:1090 2025-12-12T14:27:27.751Z ERROR [funeraria.core:101] - Failed to initialize auth: #error {:message "Not authenticated", :data {:status 401}}
```

I think `cartas-frontend` shouldn't hit itself. Just to evade CORS. Currently envoy isn't redirecting. On `GET https://cartas-staging.funerariafrancana.com.br/api/auth/user/me` it gets an error. But, we should have CORS permitting cartas staging to hit    auth-service-staging.
``` 

## Asking for CLARITY

```
sync'ed. Now, how do we plan to test and make sure to either we are on right track or not, and if authorization is working as expected.
This process of introspection on the progress is as important as the effort of going forward itself. Because withoutit we may be going on
the wrong path, with a lot of effort. Which is fruitless
```

## Planning

```
Great, now let's focus on `sisf-web` internal workings and how they relate to `k8s`/`envoy` gateway setup.

More particularly, in relation to routing.

The dashboard will route to multiple applications (other frontends in other endpoints)... Sometimes, it will internally route to itself in a  `/route/to/sisf-subapp` - `sisf-web.funerariafrancana.com.br/route/to/sisf-subapp`. And make requests to get info from backends to show       messages, highlights, stuff like that.

Currently, clicking at inventory (in prod) it goes to `https://inventory.funerariafrancana.com.br/inventory`. But, just should go to `https://inventory.funerariafrancana.com.br/`

And, when going to subroutes, like "serviços", it will change the SPA, but the route will still look like `https://sisf-web.funerariafrancana.com.br/`. And maybe should be `https://sisf-web.funerariafrancana.com.br/servicos`?

Let's decide on the best architecture for this, etc. And, document the decisions. Who is responsible for what. And, guides to develop         correctly in relation to our decisions. a ADR type of document.
```

```
launch agents to plan, architect, execute and verify a rewrite and breaking down of the monolithic `sisf` project.

- What core apps/modules we need to create;
- How much parity do we have;
- What are main goals;
- We need to stablish minium parity;
- Use an strategy to divide and conquer our monolith behavior in microsservices;
- Reuse AutoPDF as the main source of PDF generation;
- Users should be able to edit latex templates, in order to have them actually generate the PDFs, inside the `sisf-web` project;
- Use MCP as much as possible. Specially our firebird mcp, in order to model applications and backends to mimic the data structure in         functionality-parity.
```

## How to break down a monolith into microsservices -- plan!

``` 
I want you to make a plan/roadmap with specification for migrations in relation to `sisf` monolith to `sisf-web`
  application with multiple microsservices. I will use this roadmap, and roadmap per application, plus plans per
  applications to launch multiple agents to develop each part of the system/microsservice. Give your opinion on what
  tech stack should we use per service. Python, Go, Clojure, ClojureScript, Elm and JavaScript are the core of our
  stack. Chose from this list. If you think another language/stack would be a great fit for a given service, let me
  know too.
```

## Asking for MinIO

```
Help me build a plan to run MinIO and connect it to our pg setup. I trust your reasoning capabilities. And, in doubt,    ask and we can review some documents and arrieve at the right decisions.

https://github.com/minio/docs
https://github.com/minio/operator
https://github.com/minio/minio/tree/master/helm/minio
https://docs.min.io/enterprise/aistor-object-store/installation/kubernetes/
``` 

## Kanban MCP

```
Where we are at this project? Monolith to microsservices trajectory of `sisf`; pick it up the context from our multiple projects. Let's     track with a "global" roadmap including multiple projects.


Let's use this project: https://github.com/renatokuipers/dynamic-kanban-mcp

Clone, build, and set up the MCP. So we can use it to kanban-dashboard track our multi-head effort eith this project, while we are going at full throttle.
```

### Task guidance example

```
Let's start out with local development tasks (application development first). Work on Core APIs. Create mock tests, unit tests at first.
 We will create integrations tests, when we move on to containarization and wirering it up to `dc`
```

```
summarize in a docs and add it to `sisf-sync` space. Update kanban. You are the architectural designer. Another `sisf-sync` specialist will implement these details.
```

### Asking questions

```
How will `sisf-sync` work? What's the principles and mechanisms? We may need to implement an incremental sync, instead of trying to sync everything all at once. Space it out,
  to not overload firebird. Also, retry logic is very important. And collecting data of when it fails and reschedulling trying it again latter after consecutive retrys is
  important here. We had to implement it for obituary service that feeds our website obituary page (retry logic).
```

### Meta organization steps

```
add note in ADR about kanban etc, after a task is completed, the agent-llm shoud commit and push to a designated feature (feat/) branch;
  After multiple features complete a goal/milestone, they should merge into the staging branch. Then, after running multiple tests we will
  merge things at main; this last step will be explicit, human on the loop here.
```

### Stiring up (giving guidance to) a proactive agent

```
 Make it into a repository in `assistencia-funeraria-francana`, similar to how we did with `proto-auth`, in terms of publishing as a
  package. Use `gh` if needed. Use kanban mcps to create long-term plan to implement these features
```

```
Let's use the monitoring shared-package for go backend services. Help me making tasks for each project; we have to probably change          Dockerfile, so `go mod tidy` pull with credentials our private project. See how other projects using `proto-auth` as a package accomplished that - it's the same process.


Recent Progress (from CLAUDE.md - 2025-12-17)

go-observability Package Created:
- Published reusable observability library at https://github.com/Assistencia-Familiar-Francana/go-observability v0.1.0
- Implements ADR-005: Prometheus metrics, zerolog logging, health endpoints, trace context

Service Compliance Status (ADR-005):
| Service         | Status                                                   |
|-----------------|----------------------------------------------------------|
| auth-service    | 90% - Has metrics/logging, needs /readyz + trace context |
| sisf-sync       | Implemented (9ec8d6b)                                    |
| cartas-backend  | 20% - Needs full implementation                          |
| obito-backend   | 30% - Has health, needs metrics/logging                  |
| sisf-* services | 0-10% - Ready for go-observability rollout               |

Recommended Starting Points (Based on SESSION_CONTEXT.json)

1. Implement observability in cartas-backend - Highest priority production service
2. Complete auth-service observability - Add /readyz endpoint with DB checker, trace context
3. Implement observability in obito-backend - Production service with legacy Firebird
4. Roll out to remaining SISF services - reference, contributor, obituary, payment
```

```
Note: vibe_kanban mcp is up and running; use it to track long-term session-agnostic progress and planning.
``` 



## Accountability: planning, defining goals, measure targets

```
Planning, defining goals, measure targets:

in relation to the `<service>` service, how will we be able to know it's working as expected? What commands could we use to know it's
  working, partially failing or totally failing? Plan on how to evaluate success vs failure
```
