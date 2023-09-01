# Horizontal Rules with CSS

Generally, you can create a `horizontal rule` with `hr`. Tailwind can help modifying this behavior, as well as the color etc.

I wave used this one in my project.

```clj
[:hr {:class-name "w-full border-0 h-px my-2 bg-gray-200 dark:bg-gray-700"}]
```

Also, you can specify the size by using "w-1/4, w-2/4, ..., w-full".

Or, you can go a step further and do works in the middle of the `hr` [^1], using `before` and `after` pseudo-classes.

# Resource:
- [https://stackoverflow.com/questions/70203473/creating-a-horizontal-rule-hr-divider-that-contains-text-with-tailwind-css](https://stackoverflow.com/questions/70203473/creating-a-horizontal-rule-hr-divider-that-contains-text-with-tailwind-css)
