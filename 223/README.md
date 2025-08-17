# Cryptography

> There is a very real and critical danger that unrestrained public discussion of cryptologic matters will seriously damage the ability of this government to conduct signals intelligence and the ability of this government to carry out its mission of protecting national security information from hostile exploitation.
> -- Bobby Ray Inman

## Intro

Cryptography has been used for millenia (*documented up to ~3500 BCE*[^1]) to certify properties of things.

When people think of **cryptography**, maybe they think of *safety systems*. Maybe *crypto-currencies*. Or a *word-coding* system. Or something of sorts.

But, probably they don't think of *wax seals* and *clays*. What is more funny is that this was the most common practical use of what today we call cryptography, in the past [^2][^3].

People **certifying claims**! That's the main thing about cryptography. Someone proving something, or some property. And you may say, that sounds a lot like mathematics; which you would be right. It also can be, of course, used in legal settings (and it is; your **PIN**, *Personal Identification Number*, in your bank is your *digital signature*). As well as **message-ownership**. **Proof of integrity**.

*All* these have existed in some form and method in the past. 

Today, for eletronic means, we have the so powerful **PGP** (i.e., *Pretty Good Privacy*)! And it's on everyone's fingertips. Although... the catch is, almost no one uses it. Isn't that crazy? Royalty, merchants, and other groups would invent very elaborate mail messaging wax-systems **for security**. And, now, we - the peasants - have a hold of PGP and we don't even bother to use it; we write it off as *"It's too complicated"*. The powerful entities actually dissuated people of using it, or the average people didn't catch on. Either way, their fears didn't come to fruition, mostly [^4].

## A personal tale

If you are on the `TL;DR` team, go to the conclusion section and skip the `Background` section.

### Background

When I was working building a system used by various third-parties to document grants and this sort things (yes, I'm being very *cryptic* here, for legal reasons). We were using the good '&old full-stack garbage JS. JQuery and Vanilla JS, as well as Node.js and RJX etc.

And, when you run a `npm run dev` it would spawn the front and backends. The logs... oh, those horrible logs - would all clutter up together. Frontend and backend messages. The output strings in the console would be a mess.

So, I wrote a little Go parser for it. Basic stuff. Line break the code and stack traces; pipe it in another stablished utility to color the output (pygments, if I remember correctly).

The code had like 30 lines, or so. The log would have literal formatting "string-codes" like `\n`. So, I just had to transform that on actual line-scappes for the terminal. And some more few tweaks. The code looked like this:

``` go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	for sc.Scan() {
		line := sc.Text()
		// Replace literal "\n" sequences with actual line breaks
		line = strings.ReplaceAll(line, `\n`, "\n")
		fmt.Print(line + "\n")
	}
	if err := sc.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
	}
}
``` 

Then, I was dandy and happy. Told to my collegues that - half were coding normies, Windows types - and shared it with them. I think I send the code in chat. Or just compiled and send it to them, or let in dev assets of the project (it was not going into the final bundle for production; even more so, it was written in Go. The served bundled was JS, so it doesn't even make sense to consider that). 

Anyways, so, I was already 5-20x more productive. Because I could actually **read** the *error messages* from the development cycle. 

I can't even begin to image how they survived 2+ years without a sane error messaging output, while trying to develop this rather complex project (for a Vanilla JS + JQuery stack).

> Well, ok... life is good.

My normie coworker, she was an ex-laywer of something. She graduated in law, and then switched to being a (1/10th-backed) programmer. Surely she was self-taught and proably aged with all the rage and stress she would exhale. But, well, she had a strong will and quite the fetish to suffer - it would seem. Since they all strongly opposited anything new; because change meant breaking-change. The system was that fragile, yes. Brittle-snake.

She then started working in the project I was "*leading*"[^footnote]. She asked the basic stuff about the project. And, saw my beautiful output on my terminal. Amazed by such a helpful output steam she never had, she asked me to explain to her how to use it.

I was then a very unexperienced Go programmer. I knew Go could generate cross-platform code. But, I didn't know I had to generate the multiple binaries and I was responsible to share each one distinctively. Thus, I shared with her my *linux-native* **binary**. You can image the alarms and whitles her linux "*Anti-virus*" stated blowing!

Sneakly, she didn't come to me and confronted her findings. "Hey, look, my computer says your program is a virus!". No, she went straight to my supervisors and the security team and provided them screenshots and stuff. Alarmed everyone. But, me.

So, I was happy and dandy with my productivity. Solving the world's problem, like world hunger and stuff. Then, I get cut-off with everyone looking strange at me, as if I killed someone; hidden the body poorly; and was about to get to Federal Prison.

Well, then it was kinda hush-hush, someone asked me (another dev) as if he wanted nothing... Hey, can you explain to me about this parser you wrote. I said, *of course!*, here is the source-code. It simply convert those ugly-looking outputs etc. Then, he asked me how to compile it. I explained. He asked how he could share it cross-platform. I actually then researched and produced `.exe`s as well as linux and macOS bins etc.

### Conclusion: program-signing and mathematical trust

But, what about **cryptography**? Well, had I undertood more about it. No fuss would have been made further. Let me explain, if you will.

There is something called `hash-signing` a **program**. What is this, and why it's useful? Let's say you don't believe a third-party. But, you want to use the program they are sharing. You could either take the source code and generate the binary then produce it's hash, or get the signed-hash from someone you actually trust that produced and signed the hash for that especific program. Then, compare the hashes this third-party shares with you.

If they match, they are as trustworth as whoever method you got the trustworth-hash.

See, **trust** has transitive properties. And, cryptographic-signing coupled with hash-functions **are the means** to implement that **Transitivity** property.

So, what would have I done differently. Instead of saying, *Oh, please, good folks. Believe in me, instead of her* and plaited hersay against hersay... I could just gathered up everyone. Then, show the source code; generate the binary; get it's hash1. Then gotten the file,*which* **she accused of being was a virus**, gotten it's hash2. Finally, compared hash1 with hash2 and **mathematically proven**: "*Hey guys, you can trust me*"; and now, say "**sorry for causing all this trouble - siren-alarming everyone and making our working environment a shithole!**".


## References

[^1]: https://premiumwaxseals.ca/the-history-of-wax-seals/
[^2]: https://en.wikipedia.org/wiki/Cylinder_seal
[^3]: https://en.wikipedia.org/wiki/Ancient_Near_Eastern_seals_and_sealing_practices
[^4]: https://ocw.mit.edu/courses/6-805-ethics-and-the-law-on-the-electronic-frontier-fall-2005/pages/readings/read_tlp4/
[^footnote]: I was a junior that was given the harderst developer task, which was critical for the company's survival, while I was on my onboarding phase. No, It's not a bad joke, or I'm inventig. That's how things happened. Don't ask me why, ok? I was **just following orders** and I was quite the adventurous type. Young, agile, brave and stupid. The perfect mix to blow up stuff).
