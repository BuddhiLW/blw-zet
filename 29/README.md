---
title: "Automate testing your website rendering"
description: "Applitools will test the user's perceived layout for your website. It uses A.I. to do so. There are other ways, though."
published: "2023-03-05"
image: "./images/image-post-29.png"
draft: false
---

# Automate testing your website rendering

`Applitools` swears that it will test the user's perceived layout for your website. It uses A.I. to do so.[^1]

There are other ways, though. But, they are "analytical", meaning, they will capture width, css styles etc and compute everything against a baseline, to test if it matches.[^2]

Although, it has some edge-cases, like testing the right font, being it a mono-sized-font. Meaning, doesn't matter what font it uses, the space occupied by the text will be universally equal among mono-type fonts. So, you really can't test if it's using the **right** monospaced font.[^3][^4]

[^1]: [https://applitools.com/pricing/](https://applitools.com/pricing/)
[^2]: https://stackoverflow.com/questions/845/how-to-detect-which-one-of-the-defined-font-was-used-in-a-web-page
[^3]: https://github.com/Wildhoney/DetectFont
[^4]: https://github.com/derek1906/jFont-Checker/
