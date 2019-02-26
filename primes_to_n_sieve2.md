

# Hakank's prime sieve

From [Hakank's K website](http://www.hakank.org/k/), I used a function that listed all of the primes up to `n` called `primes_to_n_sieve2`: 

p:{:[x<4;,2;r,1_&~|/x#'~!:'r:_f[_-_-_sqrt x]]}

