# Project Euler 100 in K

*WARNING - This contains "spoilers" (a.k.a. answers to [Project Euler problems](https://projecteuler.net/)). Please close this page immediately if you wish to solve the problems yourself. Beyond that, this post contains some of the thought process behind each problem, which too may be considered a spoiler.*




## Short about and set up

Solutions **and explanations** to the first 100 Project Euler problems in K (primarily the K6 dialect, Kona (a K3/K4 dialect),  as well as K4 and Q.

If you can do this, you're set up:

    chmod +x k
    rlwrap -r noah /Users/snd/k
    2016.08.09 (c) arthur whitney
     +/1 2 3
    6







## Intro

Here I'll go through as many Project Euler problems as I can with K (K6, especially), or at least up to problem 100. 

### Why K6? 

Mostly because it's more interesting to me than Kona and other K dialects, and because solutions to Project Euler Problems 1 - 100 have already been listed elsewhere publicly. Here, I won't have any way to cheat (other than in the few cases where K3/K4 is also correct for K6).

#### K6

K6 can be downloaded by asking the language's author nicely for the binary.

#### Kona

Kona can be downloaded [here](https://github.com/kevinlawler/kona). Kona is an open source implementation of K, specifically tries to emulate k3, but includes some aspects of k4.

#### k4 and Q

Both k4/Q come with the download obtainable from the [Kx website](https://kx.com/download/).


### Motivation

I'm posting answers here not because it's valuable for me to have a place to post answers themselves, but because it's valuable to coherently write out the descriptions of the solutions, which I'll try to do for every problem. Beyond this, I figure K/Q programming languages are obscure enough for it to be unlikely that anyone would stumble upon this post and have unwanted exposure to answers (it would seem different to me if this were "Project Euler with Python"). Plus there's a warning listed above, so I don't feel too bad.


### Acknowledgements

Some of the code comes from ngn's gitlab [page](https://github.com/ngn/k), Kona's Project Euler [page](https://github.com/kevinlawler/kona/wiki/Project-Euler-Code-Golf), and [Hakank's K/Kona page](http://www.hakank.org/k/). As far as I can tell, the K4 and Q solutions are more or less absent from the interwebs. I've attempted to expand and improve on all of the solutions and explain how they work in terms of K6 (and where I have time, for Kona, K4, and Q). ngn's work is probably closest to working with Whitney's K6 binary, but most of it doesn't. So, lots of this was hacked together by myself.



****



# Problem 1

> If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

> Find the sum of all the multiples of 3 or 5 below 1000.

One way to do this is to find the `mod` of the list of numbers < 10

## Kona
```{}
  (!10)!/3
0 1 2 0 1 2 0 1 2 0
```

This uses both the monadic and dyadic `!`, enumerating numbers under 10, then finding the `mod` of those numbers (e.g., where `5!3` yields `2`). 

Next, take the numbers that multiples, (`mod` = 0):

```{}
  ~(!10)!/3
1 0 0 1 0 0 1 0 0 1
```

Finally take those ones, map (`&`) them to the location in `!10`, and sum (`+/`):

```{}
  &(~(!10)!/3)
0 3 6 9

  +/(&(~(!10)!/3))
18
```

All that's left is the requirement to include 5. For this we have to go back a few steps to add each (`:`):

```{}
  ~(!10)!/:3 5
(1 0 0 1 0 0 1 0 0 1
 1 0 0 0 0 1 0 0 0 0)
 
  ~&/(!10)!/:3 5
1 0 0 1 0 1 1 0 0 1

  &~&/(!10)!/:3 5
0 3 5 6 9

  +/&~&/(!10)!/:3 5
23
```

```{}
  +/&~&/(!1000)!/:3 5
233168
```







## k4

First, just like in Kona, we can obtain the `mod` of `!10` and `3`. But in order for this to not yield any errors, it appears we have to pass this through a function (`mod:{x-y*x div y}`). If you don't, annoyingly, you'll see this error:

```{}
  (!10) !/ 3
'length
  [0]  (!10) !/ 3
              ^
```

With the `mod` function:

```{}
mod:{x-y*x div y}
  (!10) mod/ 3
0 1 2 0 1 2 0 1 2 0
```

Next, use each-right (`/:`) to include both 3 and 5. Then, add in where over (`&/`) the resulting vectors, and `~` to make the `=0`s 1s. Finally, where (`&`) the 1s are, obtain their values, and sum (`+/`) them:

```{}
  (!10) mod/: 3 5
(0 1 2 0 1 2 0 1 2 0;0 1 2 3 4 0 1 2 3 4)

  &/((!10) mod/: 3 5)
0 1 2 0 1 0 0 1 2 0

  ~&/((!10) mod/: 3 5)
1001011001b

  +/&~&/((!10) mod/: 3 5)
23
```

```{}
  +/&~&/((!1000) mod/: 3 5)
233168
```






## Q
```{}
  {(til x)mod y}[10] 3
0 1 2 0 1 2 0 1 2 0
```

This uses `til` which enumerates numbers up to the input (10) and `mod` which does modulus.

Next, take the `not`, `where`, and `sum` of those numbers:

```{}
  sum where not {(til x)mod y}[10] 3
18
```

Now we can add in `5`, which requires some `each` and `any`:

```{}
  sum where any not {(til x)mod y}[10] each 3 5
23
```

```{}
  sum where any not {(til x)mod y}[1000] each 3 5
233168
```





# Problem 2

> Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

> > 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

> By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.


## Kona

First we have to find a way to obtain the Fibonacci sequence. Let's see how we obtain the first 10 terms:

```{}
  9 {x,+/-2#x}/1
1 2 3 5 8 13 21 34 55 89
```

So let's break that down. We need to be able to sum two numbers and we know the sequence we want starts with `1, 2`:

```{}
  {+/-2#x} 1 2
3
  {+/-2#x} 2 3
5
  {+/-2#x} 3 5
8
  {+/-2#x} 5 8
13
```

So that seems to work correctly. Next, we need to join the result to the input. We can do that using join (`,`):

```{}
  {x,+/-2#x} 5 8
5 8 13
```

Next we want to apply this `n` times. For this, we can use the over monad `/` where you can apply `n` times like so: `n f/x`. (Example: `4 (2+)/1` which yields `9`, meaning "to 1, add 2 four times.")

```{}
  9 {x,+/-2#x}/1
1 2 3 5 8 13 21 34 55 89
```

Now that we have that, the rest is relatively simple:

We need the term that's the term immediately prior to that which is over 4 million. First, I should point out that in Kona you can abbrevate large numbers with scientific notation, so `4000000` becomes `4e6`.

```{}
  4e6 = 4000000
1
```

Next we want all the terms under the one that's `>4e6`:

```{}
  (4e6>+/-2#){x,+/-2#x}/1
1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 
6765 10946 17711 28657 46368 75025 121393 196418 317811 
514229 832040 1346269 2178309 3524578
```

Now let's find the even-valued terms:

```{}
  {~x!2} (4e6>+/-2#){x,+/-2#x}/1
0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
  {&~x!2} (4e6>+/-2#){x,+/-2#x}/1
1 4 7 10 13 16 19 22 25 28 31
  {x@&~x!2} (4e6>+/-2#){x,+/-2#x}/1
2 8 34 144 610 2584 10946 46368 196418 832040 3524578
```

The only interesting thing there is the `@` verb which is the dyadic `at`, which pulls the value from x at indices y. Some examples:

```{}
  {x@ 1 3} 4 2 1 9
2 9
  {x@&x=3} 4 2 1 9
!0
  {x@&x=2} 4 2 1 9
,2
```

(Remember that Kona is 0 indexed.)

Finally, all we have to do is sum (`+/`):

```{}
  +/{x@&~x!2}(4e6>+/-2#){x,+/-2#x}/1
4613732
```





## k4

The k4 code is identical to the one for Kona, except, again the `mod:{x-y*x div y}` function appears to be needed:

```{}
mod:{x-y*x div y}
  +/{x@&~x mod/ 2}(4e6>+/-2#){x,+/-2#x}/1
4613732
```




## Q

The Q code is easily translatable from the k4 code, where `sum`, `where`, and `not` are added as replacements:

```{}
  sum {x where not x mod/ 2}(4e6> sum -2#){x, sum -2#x}/1
4613732
```












# Problem 3

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

Kona's Project Euler [page](https://github.com/kevinlawler/kona/wiki/Project-Euler-Code-Golf) has a solution that is sort of a hack that doesn't generalize well (e.g., doesn't work for 15), but it works for 600851475143:


```{}
  |/d@&&/'2_'f'd:&~(f:{x!'!1+_sqrt x})600851475143
6857

  |/d@&&/'2_'f'd:&~(f:{x!'!1+_sqrt x})15
3
```

Let's see if we can come up with something that is generalizable. First, we can use code from [hakank's website on k](http://www.hakank.org/k/) (or Kona's [Idioms page](https://github.com/kevinlawler/kona/wiki/Idioms)) for listing all of the primes up to `n` (primes_to_n_sieve2 -> p). 

```{}
  p:{:[x<4;,2;r,1_&~|/x#'~!:'r:_f[_-_-_sqrt x]]}
  p 100
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97
```

(`p:2_&{&/x!'2_!x}'!:` and other ways also work, but some of them are slow.)


Using this, we can essentially use this a lookup table for large prime factors of 600851475143. As long as we set `x` to be very high, e.g., `10000` or `100000`, then that should be cover the greatest prime factors of very large numbers. This is a bit of a cheat, but it's similar to the cheat of take taking the `sqrt` of an input and only calculating the prime factors below that, which is done for a lot of Problem 3 solutions.

Using this large list, we can run mod eachright (`!/:`) of our test number against all of the primes up to 10000:

```{}
  15 !/: p 10000
1 0 0 1 4 2 15 15 15 15 15 15 15 15 15 15 15 ...
```

Next, put that in a function and add the not where at code that we used earlier in front:

```{}
  {x@&~15!/:x}p 10000
3 5
```

Finally, just take the highest value (`|/`):

```{}
  {|/x@&~15!/:x}p 10000
5
```

And this solution is generalizable up to large values:

```{}
  p:{:[x<4;,2;r,1_&~|/x#'~!:'r:_f[_-_-_sqrt x]]}
  {|/x@&~600851475143!/:x}p 10000
6857
```

or on one line:

```{}
  {|/x@&~600851475143!/:x}{:[x<4;,2;r,1_&~|/x#'~!:'r:_f[_-_-_sqrt x]]} 10000
6857
```





## k4

### TODO

```{}

```


## Q

For Q, the hardest part is simply translating k code to the words of Q, which I used code from [Ryan Hamilton's Kdb+ Database Examples](https://github.com/timeseries/kdb/blob/master/qunit/math.q), a translation of `p` from earlier. After that, translating the rest was very simple:


```{}
  p:{$[x<4;enlist 2;r,1_where not any x#'not til each r:.z.s ceiling sqrt x]}
  {max x where not 15 mod x} p 10000
5
  {max x where not 600851475143 mod x} p 10000
6857
```








































# Problem 4

> A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

> Find the largest palindrome made from the product of two 3-digit numbers.


## Kona

First, how do we test if we have palindromic number in Kona? 

Reversing the value of a number doesn't sense, but since strings in Kona are lists of characters, we can simply convert numbers to strings using `$`:

```{}
  $99
"99"
```

Now that we have a testable object, we can test if it's a palindrome via reverse `|` and match `~`. Something like this:

```{}
  ($99) ~| ($99)
1
  ($100) ~| ($100)
0
```

Converting this reverse-match an anonymous function makes it work quicker:

```{}
    {x~|x} ($99)
1
    {x~|x} ($100)
0
    {x~|x} ($101)
1
    {x~|x} ($102)
0
    {x~|x} ($103)
0
```

Now let's test all of the numbers from 0-99 to find which are palindromic, and where they're located:

```{}
    {x~|x}' ($!100)
1 1 1 1 1 1 1 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 
0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 
0 0 0 0 0 0 1

    &{x~|x}' ($!100)
0 1 2 3 4 5 6 7 8 9 11 22 33 44 55 66 77 88 99
```

And we can find the largest palindrome by using `|/`:

```{}
  |/&{x~|x}' ($!100)
99
```

Now that we have that down, what about the "from the product of two 3-digit numbers" part of the question? 

That's relatively simple in Kona. Let's do that with numbers from 0-9 first. So from `0*0` to `9*9`, where join `,` creates a vector of all the results:

```{}
  ,/a*/:a:!10
0 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 0 2 4 6 8 10 12 14 
16 18 0 3 6 9 12 15 18 21 24 27 0 4 8 12 16 20 24 28 32 36 
0 5 10 15 20 25 30 35 40 45 0 6 12 18 24 30 36 42 48 54 0 
7 14 21 28 35 42 49 56 63 0 8 16 24 32 40 48 56 64 72 0 9 
18 27 36 45 54 63 72 81
```

Now we can put these together:

```{}
  |/&{x~|x}' ($b:,/a*/:a:!100)
9991
```

But... that result doesn't make sense. We forgot the dyadic `@` (pulls the value from x at indices y):

```{}
  |/b@&{x~|x}' ($b:,/a*/:a:!100)
9009
```

Finally, let's remove the unnecessary parentheses and scale it up to 3-digit numbers:

```{}
  |/b@&{x~|x}'$b:,/a*/:a:!1000
906609
```

It's a little slow, but it works.




## k4

The Kona answer works just fine in k4:

```{}
  |/b@&{x~|x}'$b:,/a*/:a:!1000
906609
```



## Q

Translating the Kona and k4 answer to Q had some hangups. First, the essential idea was identical and worked fine, including reversing and matching strings:

```{}
  "100" ~ reverse "100"
0b
  "101" ~ reverse "101"
1b
```

However, whereas casting integers to strings in Kona and k4 creates a easy-to-work-with column vector, things work a bit differently when using `string`, meaning `raze` is needed:

```{}
  string a*/:(a:til 10)
,"0" ,"0" ,"0" ,"0" ,"0" ,"0" ,"0" ,"0" ,"0" ,"0"
,"0" ,"1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9"
,"0" ,"2" ,"4" ,"6" ,"8" "10" "12" "14" "16" "18"
,"0" ,"3" ,"6" ,"9" "12" "15" "18" "21" "24" "27"
,"0" ,"4" ,"8" "12" "16" "20" "24" "28" "32" "36"
,"0" ,"5" "10" "15" "20" "25" "30" "35" "40" "45"
,"0" ,"6" "12" "18" "24" "30" "36" "42" "48" "54"
,"0" ,"7" "14" "21" "28" "35" "42" "49" "56" "63"
,"0" ,"8" "16" "24" "32" "40" "48" "56" "64" "72"
,"0" ,"9" "18" "27" "36" "45" "54" "63" "72" "81"


  raze a*/:(a:til 1000)
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0..
  string raze a*/:(a:til 1000)
,"0"
,"0"
,"0"
,"0"
,"0"
..
```

After that, the match and `reverse` function along with `where` and `max` are very straightforward 

```{}
  max b where {x ~ reverse x} each string b:raze a*/:(a:til 1000)
906609
```


































# Problem 5

> 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

> What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


## Kona

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













## k4

```{}

```

## Q

```{}

```








































# Problem 6

> The sum of the squares of the first ten natural numbers is,

>> 1^2 + 2^2 + ... + 10^2 = 385

> The square of the sum of the first ten natural numbers is,

>> (1 + 2 + ... + 10)^2 = 55^2 = 3025

> Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

> Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


## Kona

```{}
  {_(_sqr+/x)-+/x^2}1+!100
25164150
```

## k4

```{}

```

## Q

```{}

```







































# Problem 7

>By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

>What is the 10001st prime number?


## Kona

```{}
  p:2_&{&/x!'2_!x}'!:
  (p 200000)[10000]
104743
```

This is a function that generates all of the primes up to 200000, which includes the 10001st prime, and uses the index of 10000 to pull out the 10001st prime. It provides the correct answer, but it's _incredibly_ slow. (I literally fell asleep yesterday waiting for it to finish.)

The solutions listed on Kona's Github page also appear to be unsatisfactorily slow (though slightly faster than the above):

```{}
 p:2;i:3;while[10001>#p;if[{&/x!'p} i;p,:i];i+:1];*|p
```

So, here, I'll try to come up with some better solutions to reach the answer in under a minute (and most likely using a lot more k code).

### Prime Number Theorem

The first thing to do is to have good way to know how far you need to go (how many primes will show up before $n$). The prime number theorem (PNT) is a useful tool for that. For our purposes, it's enough to say that the number of primes before $n$ is approximately $x/log(x)$. Some examples:

```{}
  \p 0
  p:2_&:({&/x!'2_!x})'!:
  xlogx:{x % _log x}
  
  # p 10
4
  xlogx 10
4.342944819032517501

  # p 100
25
  xlogx 100
21.71472409516259106

  # p 1000
168
  xlogx 1000
144.7648273010839546

  # p 10000
1229
  xlogx 10000
1085.736204758129361

```

So what about the 10001st prime? Let's see how close we can cut it:

```{}
  xlogx 116700
10002.26116389158415
```

This already appears to be an improvement. Instead of my initial try of looking in the first 200000 numbers, here we're looking at the first ~115000. 

### Sieve of Atkin

The [Sieve of Atkin](https://en.wikipedia.org/wiki/Sieve_of_Atkin) is supposeedly the fastest algorithm for finding all prime numbers up to a specified integer. Let's see if we can implement it.







## k4

```{}

```

## Q

```{}
-1+last{if[all 0<x[1]mod/:2+til floor[sqrt x 1]-1;x[0]+:1];x[1]+:1;x}/[{x[0]<10001};(0;2)]
```










































# Problem 8

> The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

> 73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450

> Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?

## Kona


First, you have to be able to read in text files:

```{}
  {x}0$',/0:`pe8.txt
7 3 1 6 7 1 7 6 5 3 1 3 3 0
```

And count the number of numbers:

```{}
  {#x}0$',/0:`pe8.txt
1000
```

One reasonable way to solve this problem is to create a `4 x n` matrix, using a sliding window:

```{}
  (!10) @(!4)+/:!-3+# (!10)
(0 1 2 3
 1 2 3 4
 2 3 4 5
 3 4 5 6
 4 5 6 7
 5 6 7 8
 6 7 8 9)
```

Now, using the 1000 digits:

```{}
  {x@(!4)+/:!-3+#x}0$',/0:`pe8.txt
(7 3 1 6
 3 1 6 7
 1 6 7 1
 6 7 1 7 
 ...
```

```{}
  */'{x@(!4)+/:!-3+#x}0$',/0:`pe8.txt
126 126 42 294 294 210 630 90 45 27 0 0 0 0
```

And finally, the maximum:

```{}
  |/ */'{x@(!4)+/:!-3+#x}0$',/0:`pe8.txt
5832
```

Now with a 13-wide window:

```{}
  |/(*/'{x@(!13)+/:!-12+#x}0$',/0:`pe8.txt)
23514624000
```

Now, maybe there's a good idea, where rows with zeros are removed first.

An attempt to get rid of all of the zeros first:

```{}
  {x@&~0_in'x@(!13)+/:!-12+#x}0$',/0:`pe8.txt
7 6 2 4 9 1 9 2 2 5 1 1 9 6 7 4 4 2 6 5 7 4 
```


Simplified example for a way to remove rows from a matrix based on a condition. In this case, remove any rows containing a `0`.

```{}
  {x[&3=x?\:0]}(1 2 3;4 5 6;7 8 9)
(1 2 3
 4 5 6
 7 8 9)
  
  {x[&3=x?\:0]}(1 2 3;4 5 0;7 8 9)
(1 2 3
 7 8 9)
 
  {x[&3=x?\:0]}(1 0 3;4 5 0;7 8 9)
,7 8 9
```


The dimensions of the rows without zeros:

```{}
  ^ xx[&13=(xx ?\: 0)]
263 13
```

That's a signficant decrease in rows to check.

There's probably a better way to implement it, but if you time the second version (where you remove zeros first) and compare it to the first version, the first version is faster...:

```{}
  |/{*/'x@(!13)+/:!-12+#x}0$',/0:`pe8.txt
23514624000
  |/{*/'x[&13=x?\:0]}{x@(!13)+/:!-12+#x}0$',/0:`pe8.txt
23514624000
  \t |/{*/'x@(!13)+/:!-12+#x}0$',/0:`pe8.txt
1
  \t |/{*/'x[&13=x?\:0]}{x@(!13)+/:!-12+#x}0$',/0:`pe8.txt
2
```





## k4

```{}

```

## Q

```{}

```









































# Problem 9

> A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

> a^2 + b^2 = c^2
> For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.

> There exists exactly one Pythagorean triplet for which a + b + c = 1000.
> Find the product abc.


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```













































# Problem 10

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:{2_&{:[x@y;x&@[1,-1_ z#(1_ y#1),0;y;:;1];x]}/[x#1;2_! __ceil _sqrt x;x]};+/p@_2e6	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 11

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:.:'0:`
d:{x ./:/:m@-1_1_=+/'m:,/n,/:\:n:!#x}
i:|/,/{:[4>#x;x;*/'x@(!4)+/:!-3+#x]}'
|/(i p;i@+p;i d@p;i d@|p)
```

## k4

```{}

```

## Q

```{}

```







































# Problem 12

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
f:{1__ x*(x+1)%2};c:1;{x<500}{#{d:&~x!'!1+_sqrt x;d,_ x%|d}f c+:1}\1;f@c
```

## k4

```{}

```

## Q

```{}

```






































# Problem 13

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
\p 0 10#($+/0.0$’0:`)_dv"."	
```

## k4

```{}

```

## Q

```{}

```










































# Problem 14

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
clz:{:[x!2;1+3*x;_ x%2]}
a?|/a:{C:-1 1,(x-2)#0
  do[x+i:0
    if[~C@i
      b:&x>j:((i-1)<)clz\i
      C[j@b]:C[*|j]+(|!#j)@b]
    i+:1]
  C}@_1e6
```

## k4

```{}

```

## Q

```{}

```






































# Problem 15

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
(40{1+':x,0}/1)20
_*/(-2+4*x)%x:1+!20  /– implementing formulae \(C_{2n}^n\)
```

## k4

```{}

```

## Q

```{}

```









































# Problem 16

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/1000{x*:2;(*&x)_ x:((x>9),0)+0,x!/:10}/1 /slower: !'	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 17

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
a:$`one`two`three`four`five`six`seven`eight`nine
b:$`ten`eleven`twelve,($`thir`four,v:`fif`six`seven`eigh`nine),\:"teen"  
c:($`twen`thir`for,v),\:"ty"
g:a,b,c,/c,/:\:a
h:a,\:"hundred"    
i:g,h,/h,/:\:"and",/:g
z:#,/$i,`onethousand
```

## k4

```{}

```

## Q

```{}

```





































# Problem 18

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
|/{(y+0,x)|y+x,0}/.:'0:`t.txt /shorter 0:`	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 19

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/{(&/"01"=-2#$_dj x)&6=-x!7}'from+!-((from:_(_jd 19010101))-(_jd 20001231))	
```

## k4

```{}

```

## Q

```{}

```






































# Problem 20

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
xx: 1+til 100;
uc:{[x;y] tO:last[x]+y;aO:tO mod 10;bO:`int$(tO-aO) % 10;(-1_x),aO,bO}/[enlist 0;];
pp:{[x;y] mO:max count each rO:rO{[x;y] (y#0),x}'til count rO: y */: x;
          uc sum {[x;y] x,(y-count x)#0}[;mO] each rO };
lst:{[x] {parse x,"i"} each x} each reverse each string each xx
sum {[x;y] pp[x;y]}/[lst]
```

## k4

```{}

```

## Q

```{}

```




















































# Problem 21

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
f:{d:&~x!'!1+_sqrt x;d,_1_ x%d};+/&{(~&/x=b)&x~*|b:2{+/f x}\x}'!1e4	
```

## k4

```{}

```

## Q

```{}

```









































# Problem 22

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/s*1+!#s:+/'-64+_ic m@<(-|/#:'m)$'m:.:'1_'(0,1_&","=n)_ n:",",,/0:`names.txt	
```

## k4

```{}

```

## Q

```{}

```






































# Problem 23

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
l:28123;n:l#1 / (l)imit, (n)ot sum of abundant
{n[x@&l>x]:0}'a+/:a:1_&{x<+/{?1,d,x%d:c@&~x!'c:1+1_!_sqrt x} x}'!l / (a)bundant
+/&n
```

## k4

```{}

```

## Q

```{}

```





































# Problem 24

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
({:[1<x;,/(>:'(x,x)#1,x#0)[;0,'1+_f x-1];,!x]}10)[_1e6-1]	
```

## k4

```{}

```

## Q

```{}

```









































# Problem 25

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

xx: 1+til 100;
uc:{[x;y] tO:last[x]+y;aO:tO mod 10;bO:`int$(tO-aO) % 10;(-1_x),aO,bO}/[enlist 0;];
plus:{[x;y] mO:max count @/:(x;y) ;m:uc (x,(mO-count x)#0) 
    + (y,(mO-count y)#0);?[0=last m ;-1_m;m]};
count {[x] a:-2#x; x,enlist plus[a 0; a 1]}/[{[x] 1000>count last x};(enlist 1;enlist 1)]


```

## k4

```{}

```

## Q

```{}

```







































# Problem 26

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
1+*>#:'{[n] {r:(10**|x)!*x; w:x?r; :[w=#x;x,r;(*x),w _ x]}/(n,1)}'1+!999	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 27

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```






































# Problem 28

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/+\1,,/4#'2*1+!_1001%2	
```

## k4

```{}

```

## Q

```{}

```








































# Problem 29

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
#?,/p^/:p:2+!99	
```

## k4

```{}

```

## Q

```{}

```








































# Problem 30

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/2_&{x=+/(0$'$x)^5}'!7*9^5	
```

## k4

```{}

```

## Q

```{}

```






































# Problem 31

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
s:{+/{(y _ x),y#0}[x]'y*!_ceil(#x)%y+0.0}
e31:{*s/[(x#0),1;1 2 5 10 20 50 100 200]}
```

## k4

```{}

```

## Q

```{}

```






































# Problem 32

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/?,/,/'(!10000;!1000){r*"123456789"~{x@<x}@,/$x,y,r:x*y}/:\:'(1+!9;11+!89)	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 33

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

f:{x@&~|/’x=\:y}
g:{0$(f[$x;$y];f[$y;$x])}
check:{(1=&/#:’$a)&(b<1)&(b:x%y)=%/a:g[x;y]}
combos:{,/x,/:\:x}
v:a@&~0=(a:10 + ! 90)!10
g .’ a@&check .’ a:combos[v]
/do the remaining simplification by hand
```

## k4

```{}

```

## Q

```{}

```





































# Problem 34

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/2_&{x=+/{*/1+!x}'0$'$x}'!50000	
```

## k4

```{}

```

## Q

```{}

```






































# Problem 35

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:{&/ 2_ x!' !1+_ _sqrt x}  
q:{*/ p' 0$(1!)\ $x}  
#2_ v@&q' v:!1000000
```

## k4

```{}

```

## Q

```{}

```








































# Problem 36

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:{&{x~|x}'x@y};+/n@p[2_vsx]n:p[$:;!1e6]
```

## k4

```{}

```

## Q

```{}

```






































# Problem 37

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```





































# Problem 38

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
0$,/$*|v@&{(,/$1+!9)~a@<a:,/$x}'v:(9e3+!_1e3)*\:1 2	
```

## k4

```{}

```

## Q

```{}

```







































# Problem 39

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```






































# Problem 40

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```









































# Problem 41

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```









































# Problem 42

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
m:.:'1_'(0,1+&","=n)_",",n:*:0:`words.txt
+/{a=_ a:_sqrt 1+8*x}'+/'-64+_ic m@<(-|/#:'m)$'m
```

## k4

```{}

```

## Q

```{}

```






































# Problem 43

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```






































# Problem 44

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```






































# Problem 45

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```






































# Problem 46

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:2 3 5 7
c:{|/a=_ a:_sqrt %2%x-p}
q:{&/x!'p@&p<1+_ _sqrt x}
i:9;d:0;while[~d;if[q i;p,:i];if[~c i|i=*|p;d:1];i+:2];i-2
```

## k4

```{}

```

## Q

```{}

```








































# Problem 47

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```




































# Problem 48

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
uc:{[x;y] tO:last[x]+y;aO:tO mod 10;bO:`int$(tO-aO) % 10;(-1_x),aO,bO}/[enlist 0;];
plus:{[x;y] mO:max count @/:(x;y) ;m:uc (x,(mO-count x)#0) 
+ (y,(mO-count y)#0);?[0=last m ;-1_m;m]};
pp:{[x;y] mO:max count each rO:rO{[x;y] (y#0),x}'til count rO: y */: x;
m:uc sum {[x;y] x,(y-count x)#0}[;mO] each rO ; ?[0=last m ;-1_m;m]};
lst:{[x;y] ll:{parse x,"i"} each reverse string y;
plus[x;{[x;y]tmp:pp[x;y]; ?[10>=count tmp;tmp;10#tmp] }/[y#enlist ll]]}/[enlist[0];1+til 1000];
reverse 10#last lst
```

## k4

```{}

```

## Q

```{}

```































# Problem 49

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```









































# Problem 50

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```

## k4

```{}

```

## Q

```{}

```

