/ readcsv:{{","\x}'0:x}
/ toInt:{(.:'x) + 0.0}
/ file:`iris.csv
/ df:readcsv file
/ dfcols:df[0]
/ df:1_ df
/ sepalL:toInt df[;0]
/ sepalW:toInt df[;1]
/ petalL:toInt df[;2]
/ petalW:toInt df[;3]
/ species:df[;4]

/ / 
/ / functions
/ / \
/ / sort:{x@<x}
/ med:{(x@<x)@_(#x)%2}
/ m:{+/x%#x}
/ m1:{+/x%((#x)-1)}  / m for n-1
/ s:{x*x}
/ std:{% m1 s(x-(m x))}

/ / min, q1, med, q3, max
/ &/ sepalW
/ q1:{({x@<x}x)[!({_(#x)%2}x)]}
/ b: q1 sepalW
/ med b / gets the first quartile
/ med sepalW
/ q3:{({x@<x}x,1)[&(!#x)>_(#x)%2]}
/ d:q3 sepalW 
/ med d
/ |/ sepalW


/ / Using these for indexing based on species strings
/ / ?species
/ / +/ (?species)[0] ~/: species
/ / & sepalL ! "setosa" ~/: species
/ / +/ "setosa" ~/: species


/ / e = 2.7182818284590452353602874713527
/ sig:{1%(1+_exp(-x))}
/ z:((!13)+1)-7
/ / sig z
/ / 0.0025 0.0067 0.018 0.0474 0.1192 0.2689 0.5 0.7311 0.8808 0.9526 0.982 0.9933 0.9975



/ / ##########################################################
/ / replacing R with K

/ / read_csv()
/ readcsv:{{","\x}'0:x}
/ file:`iris.csv
/ df:readcsv file
/ toInt:{(.:'x) + 0.0}
/ file:`iris.csv
/ df:readcsv file
/ dfcols:`$df[0]
/ df:1_ df
/ sepalL:toInt df[;0]
/ sepalW:toInt df[;1]
/ petalL:toInt df[;2]
/ petalW:toInt df[;3]
/ species:`$df[;4]

/ / unique()
/ ?species

/ / colnames()
/ dfcols

/ / cbind()
/ df1:(+(5 150 # (sepalL,sepalW,petalL,petalW,species)))


/ / dim()
/ ^df

/ / read in columns and automatically know what type it is


/ / df1$petal_length
/ df1[;{*& x ~/: dfcols} `petal_length]

/ / df1$species
/ df1[;{*& x ~/: dfcols} `species]

/ / mean df1$petal_length
/ m df1[;{*& x ~/: dfcols} `petal_length]


















/ #######################################################################
/ File functions for general k (so that the code works in k6)
/ readcsv:{{","\x}'0:x}
/ file:`iris.csv
/ df:readcsv file
/ toInt:{(.:'x) + 0.0}
/ dfcols[`$df[0]]:!(*^df[1])
/ df:1_ df
/ df:+ 5 150 # (toInt df[;0]),(toInt df[;1]),(toInt df[;2]),(toInt df[;3]),`$df[;4]


/ Kona-specific creating of dataframes
df:("FFFFS";,",")0:`iris.csv
dfcols[df[0]]:!(*^df[1])
df:+*1_ df


/ dataframe processing functions
select:{[x;y;z]x[;y[z]]}


/ Stats functions
sort:{x@<x}
q1:{({x@<x}x)[!({_(#x)%2}x)]}
med:{(x@<x)@_(#x)%2}
q3:{({x@<x}x,1)[&(!#x)>_(#x)%2]}
am:{(+/(x+0.0))%#x}
m1:{+/x%((#x)-1)}  / m for n-1
s:{x*x}
std:{% m1 s(x-(m x))}


/ Obtaining summary statistics for a variable
/ min, q1, med, q3, max
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


/ unique()
?select[df;dfcols;`species]


/ dim()
^df


/ Find the sum of the first column where species = setosa
+/df[& `setosa ~/: select[df;dfcols;`species]][;0]
/ or +/df[& `setosa ~/: df[;4]][;0] if you remember the col number


/ Rename a column (remove and add)
dfcols:{[d;e] .+(k;d[k:(!d) _dv e])}[dfcols;`sepal_width]
dfcols[`SePalW]:1
dfcols:{[d;e] .+(k;d[k:(!d) _dv e])}[dfcols;`SePalW]
dfcols[`sepal_width]:1


/ head(df,5)
df[!5]


/ df[sample(nrow(df),5),]
5 ? df









