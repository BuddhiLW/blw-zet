---
title: "Re-frame documentation notes (Cofx)"
description: 'We get to write a nice pure component, like:```cljs(defn say-hi) and Reagent/React mutates the DOM for us. The framework is looking after the necessary side-effects'
published: "2023-05-08"
image: "./images/image-post-49.png"
draft: false
---

# Re-frame documentation notes (Cofx)

## Et tu, React?

Turns out it's the same pattern with Reagent/React.

We get to write a nice pure component, like:

```cljs
(defn say-hi
  [name]
  [:div "Hello " name])
```

and Reagent/React mutates the DOM for us. The framework is looking after the "necessary side-effects".

## Pattern Structure

Pause and look back at say-hi. I'd like you to view it through the following lens: it is a pure function which returns a description of the side-effects required. It says: add a div element to the DOM.

Notice that the description is declarative. We don't tell React how to do it.

Notice also that it is data. Hiccup is just vectors and maps.

``` quote
This is a big, important concept. While we can't get away from certain side-effects, we can program using pure functions which describe side-effects, declaratively, in data and let the backing framework look after the "doing" of them. Efficiently. Discreetly.
```

Let's use this pattern to solve the side-effecting event-handler problem.
