---
title: "Re-frame"
description: "Dynamic behavior often entails events depending on subscriptions and vice-versa. Once the **state0** is changed through an **event** (e.g., scheduled, or a user's action) we will have a new **state"
published: "2023-05-08"
image: "./images/image-post-47.png"
draft: false
---

# Re-frame

Clear separation of business logic from creation of components.

`Events` are `dispatched`.
`Subscriptions` are `subscribed` to.

Dynamic behavior often entails events depending on subscriptions and vice-versa. Once the **state0** is changed through an **event** (e.g., scheduled, or a user's action) we will have a new **state1** coming to our subscriptions and views. And, this could possibly alter how events behave, if they depend on the subscriptions.

So, `behavior(state) <-> events(subscription)`.

As states are updated through events being dispatched and making changes in db etc., we will have different set of possible behaviors.

As an example, let us dwell on the context of a button having a icon heart (liked, favorite etc) and a counter next to it.

Let the state0 be: 
```
[count 4
 liked? false]
```

So, as a helper to the user, the heart will be only outilined in it's border, if it's not in a `liked-state`, e.i., `(= linked? true)` -> true.

The possible set of behaviors0, as function of the state0, are: increase count, change liked? from `false` to `true`.

If we dispatch the event, by clicking the button-heart, we will update the state0 to state1:
```
[count 5
 liked? true]
```

Now, the behavior1, function of the state1, implies that if we click again on the button, now the event dispatched will be: decrease `count`, change `liked?` from `true` to `false`.

Re-frame [^1] and ClojureScript makes such a problem be trivial. And, that's the gimic of this library.

[^1]: [https://github.com/day8/re-frame](https://github.com/day8/re-frame])

