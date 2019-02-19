
/ 

readcsv:{{","\x}'0:x}
df:readcsv`irisNAs.csv
dfcols[`$df[0]]:!(*^df[1])
df:1_ df
df: + (|^df) # (.:'(,/{df[;x]}' 0 1 2 3)),`$df[;4]



select:{[x;y;z]x[;y[z]]}
removeThis:(`,_n,`setosa`,1.9,1.8,`virginica,1.1,1.2,1.3,1.4,1.5)
remove:{[g;d]d[{&(#x)=+/x}::{(*^d[1])=d?\:x}' g]}
remove[g:removeThis;d:df]



sepalL:select[df;dfcols;`sepal_length]
sepalW:select[df;dfcols;`sepal_width]
petalL:select[df;dfcols;`petal_length]
petalW:select[df;dfcols;`petal_width]
species:select[df;dfcols;`species]
replacement:am sepalL[&~sepalL ~\: _n]
sepalL[& sepalL ~\: _n]:replacement 
df1:(+(5 150 # (sepalL,sepalW,petalL,petalW,species)))



readcsv:{{","\x}'0:x}
df:readcsv`irisNAs.csv
dfcols[`$df[0]]:!(*^df[1])
df:1_ df
df: + (|^df) # (.:'(,/{df[;x]}' 0 1 2 3)),`$df[;4]
removeThis:(`,_n)
remove:{[g;d]d[{&(#x)=+/x}::{(*^d[1])=d?\:x}' g]}
df:remove[g:removeThis;d:df]



sort:{x@<x}
q1:{({x@<x}x)[!({_(#x)%2}x)]}
med:{(x@<x)@_(#x)%2}
q3:{({x@<x}x,1)[&(!#x)>_(#x)%2]}
/ am:{(+/(x))%#x}
am:{(+/(x+0.0))%#x}
m1:{+/x%((#x)-1)}  / m for n-1
s:{x*x}
std:{% m1 s(x-(m x))}


/ min, q1, med, mean, q3, max
summary:{do[1; t::.();
               t[`Minimum]::(&/ x);
               t[`FirstQuartile]::(med q1 x);
               t[`Median]::(med x);
               t[`Mean]::(am x);
               t[`ThirdQuartile]::(med q3 x);
               t[`Maximum]::(|/ x);
           ]
         }
summary select[df;dfcols;`sepal_width]
