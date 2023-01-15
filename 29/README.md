# Automate testing your website rendering

`Applitools` swears that it will test the user's perceived layout for your website. It uses A.I. to do so.[^1]

There are other ways, though. But, they are "analytical", meaning, they will capture width, css styles etc and compute everything against a baseline, to test if it matches. 

Although, it has some edge-cases, like testing the right font, being it a mono-sized-font. Meaning, doesn't matter what font it uses, the space occupied by the text will be universally equal among mono-type fonts. So, you really can't test if it's using the **right** monospaced font.

[^1]: [https://applitools.com/pricing/](https://applitools.com/pricing/)


