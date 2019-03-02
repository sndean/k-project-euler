

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






