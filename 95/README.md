---
title: "# External redirecting with ClojureScript"
description: "I don't know how to write a function to redirect to external urls. The default is to use the inside router of the SPA. How would `:http/redirect look like?"
published: "2025-01-01"
image: "./images/image-post-95.png"
draft: false
---

## External redirecting with ClojureScript

Hey!

I have a question related to redirecting the browser to a url outside my application. This will happen through a dispatch function. The function is called :route-changed the handler when equal to `:aporte-no-ppi` and `:saiba-mais` will redirect. The default is to use the inside router of the SPA.

How would `:http/redirect` look like? I don't know how to write a function to redirect to external urls.

```cljs
(rf/reg-event-fx
 :route-changed
 (fn [{nav :db} [_ {:keys [handler route-params]}]]
   (let [nav              (assoc nav :pagina-ativa handler)]

     (case handler
       :aporte-no-ppi {:db (assoc nav :pagina-ativa handler)
                       :dispatch [:http/redirect :aporte-no-ppi]}
       :saiba-mais  {:db (assoc nav :pagina-ativa handler)
                     :dispatch [:http/redirect :saiba-mais]}
       {:db               (assoc nav :pagina-ativa handler)}))))
```
