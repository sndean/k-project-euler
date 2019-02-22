



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


