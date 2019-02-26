/001
+/&|/~5 3!\:!1000

/002
+/(~2!)#*+-1_(*4000000>)(|+\)\!2

/003
\l 0.k
n:600851475143
p:primes 2+_%n
|/p@&~p!'n

/004
|/.'{x~|x}#$,/a*\:a:100_!1000

/005
\l 0.k
lcm:{(-gcd[x;y])!x*y}
lcm/1+!20

/006
(s*s:+/i)-+/i*i:1+!100

/007
\l 0.k
primes[200000]10000

/008
|/*/(-|i)_'(i:!13)_\:a:.',/0:"p008.txt"

/009
|/*/(ab,,c)@\:&(+/ab*ab)=c*c:1000-+/ab:!2#1000

/010
\l 0.k
+/primes 2000000

/011
a:.''" "\'0:"p011.txt"
u:&'!#a
|/,//*/''4''(a;+a;u,'a,'|u;(|u),'a,'u)

/012
\l 0.k
n:100000
a:{@[&n;q*!'(-q:-1_(n>)(x*)\x)!'n;+;1]}'primes 2+_%n
a,:,~+/a
a[0]:0|-1+*a
d:*/1++':'a
d[!2]:1
-2!i*-1+i:*&d>500

/013
\l 0.k
small 10#add/(0:"p013.txt")-"0"

/014
n:1000000
c:@[&n;1;:;1] /cached collatz chain lengths
f:{$[v:0|c x;:v;]
   v:$[2!x;2+o@2+3*-2!x;1+o@-2!x] /if x is odd, take two steps at a time
   $[x<n;c[x]:v;v]}
*&r=|/r:f'@[!n;0;:;1]

/015
n:20;*|n(+\)/1,n#1

/016
\l 0.k
+/1000{add[x;x]}/big 1

/017
d:#"OneTwoThreeFourFiveSixSevenEightNine"
+/(100*d
   9*100*#"Hundred"
   9*99*#"And"
   10*+/(d
         #"TenElevenTwelveThirteenFourteenFifteenSixteenSeventeenEighteenNineteen"
         10*#"TwentyThirtyFortyFiftySixtySeventyEightyNinety"
         8*d)
   #"OneThousand")

/018
*{y+1_|':x}/|.''" "\'0:"p018.txt"

/019
m:31 28 31 30 31 30 31 31 30 31 30 31
+/6=7!(+/m)+\0,-1_,/100#(3#,m),,@[m;1;+;1]

/020
\l 0.k
+/mul/big'1+!100

/021
\l 0.k
n:10000
i:!n
s:sigma1[n]-i
+/&(i=s s)>i=s

/022
+/,/(1+!#a)*a@<a:(1-"A")+.'","\1:"p022_names.txt"

/023
\l 0.k
n:1+28123
a:&sigma1[n]>2*!n /abundant numbers
+/&@[n#1;a*n>a+:,\a;:;0]

/024
a:!10;.,/${a^:r:a x;r}'(-!-10)\1000000-1

/025
\l 0.k
#{1000>#*x}{add\|x}\big'1 1

/026
1+*>r:{m::x;(#a)-1+a?l:*|a:{l&2>+/x=l:*|x}{x,m!10**|x}/,1}'1+!1000

/027
\l 0.k
maxp:20000
sieve:@[&maxp;primes maxp;:;1]
ab:{x@'!#'x}(-1000+!2001;primes 1000)
{i:&1=sieve@v:(x*x)+(x*ab 0)+ab 1;$[maxp<|/v;ERR;~#i;:x];ab::ab@\:i;x+1}/1;
**/ab

/028
n:1001
+/+\1,/4#'2*1+!-2!n

/029
\l 0.k
n:100
i:big'2+!n-1
#?,/1_(n-1){i mul'x}\i

/030
p:*/5#,!10
s:+/p@!6#10
-1+/&s=!#s

/031
a:1,&200;1 2 5 10 20 50 100 200{a[y]+:0|a[y-x];}/:\:!#a;*|a

/032
\l 0.k
a:,'/10/''(0 2 5;0 1 5)_\:1+prm 9 /x*yyyy=zzzz or xx*yyy=zzzz
+/?*|a@\:&a[2]=*/2#a

/033
\l 0.k
frac:{(-gcd/x)!x} /lowest terms
r:{(</x)&~=/x}#?,/{a@&(&/'a>9)&(frac x 1 2)~/:frac'a:10/''x((0 1;0 2);(0 1;2 0);(1 0;0 2);(1 0;0 2))}'+!3#10
*|frac@*/r

/034
f:1,*\1+!9
a:!6#10
+/3_&(!#*a)=(+/f a)-+/&\~a

/035
\l 0.k
2+#{x^x^{.,/|0 1_$x}'x}/{~|/^"1379"?$x}#primes 1000000 /+2 because 2 and 5 don't match /[1379]+/

/036
+/&{(a~|a:2\x)&a~|a:10\x}'!1000000

/037
\l 0.k
+/(7<)#{&/isprime'.'|',\|$x}#,/{isprime#,/(!10)+/:10*x}\2 3 5 7

/038
i:!10000
a:,/,'\$8(i+)\i
d:,/$1+!9
|/.'{d~x@<x}#{9=#x}#a

/039
\l 0.k
/primitive triples: a=m^2-n^2 b=2mn c=m^2+n^2 P=2m(m+n) where gcd(m,n)=1 and m>n>0
l:1000
mn:1+|cmb[2;l]
P:2*/+\mn
i:&P<l+1;P@:i;mn:mn@\:i
P@:&1=gcd'/mn
*>#'=,/P*1+!'(-P)!'l

/040
*/.'(,/$!1000000)@6(10*)\1

/041
\l 0.k
mp:_%10000
p:primes mp
isprime:{$[|/~2 3 5 7!'x;0;x<mp;~^p?x;~|/~p!'x]}
|/,/{isprime#10/1+prm x}'4 7 /digit sum of other pandigitals is divisible by 3

/042
a:+/'(1-"A")+1_'-1_'","\1:"p042_words.txt"
t:{-2!x*1+x}@!1+-2!*|/a
+/~^t?a

/043
\l 0.k
+/10/p@\:&~+/primes[18]!'10/'3'1_p:prm 10

/044
\l 0.k
p:gon[5;1+!3000]
h:@[&1+*|p;p;:;1]
p@*&0<+/'&/0|h(p+\:p;p+\:2*p)

/045
\l 0.k
a:3 5 6  gon\:!1000000
i:&#a
3{i+:1;{~x}{v:a@'i;$[&/v=*v;:*v;];i[*<v]+:1;0}/0}/0

/046
\l 0.k
n:10000
p:primes n
s:2*/2#,!1+_%-2!n
*1_&@[(n+1)#0 1;(n&s+\:p;p);:;0]

/047
\l 0.k
n:1000000
k:4
p:primes 2+_%n
omega:(&n){x[y*!(-y)!-1+#x]+:1;x}/p /number of prime factors (or 0 for primes larger than sqrt n)
*1-k-&(k-1)&':/k=omega

/048
n:1000;m:10000000000;h:_%m
sqr:{a:(-h)!x;b:h!x;m!b*b+2*h*a}
pow:{m!$[2!y;x;1]*$[y>1;m!sqr o[x;-2!y];1]}
m!+/{pow[x;x]}'1+!n

/049
\l 0.k
p:(999<)#primes 10000
triples:{(+i)@&&/-1>':i:!3#x}
r:{=/1_-':x}#,/{x@triples@#x}'{2<#x}#p@.={x@<x}'$p
.,/$*r^,1487 4817 8147

/050
\l 0.k
n:1000000
p:primes n
a:!0
b:-1_p
{x}{b+:(#b)#x_p;b::(n>)#b;a,:b;$[#b;x+1;0]}/1;
sieve:@[&n;p;:;1]
*|{0|sieve x}#a

/051
\l 0.k
n:1000000
p:primes n
h:@[n#0x00;p;:;0x01] /sieve
f:{a:10\x
   m:1_'-1_'!(#a)#2              /all patterns except "no stars" and "all stars"
   b:(10/m*a) +/: 10/'(~m)*/:!10 /numbers to test for primality
   b[0;!-2!#*b]:0                /no leading zeroes
   &/c@&h c:,/b@\:&7<+/h b}      /min of the primes from 8+ families
&/f'p

/052
{x+1<#?{x@<x}'$2 3 4 5 6*x}/1

/053
m:1000001
+/m=,/100{m&(0,x)+x,0}\1

/054
p:{x:("CDHS";"23456789TJQKA")?'|+x
   s:x 0;r:x 1       /s:suits r:ranks
   f:1=#?s           /flush?
   g:~#((!5)+&/r)^r  /straight?
   d:10/{x@>x}@#'=r  /rank distribution
   v:+/|\(f&g;d=41;d=32;f;g;d=311;d=221;d=2111;1) /9=StraightFlush(orRoyal) 8=FourOfAKind etc, 1=HighCard
   h:r@>r+13*+/r=\:r /ranks grouped and ordered by multiplicity
   100/v,h}
+/{>/p'0 5_" "\x}'0:"p054_poker.txt"

/055
\l 0.k
lychrel:{y:add[y;|y];$[y~|y;0;x;o[x-1;y];1]}
+/50 lychrel'big'1+!-1+10000

/056
\l 0.k
|/+/',/mul'\99#,big'1+!99

/057
\l 0.k
+/>/'#''1000{s:add/x;(add[s;x 1];s)}\big'1 1

/058
\l 0.k
c:1;n:0 /c:corner values, n:number of primes on diagonals so far
1+2*{c+:2 4 6+8*x;n+:+/isprime'c;x+(10*n)>4*x}/0 /x:current layer; side is 1+2*x; number of values on diagonals is 1+4*x

/059
f:8167 1492 2782 4253 12702 2228 2015 6094 6966 153 772 4025 2406 6749 7507 1929 95 5987 6327 9056 2758 978 2360 150 1974 74 /a-z frequencies
F:@[&256;"aA"+\:!#f;:;2#,f]        /0x00-0xff frequencies
c:(8#2)\.'","\*0:"p059_cipher.txt" /ciphertext in binary
a:{2/~c=(#*c)#'(8#2)\x}'"a"++!3#26 /all possible plaintexts
p:*`c$a@&{x=|/x}@+/'F a            /best plaintext by sum-of-frequencies score
+/p

/060
\l 0.k
k:5
a:.''{$[~isprime@.,/x;0;isprime@.,/|x]}#sp@+{x@\:&</x}@!2##sp:$1_primes 10000
h:(a@'1)@=*'a
&/+/'(k-2){,/x,/:'{x^x^y}/'h x}/a

/061
\l 0.k
a:{@[100#,!0;-100!x;,;100!x]}'(999<)#/:(10000>)#/:(3+!6)gon\:1+!140
r:|*,/{(,x),/:&0|/'(!100)=,//'@/a@5,x}'+prm 5
101*+/r[0]{*y@x}\|a 5,r 1

/062
a*a*a:**{5=#x}#.={x@<x}'($a*a*a:!10000)-"0"

/063
\l 0.k
i:big'1+!9
a:#''30{i mul'x}\(#i)#,big 1
+//a=!#a

/064
\l 0.k
+/~2!#'cfsqrt'!10000

/065
\l 0.k
n:1+100
c:n#2,/+(1;2*1+!n;1)
+/*(big'0 1){(add[x 1;mul[*x;y]];*x)}/|big'c

/066
\l 0.k
pell:{a0:_%x;$[x=a0*a0;:,0;]
      c:-1_*|+{[a0;x] ~(2*a0)=x 2}[a0]({[N;a0;m;d;a] m:(d*a)-m;d:(-d)!N-m*m;a:(-d)!a0+m;m,d,a}[x;a0].)\0 1,a0 /cfrac sqrt
      r:*|(big'0 1){(x 1;add[*x;mul[y;x 1]])}/|big'c
      $[2!#c;add[big 1;add/2#,mul/2#,r];r]}
*&a~\:max/a:pell'!1+1000

/067
*{y+1_|':x}/|.''" "\'0:"p067_triangle.txt"

/068
\l 0.k
n:5
i:(2*n)!0 1 3+\:2*!n
j:,/+i
l:*/16#10
r:prm 2*n
|/(l>)#{.,/$x j}'{1=#?+/x i}#+1+r@\:&&/(*r)</:r@2+2*!n-1

/069
\l 0.k
n:1000000
*&a=|/a:(-totients n)!'1000*!n

/070
\l 0.k
phi:totients@*/N:7#10
t:9(10*)\1
a:+/t@10\phi
b:+/t@!N
n:2_&a=b
*{$[</x*|y;x;y]}/n,'phi n /min of rationals

/071
d:1+!1000000
n:-7!-1+3*d
max:{$[(x[0]*y[1])>x[1]*y[0];x;y]} /for rationals
*max/+(n;d)

/072
\l 0.k
-1+/totients 1+1000000

/073
\l 0.k
n:12000
p:primes n
t:~(n+1)#'~!'p
+/{a:-3!x+2;b:1+-2!x;+/*/a_'b#'t@&~p!'x}'4+!-3+n

/074
f:*\1|!10
a:+/(|\0<d)*f d:!3,6#10
+/60=1000000#{x&61&1+x a}/@[(#a)#61;169 363601 1454 871 45361 872 45362;:;3 3 3 2 2 2 2]

/075
\l 0.k
M:1500000 /max perimeter
c:&1+M    /counters
{x@:<x;L:+/x;$[L>M;:0;];c[L*!1+(-L)!M]+:1
 o'+/((  1 2 2;- 1 2 2;1 2 2)
      (- 2 1 2;  2 1 2;2 1 2)
      (  2 2 3;  2 2 3;2 2 3))*x;}3 4 5
c[0]:0
+/1=c

/076
-1+*|*|100{(-1_x),,+\+/x*|=#x:(x,'*|+x),0}/,,1

/077
\l 0.k
n:100
p:primes n
a:~!n
{[p] {[p;i] a[i+p]+:a[i];}[p]'!0|n-p;}'p;
*&5000<a

/078
\l 0.k
/using the "pentagonal" recurrence relation from
/https://en.wikipedia.org/wiki/Partition_function_(number_theory)#Recurrence_relations
/p(n) = sum (-1)^(k+1) * p(n-k(3k+1)/2),  -(sqrt(24n+1)-1)/6<=k<=(sqrt(24n+1)+1)/6, k!=0
p:1 1
{r:_%1+24*x
 ke:-6!(1-r;1+r)   /endpoints of k range
 k:ke[0]+!1--/ke
 s:(#k)#-1 1@2!2#k /signs 1 or -1
 p,:pn:1000000!+/s*0|p x-gon[5;k]
 x+0<pn}/2

/079
a:?.''0:"p079_keylog.txt"
d:?,/a /there are 8 distinct digits in all attempts, so let's try 8-digit codes first
e:?,/2''a /edges of a graph
10/|{?x,d@&~+/'d=\:*'{2=#x}#e^\:x}/!0 /topological sorting, and the code turns out to be only 8 digits

/080
\l 0.k
+/{$[x=r*r:_%x;0;+/100#sqrt@(10\x),&200]}'1+!100

/081
a:.''","\'0:"p081_matrix.txt"
m:-2!0W
*|*|{x&a+(m,'-1_'x)&m,-1_x}/+\+\'a

/082
a:.''","\'0:"p082_matrix.txt"
m:-2!0W
&/*|+{x&a+(1_x,m)&(m,-1_x)&m,'-1_'x}/+\'a

/083
a:.''","\'0:"p083_matrix.txt"
m:-2!0W
*|*|{x&a+&/(m,-1_x;1_x,m;m,'-1_'x;1_'x,'m)}/+\+\'a

/084
n:100000 /number of moves to simulate
jmps:0 10 11 24 39 5 /GO,JAIL,C1,E3,H2,R1
c:&40;p:0;m:0 /c:counters, p:position, m:consecutive doubles
f:{c[p]+:1;d:1+2?4;m+:1;m*:=/d;p::(#c)!p+/d
   $[(p=30)|m>2;p::10                    /if on G2J, or got 3 consecutive doubles, go to JAIL
     ~^2 17 33?p;$[2>r:*1?16;p::jmps r;] /if on CC1 or CC2 or CC3, possibly go to GO or JAIL
     ~^i:7 22 36?p                       /if on CH1 or CH2 or CH3, go ...
     p::$[6>r:*1?16;jmps r               / to the corresponding square from jmps
          8>r;15 25 5 @i                 / to next R (railway company) - R1 or R2 or R3
          8=r;12 28 12@i                 / to next U (utility company) - U1 or U2 or U1(again)
          9=r;(#c)!p-3                   / back 3 squares
          p]];}
n f/0;
100/3#>c

/085
i:!2000
t:-2!i*1+i
a|:-a:2000000-t*\:t
*/2#,/&'a=&/&/a

/086
l:2;c:0 /c:counter
{c<1000000}{l+:1;{r:_%a:(x*x)+l*l;c+:$[~a=r*r;0;x>l;1+l--2!1+x;-2!x];}'3_!1+2*l}/0;
l

/087
\l 0.k
n:50000000
p:primes 1+_%n
a:(n>)#p*p
b:(n>)#a*(#a)#p
c:(n>)#b*(#b)#p
bc:(n>)#,/b+\:c
s:(n>)#,/a+/:bc
+/@[&n;s;:;1]

/088
L:12000
a:,/{,/x,/:'(*'|'x)_'!'1+(-*/'x)!'2*L}\,'2_!2*L /all factorisations up to 2L
k:{(#x)+(*/x)-+/x}'a
+/?2_@[0,L#0W;k*k<L+1;&;*/'a]

/089
r:(,(!10)#'"M"),("CDM";"XLC";"IVX")@\:(!0;0;0 0;0 0 0;0 1;1;1 0;1 0 0;1 0 0 0;0 2)
+/{(#x)-#,/r@'(4#10)\+/a*1-2*<':a:1 5 10 50 100 500 1000"IVXLCDM"?|x}'0:"p089_roman.txt"

/090
\l 0.k
r69:{x+3*x=6}
sq:+r69@10\{x*x}@1+!9
c:+r69@cmb[6;10]
c2:+c@cmb[2;#c]
#c2@&{&/|/(&/'|/''sq=\: x
           &/'|/''sq=\:|x)}'c2

/091
n:1+50
pq:!4#n
p:2#pq
q:2_pq
a2:+/*/2#,p
b2:+/*/2#,p-q
c2:+/*/2#,q
r:+/(c2=a2+b2)&/(a2;b2;c2)>0 /right angle at p
r+*/2#n-1                    /right angle at origin

/092
m:1000
u:{$[x<2;0;x=89;1;o@+/a*a:.'$x]}'!m
p:&'q*q:!10
+/u*7{+/m#'p,\:x}/1,&m-1

/093
\l 0.k
R:{$[1<*|x;(-gcd/x)!x;x]} /rational
ops:({(+/x*|y;*|x*y)}     /+
     {(-/x*|y;*|x*y)}     /-
     *                    /*
     {x*|$[0>*y;-y;y]})   /div
bkt:{a:x 0;b:x 1;c:x 2;d:x 3;f:y 0;g:y 1;h:y 2 /all bracket placements over 4 values x and 3 functions y
     fab:f[a;b];fbc:f[b;c]
     R'(h[g[fab;c];d]
        h[g[a;fbc];d]
        h[fab;g[c;d]]
        h[a;g[fbc;d]]
        h[a;g[b;f[c;d]]])}
howfar:{+/&\@[~!100;{(99&0|*x)*x[1]=1}@+,/,/(x@+prm 4)bkt/:\:ops@+!3##ops;:;1]}
10/*c@&v=|/v:howfar'((!10),'1)c:+cmb[4;10]

/094
/sides: (a+d;a;a) where d=1 or d=-1
/p=(3a+d)/2, S^2=p(p-a+d)(p-a)^2, a=2b+1
/S^2=(3b+2)b(b+1)^2  or  S^2=(3b+1)b^2(b+1)
/(3b+1)^2-3m^2=1     or  (3b+2)^2-3m^2=1, solve as pell equations
l:1+-2!*/9#10
s:0
{l>*x}{x:(+/2 3*x;+/1 2*x);a:1+2*-3!*x;P:(3*a)+0N -1 1@3!*x;s+:P*P<l;x}/2 1;
s

/095
\l 0.k
n:1000000
a:sigma1[n]-!n
A:(a;a a)
&/,/c@&l=|/l:#'c:(a@)\'?*(~~/){A@'x}/A

/096
a:.'',/'1_'"\n"\'1_"G"\1:"p096_sudoku.txt"
p,:,3/-3!p:!9 9
s:{*(,x)(,/{{@[x;y;:;z]}[x;y]'(1+!9)^x@&|/p=p@'y}')/&~x}
+/10/'3#'s'a

/097
\l 0.k
mod:{(- 10&#x)#x}
sqr:{mod mul[x;x]}
prd:{mod mul[x;y]}/
pow:{prd@((-1+#e)sqr\x)@&e:|2\y}
small mod add[big 1;mul[big 28433;pow[big 2;7830457]]] /28433*(2^7830457)+1 mod 10^10

/098
\l 0.k
pairs:{,/{x@+c,'|c:cmb[2;#x]}'{1<#x}#x@.={x@<x}'x}
a:pairs@1_'-1_'","\1:"p098_words.txt"
m:|/#'*'a /max length
b:pairs@${x*x}@!1+_%*/m#10
enc:{m/,/(*x)?/:x}
|/.',/b@&~^(?enc'a)?enc'b

/099
\l 0.k
d:10 /digits of precision
fp:{x:big x;(#x;d#x,&d)}
fmul:{r:mul[x 1;y 1];$[4<r d;r:carry@@[r;d-1;+;1];];(x[0]+y[0]+(#r)-2*d;d#r)}
fpow:{fmul/((-1+#e){fmul[x;x]}\fp x)@&e:|2\y}
1+*&r~\:r@*>r:fpow/'.'0:"p099_base_exp.txt"

/100
\l 0.k
/k(k-1)/n(n-1)=1/2, x=2n-1, y=2k-1, x^2-2v^2=-1
r:{1000000000001>-2!1+*x}{2(+/(1 1;2 1)*)/x}/1 1 /start with x=y=1; while n<=10^12, produce a new solution twice
-2!1+r[1] /k
