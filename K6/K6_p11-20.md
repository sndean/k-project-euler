


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










