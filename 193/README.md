# Why Programming Languages choices are important

Why JavaScript sucks, yet it is so widely popular? 

Why should it matter what language we chose to program in, if they are all (equally) *Turing Complete*?

## Many ways to skin a Cat

I'm vegan though, so no Cat skinning, here.

Anyways, one way to look at it, is using sophisticated concepts, that doesn't directly bridge to everyday experience (empirical usage of languages). For example, using Formal Language theory.

We know that a grammar *Sigma* (**Σ**), can harbor a set of valid *Syntaxes* that form comprehensible **Sentences**, given a set of rules.

That's all fine and well. JavaScript has a "killer-feature" for beginners, i.e., some differential advantage, over many languages. And that is: **almost anything you write is a valid sentence**. It *won't complain* about anything you write. **It will just not properly work, on the short and long runs**.

## How different Languages operate

Other languages, on the other hand, restrict you over *what* and *how* you can write. Mostly over *how*, so to enforce a certain (considered good) pattern. Let's a take an example with `Go`: if you don't you an **import** (internal or external code you are calling on that piece of code, in the file). Then, it won't compile! This enforces the program to never have unused dependencies; be as lean and efficient as possible, in so far as dependencies goes.

The (little) drawback is, of course, you can't **just skip** over that practice of scrutinizing what imports are being actually used. Luckly, there is tooling around it, and any decent *text-editor* will use plugins to automatically rewrite your imports, on file-save, for you.

You see, just like that, really efficient and well designed languages are not often simple and straight-forward to write code that actually does something. Actually, in well designed **Grammars**, it will be hard for form **Sentences** which don't work.

It's like **Lojban**, in comparison to "natural languages" e.g., meaning here languages usable by sentient beings to communicate with each other, in our case, humans of course.

For those who don't get the reference,

``` quote
Lojban is a logical, constructed, human language created by the Logical Language Group which aims to be syntactically unambiguous.

-- https://en.wikipedia.org/wiki/Lojban (20250211173706)
```

## The relevance of unambiguous and self-consistent languages

Just like *Lojban*, in which it's designed to be unambiguous, in computer programming languages, one can design it to have certain properties. For example, in `Elm`, there are no **runtime errors**. 

And, why is that so impressive? Well, for *Lojban*... it's an actual human language that is **unambiguous**! In the natural-selection of languages, **no "natural" human language** prior had evolved to not be *ambiguous*. And, *ambiguity*, of course, is a source of many problems, in practical cases. Like, wouldn't it be nice that **Law** was written **unambiguously**? So, the fact that, prior to the extensive scientific and mathematical-logical research on (natural and formal) languages was done, no group of humans was capable of formulating a **Grammar**, such that there was no ambiguity.

The same thing can be said about no **runtime errors** and `Elm`. Why? Well...

``` quote
Runtime, run time, or execution time is the final phase of a computer program's life cycle, in which the code is being executed on the computer's central processing unit (CPU) as machine code. In other words, "runtime" is the running phase of a program.
```

This means that, by having no **runtime errors**, essentially, that program in that language is *internally* consistent. In **Elm**'s case that is secure for **all** it's programs e.g., any set of *Sentences* working together. 

``` quote
A runtime error is detected after or during the execution (running state) of a program (...). Many other runtime errors exist and are handled differently by different programming languages, such as division by zero errors, domain errors, array subscript out of bounds errors, arithmetic underflow errors, several types of underflow and overflow errors (...)
```

``` quote
(...) many other runtime errors generally considered as software bugs which may or may not be caught and handled by any particular computer language.
```

Essentially - we are backed by *Wikipedia*, which may not be the best source of information in general, although, we will roll with that anyways - this means that devising a language with **no bugs** translates to a language without **runtime errors**. Your program may not do what you intended to write (e.g., you didn't actually expressed what you set yourself to write), but once the program is valid (e.g., *compiles*). Then, you can rest assured there won't be crashing and any bugs in it!

The **hard part** is to write the program! Essentially, there is no debugging; only writing and rewriting the program to your purposes.

## Practical, final thoughts on the matter

Consider this: most of the time spent on developing programs is in debugging.

- https://www.microsoft.com/en-us/research/uploads/prod/2019/04/devtime-preprint-TSE19.pdf
- https://cs.gmu.edu/~tlatoza/papers/RethinkingDebuggingAndDebuggers.pdf
- https://arxiv.org/abs/2105.02162
- https://arxiv.org/abs/2109.02682

If you still don't find that incredible. Consider this:

``` quote
Research by Cambridge MBAs for tech firm Undo finds software bugs cost the industry $316 billion a year. (2013)
```

- https://www.jbs.cam.ac.uk/2013/research-by-cambridge-mbas-for-tech-firm-undo-finds-software-bugs-cost-the-industry-316-billion-a-year/

Ok, now you may be convinced why the feature of having an extremely acceptive grammar, like **Javascript** is not actually a *feature*, but an inherent **bug**. And, that is practically relevant for anyone trying to write meaningful, working, programs.

Choosing Computer Programming are, definitely, an important step in **software design**.
