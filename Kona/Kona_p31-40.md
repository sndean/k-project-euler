



# Problem 31

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
s:{+/{(y _ x),y#0}[x]'y*!_ceil(#x)%y+0.0}
e31:{*s/[(x#0),1;1 2 5 10 20 50 100 200]}
```







































# Problem 32

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/?,/,/'(!10000;!1000){r*"123456789"~{x@<x}@,/$x,y,r:x*y}/:\:'(1+!9;11+!89)	
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






































# Problem 34

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
+/2_&{x=+/{*/1+!x}'0$'$x}'!50000	
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








































# Problem 36

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
p:{&{x~|x}'x@y};+/n@p[2_vsx]n:p[$:;!1e6]
```








































# Problem 37

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
```






































# Problem 38

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
0$,/$*|v@&{(,/$1+!9)~a@<a:,/$x}'v:(9e3+!_1e3)*\:1 2	
```






































# Problem 39

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona


r is all permutations
f eliminates tuples with 0
t is all triangles
a is all triangles grouped by perimeter
take the first perimiter ordered by count of triangles

```{}
abc:{c:_sqrt(x^2)+y^2;x,y,:[c=(_ c);_ c;0]}
{**a[>#:'a:t[&~1=#:'t:{f:r[&3=+/'~0='r:{abc/',/x,/:\:x}x;];{x,f[&{x=+/y}[x]'f]}'x}x]]}(!1000)
```






































# Problem 40

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
*/0$'{r:&x=x&g:+\#:'c:$1+!1e7;i:*c[r];i[((#i)-1)-*g[r]-x]}'1,*\6#10
```


