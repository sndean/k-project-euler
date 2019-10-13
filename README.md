# Project Euler 50 in K

---

Some answers to [Project Euler problems](https://projecteuler.net/).

---

Solutions *and explanations* to the first 50 Project Euler problems in K (Kona [a K3/K4 dialect], K7, and the K4 and K6 dialects whenever I can.)

## K7

K7 is made available by [Shakti](https://shakti.com/), with a good tutorial found [here](https://shakti.com/tutorial/). 

To install you need to have Anaconda / Miniconda, doing something like this:

```{}
conda create -n shakti python=3.7
source activate shakti
conda install -c shaktidb shakti
conda install -c shaktidb shakti-python
conda install jupyter
python -m ipykernel install --user --name shakti --display-name "shakti"
```

(The jupyter steps aren't really necessary.) Then, you can find the `./k` file at:

```{}
$ miniconda3/envs/shakti/bin/k
2019-05-24 16:37:43 12core 1gb avx2 © shakti m2.0 test
```

So now you'll have access to K7 in your terminal if you do something like:

```{}
alias k7='rlwrap -r /Users/sdean/miniconda3/envs/shakti/bin/k'
```

Where `rlwrap -r` is needed to use the up and down arrows in K7. Installed by doing `brew install rlwrap` on macOS. [rlwrap man page](https://linux.die.net/man/1/rlwrap).

## Kona

Kona can be downloaded [here](https://github.com/kevinlawler/kona). Kona is an open source implementation of K, specifically tries to emulate K3, but includes some aspects of K4.

```{}
git clone https://github.com/kevinlawler/kona.git
cd kona
make

rlwrap -r /Users/snd/kona/k
kona      \ for help. \\ to exit.

  +/1 2 3
6
```

## K6

K6 can be downloaded by asking the language's author nicely for the binary.

```{}
chmod +x k
rlwrap -r noah /Users/snd/k
2016.08.09 (c) arthur whitney
  +/1 2 3
6
```

## K4

K4 comes with the download obtainable from the [Kx website](https://kx.com/download/).

```{}
MacBook-Air:~ snd$ q
KDB+ 3.6 2018.12.24 Copyright (C) 1993-2018 Kx Systems
m32/ 4()core 8192MB snd macbook-air.local 192.168.0.8 NONEXPIRE

Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com
To exit, type \\
To remove this startup msg, edit q.q
q)(+/)1 2 3
6

q)\
  +/1 2 3
6
```

(Note that you can access K4 from Q by doing a `\`)

---

Some of the code comes from Kona's Project Euler [page](https://github.com/kevinlawler/kona/wiki/Project-Euler-Code-Golf), ngn's gitlab [page](https://github.com/ngn/k), and Hakank's K/Kona [page](http://www.hakank.org/k/). As far as I can tell, the K4 and Q solutions are more or less absent from the internet. I've attempted to expand and improve on all of the solutions and explain how they work in terms of Kona, K6, and K4. ngn's work is probably closest to working with Whitney's K6 binary, but most of it doesn't.

---

## Example

### Problem 5 in Kona

> 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
>
> What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

Here the goal is to find the smallest (+) number where `!` = 0 for all numbers between 1 and 20. For easier calculations, we'll work with numbers 1 to 7: 

```{}
  419 !/: (1+!7)
0 1 2 3 4 5 6
  420 !/: (1+!7)
0 0 0 0 0 0 0
  421 !/: (1+!7)
0 1 1 1 1 1 1
```

420 is the smallest number for numbers 1 to 7, with the result being all zeros. 

Now, we don't have to check every number going from 0 to 420, we can skip by 7:

```{}
  60{x+7}\0
0 7 14 21 28 35 42 49 56 63 70 77 84 91 98 105 112 119 
126 133 140 147 154 161 168 175 182 189 196 203 210 217 
224 231 238 245 252 259 266 273 280 287 294 301 308 315 
322 329 336 343 350 357 364 371 378 385 392 399 406 413 420
```

And you can then do something like this:

```{}  
  a:(1000{x+7}\7)
  a@&~+/{x!/:(1+!7)}a
420 840 1260 1680 2100 2520 2940 3360 3780 4200 4620 5040 5460 5880 6300 6720
```

This even works well enough to find the solution for 1-10:

```{}
  a:(1000{x+10}\10)
  &/a@&~+/{x!/:(1+!10)}a
2520
```

But as soon as you try something like 1-20, the little program never terminates (or at least I didn't have enough patiences to see it stop). So, we need a better way.

The even better solution uses the _least common multiple_, which is a method listed on [Kona's Github page](https://github.com/kevinlawler/kona/wiki):

```{}
  {x*y%{:[_ y;_f[y]x!y;x]}[x]y}/1+!20
232792560
```

Which is great, but for input = 100, this is the result:

```{}
  {x*y%{:[_ y;_f[y]x!y;x]}[x]y}/1+!100
-5604188662061589568
```

Which isn't right... So, we found a better way, but maybe we need an _even better_ way.

### Exponent method

Taking 20 as our example, we know the LCM must be divisible by every prime `<= 20`. In this case those primes are 2, 3, 5, 7, 11, 13, 17, and 19.

Now, using the greatest exponent of each prime, multiply them together as: $2^4 \times 3^2 \times 5 \times 7 \times 11 \times 13 \times 17 \times 19 = 232792560$. Here, we can use the built-in `_log` function to determine the exponent of the prime, `p`, as `log(20)/log(p)` by passing through the primes.

```{}
  p:2_&{&/x!'2_!x}'!:
  p 10
2 3 5 7
  {(_log 10)%(_log x)} p 10
3.321928094887362626 2.095903274289384832 1.430676558073393334 1.183294662454938528
  {_(_log 10)%(_log x)} p 10
3 2 1 1
  {x^_(_log 10)%(_log x)} p 10
8 9 5 7.0
  */_{x^_(_log 10)%(_log x)} p 10
2520
```

```{}
  p:2_&{&/x!'2_!x}'!:
  */_{x^_(_log 20)%(_log x)} p 20
232792560
```

But this solution fails when you test other (lower) values:

```{}
    */_{x^_(_log 7)%(_log x)} p 7
60
```

This should be 420, not 60.

What I didn't initially realize, is that the prime sieve needs to be inclusive if the input is an odd number, but exclusive if it's an even number. The current prime sieve function I'm using is an exclusive only function, which is fine if it's an even input. So, if we're happy with a 20-only solution for Project Euler, that's fine... but it's annoying. So here's the prime sieve with if-else logic:

```{}
  p:{:[~x!2; :2_&{&/x!'2_!x}'!: x; 1; x,:2_&{&/x!'2_!x}'!: x;]}
  */_{x^_(_log 20)%(_log x)} p 20
232792560
```

Cleaning it up a bit further (removing unnecessary parentheses and removing the `p` from the outside):

```{}
  p:{:[~x!2;:2_&{&/x!'2_!x}'!:x;1;x,:2_&{&/x!'2_!x}'!:x;]}
  {*/_(p x)^_(_log x)%_log p x} 7
420
  {*/_(p x)^_(_log x)%_log p x} 10
2520
  {*/_(p x)^_(_log x)%_log p x} 20
232792560
```

If we simply remove the `_` from the function, we can see that it yields the correct solution (at least the first several digits) for 100:

```{}
    {*/(p x)^_(_log x)%_log p x} 100
6.972037522971248629e+40
```

And this method now works for odd numbers as well (yay!).

The if-else logic in Kona works like this:

`:[x1;t1;x2;t2;...;xn;tn;else]` evaluate `xi` until true (or, `1`) and return `ti`, otherwise return else. Example:

```{}
  :[1;10;0;20;1;30;40]
10
  :[0;10;0;20;0;30;40]
40
  :[0;10;1;20;0;30;40]
20
```

And here's a simplified and more relevant example:

```{}
  {:[~x!2; x*2; 1;!x;]} 1
,0
  {:[~x!2; x*2; 1;!x;]} 2
4
  {:[~x!2; x*2; 1;!x;]} 3
0 1 2
  {:[~x!2; x*2; 1;!x;]} 4
8
  {:[~x!2; x*2; 1;!x;]} 5
0 1 2 3 4
```

In this function `{:[~x!2; x*2; 1;!x;]}`, the condition is `~x!2`, so if the input is even the flow goes to the first option and `x*2`. If the input is odd, the flow goes to the else option: `!x`.
