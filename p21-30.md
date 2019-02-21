



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







