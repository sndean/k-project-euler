





# Problem 41

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
```










































# Problem 42

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
m:.:'1_'(0,1+&","=n)_",",n:*:0:`words.txt
+/{a=_ a:_sqrt 1+8*x}'+/'-64+_ic m@<(-|/#:'m)$'m
```






































# Problem 43

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
```








































# Problem 44

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
```






































# Problem 45

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

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









































# Problem 47

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
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






























# Problem 49

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}
?
```










































# Problem 50

> The prime factors of 13195 are 5, 7, 13 and 29.

> What is the largest prime factor of the number 600851475143 ?


## Kona

```{}

```
