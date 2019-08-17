# Project Euler 100 in K

***

*WARNING - This contains answers to [Project Euler problems](https://projecteuler.net/)).*


***

Solutions **and explanations** to the first 100 Project Euler problems in K (Kona (a K3/K4 dialect), and the K6 dialect and K4 whenever I can).


#### Kona

Kona can be downloaded [here](https://github.com/kevinlawler/kona). Kona is an open source implementation of K, specifically tries to emulate K3, but includes some aspects of K4.

    git clone https://github.com/kevinlawler/kona.git
    cd kona
    make

    rlwrap -r /Users/snd/kona/k
    kona      \ for help. \\ to exit.

      +/1 2 3
    6


#### K6

K6 can be downloaded by asking the language's author nicely for the binary.

    chmod +x k
    rlwrap -r noah /Users/snd/k
    2016.08.09 (c) arthur whitney
     +/1 2 3
    6


#### K4

K4 comes with the download obtainable from the [Kx website](https://kx.com/download/).

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

(Note that you can access K4 from Q by doing a `\`)


***

I'm posting answers here not because it's valuable for me to have a place to post answers themselves, but because it's valuable to coherently write out the descriptions of the solutions, which I'll try to do for every problem. Beyond this, I figure K programming languages are obscure enough for it to be unlikely that anyone would stumble upon this and have unwanted exposure to to answers (it would seem different to me if this were "Project Euler with Python"). Some of the code comes from Kona's Project Euler [page](https://github.com/kevinlawler/kona/wiki/Project-Euler-Code-Golf), ngn's gitlab [page](https://github.com/ngn/k), and Hakank's K/Kona [page](http://www.hakank.org/k/). As far as I can tell, the K4 and Q solutions are more or less absent from the interwebs. I've attempted to expand and improve on all of the solutions and explain how they work in terms of Kona, K6, and K4. ngn's work is probably closest to working with Whitney's K6 binary, but most of it doesn't. 










***










# Problem 1

> If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

> Find the sum of all the multiples of 3 or 5 below 1000.








## Kona

First, find the modulus for the list of numbers < 10

```
  !10
0 1 2 3 4 5 6 7 8 9
```

This is possibly immediately confusing since this uses both the monadic and dyadic `!`, enumerating numbers under 10, then finding the `mod` of those numbers (e.g., where `5!3` yields `2`). 

```{}
  (!10)!3
0 1 2 0 1 2 0 1 2 0
```



Next, take the numbers that multiples, (`mod` = 0):

```{}
  ~(!10)!/3
1 0 0 1 0 0 1 0 0 1
```

Finally take those ones, map (`&`) them to the location in `!10`, and sum (`+/`):

```{}
  &~(!10)!/3
0 3 6 9

  +/&~(!10)!/3
18
```

All that's left is the requirement to include 5 and then expand from `!10` to `!1000`. For this we have to go back a few steps to add each (`:`).

```{}
  (!10)!/:3 5
(0 1 2 0 1 2 0 1 2 0
 0 1 2 3 4 0 1 2 3 4)
```

Then make the output binary

```
  ~(!10)!/:3 5
(1 0 0 1 0 0 1 0 0 1
 1 0 0 0 0 1 0 0 0 0)
 ```

Combine, and then where `&` and then, again sum `+/`

 ```

  ~&/(!10)!/:3 5
1 0 0 1 0 1 1 0 0 1

  &~&/(!10)!/:3 5
0 3 5 6 9

  +/&~&/(!10)!/:3 5
23
```

Now with `!1000`

```{}
  +/&~&/(!1000)!/:3 5
233168
```

Or with `1e3`

```
  +/&~&/(!1e3)!/:3 5
233168
```







## K4

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





## K6
```
+/&|/~5 3!\:!1000
```

















