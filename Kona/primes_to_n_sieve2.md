

# Hakank's prime sieve

From [Hakank's K website](http://www.hakank.org/k/), I used a function that listed all of the primes up to `n` called `primes_to_n_sieve2`: 

```
p:{:[x<4;,2;r,1_&~|/x#'~!:'r: _f[_ _ceil _sqrt x]]}
 / or 
p:{:[x<4;,2;r,1_&~|/x#'~!:'r:_f[_-_-_sqrt x]]}
```

```
  p 15
2 3 5 7 11 13
```

First, this function is made up of an if-then control flow.

```
  \.
Assign/Amend, Functions, Control Flow
...
if[x;e1;...;en] if x then evaluate all e. if[j>i;a:1;b:2]
```

Using an even simpler example `{:[x<10;1;0]}`

```
  {:[x<10;1;0]} 8
1
  {:[x<10;1;0]} 9
1
  {:[x<10;1;0]} 10
0
  {:[x<10;1;0]} 11
0
```
If true, then the first position `1`, else `0`. This means, for `primes_to_n_sieve2`, for numbers under 4, the function (incorrectly) outputs `,2`, which we can test

```
  p 1
,2
  p 2
,2
  p 3
,2
  p 4
2 3
  p 5
2 3
  p 6
2 3 5
```

## http://www.nsl.com/k/sieves.k

From arthur whitney 22.8.1998 (http://www.kx.com/listbox/k/msg00815.html)


all x take each 1 min enum each y
```
s0:{&/x#'1&!:'y}
```
x 1's at y multiples (y times enum each ceiling x div y) get 0
```
s1:{@[x#1;y*!:'-_-x%y;:;0]}
```

/ iterate for linear space
```
s2:{(x#1){x[y*!-_-(#x)%y]:0;x}/y}

s0[10;2 3] / sieve !10 with 2 3
```

/ primes less than n with sieve s
```
p:{[s;n]:[n<4;,2;r,1_&s[n]r:_f[s]@-_-_sqrt n]}
```

sitte: double the speed by not testing even numbers:
every 3rd, fifth, seventh odd number not prime.


```
r:p[s0;32]
\t do[1000;s0[1000;r]]
\t do[1000;s1[1000;r]]
\t do[1000;s2[1000;r]]

\t p[s1;100000]
\t p[s2;100000]
```






