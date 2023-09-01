# Stack Overflow Deleted question

Currently I have the following structure, represented in pseudo-code:
```
Grid
  > Typography
  > Grid/Card
```

Which renders:
[![enter image description here][1]][1]

I would like to specify that the typography h2 element should only occupy the space of it's text (maybe a little padding y, but not as it is, which makes the same room as the Grid/Card).

Which prop I should give to the parent Grid, or the Typography element, etc.?

**edit**

Clarification: I want to control de behavior of the padding inside Typography. Which the padding I suppose is inherited from the Grid-parent, in order that the height of Typography and Grid/Cards be the same. I want to override or cancel this padding.

The schematic translation of what I just stated is represented in this picture (sorry for the poor sketch)

[![enter image description here][2]][2]

**Edit 2**

The code, as requested:

```clojure
[:> Grid {:container true
          :row-spacing {:xs 1}
          :sm 2
          :md 3
          :flex-direction "column"}
 [:> Typography {:text-align "center"
                 :component "h4"
                 :variant "h2"
                 :py 20
                 :font-weight 700}
  "Public"]
 [:> Grid {:container true
           :flex-direction "row"
           :justify-content "start"}
  (for [recipe recipes]
    ^{:key (:id recipe)}
    (let [{:keys [name saved-count prep-time img id]} recipe]
      [:> Grid {:px 2}
       [:> Paper {:pb 4}
        [:> Card {:p 2
                  :as "a"
                  :href (router/path-for :recipes)}
         [:> CardMedia {:class "img-card"
                        :sx {:height 300}
                        :image (str (or img
                                        "img/placeholder.jpg"))}]
         [:> Grid {:container true :spacing 2 :xs 12}
          [:> Grid {:item true :xs 12}
           [:> Typography {:variant "h4"} name]]
          [:> Grid {:item true :xs 12}
           [:> Typography {:variant "body1"} "Description: "]]]]]]))]]
```


  [1]: https://i.stack.imgur.com/j5j0p.jpg
  [2]: https://i.stack.imgur.com/50wYp.jpg
