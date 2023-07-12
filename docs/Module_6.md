
# Module 6 {-} 

&nbsp;

## Tidyverse Family of Packages {-}

The **_data frame_** is a key data structure in statistics and in R. The basic structure of a data frame is that there is one observation per row and each column represents a variable, a measure, feature, or characteristic of that observation. Before you can conduct any analyses or draw any conclusions, you often need to reorganize your data. The **Tidyverse** is a collection of R packages (developed by RStudio’s chief scientist Hadley Wickham) that provides an efficient, fast, and well-documented workflow for general data modeling, wrangling, and visualization tasks.


The Tidyverse introduces a set of useful data analysis packages to help streamline your work in R. In particular, the Tidyverse was designed to address the top three common issues that arise when dealing with data analysis in  base R: (1) Results obtained from a base R function often depend on the type of data being used; (2) When R expressions are used in a non-standard way, they can confuse beginners; (3) Hidden arguments often have various default operations that beginners are unaware of.


The core Tidyverse includes the packages that you’re likely to use in everyday data analyses. 

* `ggplot2` - ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics. You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

* `dplyr` - dplyr provides a grammar of data manipulation, providing a consistent set of verbs that solve the most common data manipulation challenges.

* `tidyr` - tidyr provides a set of functions that help you get to tidy data. Tidy data is data with a consistent form: in brief, every variable goes in a column, and every column is a variable.

* `readr` - readr provides a fast and friendly way to read rectangular data (like csv, tsv, and fwf). It is designed to flexibly parse many types of data found in the wild, while still cleanly failing when data unexpectedly changes.

* `purrr` - purrr enhances R’s functional programming (FP) toolkit by providing a complete and consistent set of tools for working with functions and vectors. Once you master the basic concepts, purrr allows you to replace many for loops with code that is easier to write and more expressive. 

* `tibble` - tibble is a modern re-imagining of the data frame, keeping what time has proven to be effective, and throwing out what it has not. Tibbles are data.frames that are lazy and surly: they do less and complain more forcing you to confront problems earlier, typically leading to cleaner, more expressive code. 

* `stringr` - stringr provides a cohesive set of functions designed to make working with strings as easy as possible. It is built on top of stringi, which uses the ICU C library to provide fast, correct implementations of common string manipulations.

* `forcats` - forcats provides a suite of useful tools that solve common problems with factors. R uses factors to handle categorical variables, variables that have a fixed and known set of possible values.


The Tidyverse also includes many other packages with more specialized usage. They are not loaded automatically with Tidyverse, so you'll need to load each one with its own call.


To install the Tidyverse packages run the following code in the console:


```r

install.packages("tidyverse")

```


Now the Tidyverse is available in R, but it is not activated yet. Whenever you start a new R session and plan to use the Tidyverse packages, you will need to activate the package by calling the `library(tidyverse)` function in the console:


```r

library(tidyverse)
#> ── Attaching packages ─────────────────── tidyverse 1.3.2 ──
#> ✔ ggplot2 3.3.6      ✔ purrr   0.3.5 
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
#> ✔ readr   2.1.3      ✔ forcats 0.5.2 
#> ── Conflicts ────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```


We will start learning the Tidyverse family of packages by introducing the `dplyr` package.


We will be working with a `nyc_flights` data set that provides information about flights departed New York City in 2013 (the data set is available on Courseworks). It contains 336 776 observations (rows) and 19 variables (columns). Let's import this data set into R: 



```r

flights <- read.csv(file = "C:/Users/alexp/OneDrive/Desktop/R Bootcamp/R_bootcamp/nyc_flights.csv", header = T)
```

Let's convert our data frame into a `tibble` data frame (don't worry about this function; we use it in this module just for a better representation of results):


```r

flights <- as_tibble(flights)
```


&nbsp;


## dplyr Package {-}

As mentioned earlier, `dplyr` provides a grammar of data manipulation, providing a consistent set of verbs that solve the most common data manipulation challenges such as selecting important variables, filtering out key observations, creating new variables, computing summaries, and so on. 


In this module you are going to learn the key dplyr functions that allow you to solve the vast majority of your data manipulation challenges. All of the functions that we will discuss have a few common characteristics. In particular,

* The first argument is a data frame

* The subsequent arguments describe what to do with the data frame specified in the first argument, and you can refer to columns in the data frame directly without using the $ operator (just use the column names)

* The return result of a function is a new data frame


dplyr aims to provide a function for each basic verb of data manipulation. These verbs can be organised into three categories based on the component of the data set that they work with:

* Rows:

  * `filter()` - chooses rows based on column values
  * `slice()` - chooses rows based on location
  * `arrange()` -  changes the order of the rows
  
* Columns:

  * `select()` - changes whether or not a column is included
  * `rename()` - changes the name of columns
  * `mutate()` - changes the values of columns and creates new columns
  * `relocate()` - changes the order of the columns
  
* Groups of rows:

  * `group_by()` - changes the scope of each function from operating on the entire data set to operating on it group-by-group
  * `summarize()` - collapses a group into a single row
  


### filter() Function {-}

`filter()` allows you to subset observations based on their values. The first argument is the name of the data frame, the second and subsequent arguments are the expressions that filter the data frame. For instance, let's select all flights on January 1st:



```r

filter(flights, month == 1, day == 1)
#> # A tibble: 842 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     517     515       2     830     819
#>  2  2013     1     1     533     529       4     850     830
#>  3  2013     1     1     542     540       2     923     850
#>  4  2013     1     1     544     545      -1    1004    1022
#>  5  2013     1     1     554     600      -6     812     837
#>  6  2013     1     1     554     558      -4     740     728
#>  7  2013     1     1     555     600      -5     913     854
#>  8  2013     1     1     557     600      -3     709     723
#>  9  2013     1     1     557     600      -3     838     846
#> 10  2013     1     1     558     600      -2     753     745
#> # … with 832 more rows, 11 more variables: arr_delay <int>,
#> #   carrier <chr>, flight <int>, tailnum <chr>,
#> #   origin <chr>, dest <chr>, air_time <int>,
#> #   distance <int>, hour <int>, minute <int>,
#> #   time_hour <chr>, and abbreviated variable names
#> #   ¹​dep_time, ²​sched_dep_time, ³​dep_delay, ⁴​arr_time,
#> #   ⁵​sched_arr_time
```

When you run that line of code, dplyr executes the filtering operation and returns a new data frame. dplyr functions never modify their inputs, so if you want to save the result, you’ll need to use the assignment operator, `<-` :


```r

jan1 <- filter(flights, month == 1, day == 1)
```


Let's find all flights that departed in November or December:


```r

filter(flights, month == 11 | month == 12)
#> # A tibble: 55,403 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013    11     1       5    2359       6     352     345
#>  2  2013    11     1      35    2250     105     123    2356
#>  3  2013    11     1     455     500      -5     641     651
#>  4  2013    11     1     539     545      -6     856     827
#>  5  2013    11     1     542     545      -3     831     855
#>  6  2013    11     1     549     600     -11     912     923
#>  7  2013    11     1     550     600     -10     705     659
#>  8  2013    11     1     554     600      -6     659     701
#>  9  2013    11     1     554     600      -6     826     827
#> 10  2013    11     1     554     600      -6     749     751
#> # … with 55,393 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```

We could do the same operation using the `%in%` operator:


```r

filter(flights, month %in% c(11, 12))
#> # A tibble: 55,403 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013    11     1       5    2359       6     352     345
#>  2  2013    11     1      35    2250     105     123    2356
#>  3  2013    11     1     455     500      -5     641     651
#>  4  2013    11     1     539     545      -6     856     827
#>  5  2013    11     1     542     545      -3     831     855
#>  6  2013    11     1     549     600     -11     912     923
#>  7  2013    11     1     550     600     -10     705     659
#>  8  2013    11     1     554     600      -6     659     701
#>  9  2013    11     1     554     600      -6     826     827
#> 10  2013    11     1     554     600      -6     749     751
#> # … with 55,393 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


### slice() Function {-}

`slice()` function allows you to index rows by their (integer) locations. It can select, remove, and duplicate rows.

For instance, let's get observations from rows 5 through 10:


```r

slice(flights, 5:10)
#> # A tibble: 6 × 19
#>    year month   day dep_time sched…¹ dep_d…² arr_t…³ sched…⁴
#>   <int> <int> <int>    <int>   <int>   <int>   <int>   <int>
#> 1  2013     1     1      554     600      -6     812     837
#> 2  2013     1     1      554     558      -4     740     728
#> 3  2013     1     1      555     600      -5     913     854
#> 4  2013     1     1      557     600      -3     709     723
#> 5  2013     1     1      557     600      -3     838     846
#> 6  2013     1     1      558     600      -2     753     745
#> # … with 11 more variables: arr_delay <int>, carrier <chr>,
#> #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time
```


Let's select all rows except the first four (this option can be used to drop some observations from a data set):


```r

slice(flights, -(1:4))
#> # A tibble: 336,772 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     554     600      -6     812     837
#>  2  2013     1     1     554     558      -4     740     728
#>  3  2013     1     1     555     600      -5     913     854
#>  4  2013     1     1     557     600      -3     709     723
#>  5  2013     1     1     557     600      -3     838     846
#>  6  2013     1     1     558     600      -2     753     745
#>  7  2013     1     1     558     600      -2     849     851
#>  8  2013     1     1     558     600      -2     853     856
#>  9  2013     1     1     558     600      -2     924     917
#> 10  2013     1     1     558     600      -2     923     937
#> # … with 336,762 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


Similar to `head()` and `tail()` functions, `slice_head()` and `slice_tail()` can be used to display top and bottom rows in the data set, respectively. Let's print first and last 3 rows in the flights data set:


```r

slice_head(flights, n = 3)
#> # A tibble: 3 × 19
#>    year month   day dep_time sched…¹ dep_d…² arr_t…³ sched…⁴
#>   <int> <int> <int>    <int>   <int>   <int>   <int>   <int>
#> 1  2013     1     1      517     515       2     830     819
#> 2  2013     1     1      533     529       4     850     830
#> 3  2013     1     1      542     540       2     923     850
#> # … with 11 more variables: arr_delay <int>, carrier <chr>,
#> #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time
```


```r

slice_tail(flights, n = 3)
#> # A tibble: 3 × 19
#>    year month   day dep_time sched…¹ dep_d…² arr_t…³ sched…⁴
#>   <int> <int> <int>    <int>   <int>   <int>   <int>   <int>
#> 1  2013     9    30       NA    1210      NA      NA    1330
#> 2  2013     9    30       NA    1159      NA      NA    1344
#> 3  2013     9    30       NA     840      NA      NA    1020
#> # … with 11 more variables: arr_delay <int>, carrier <chr>,
#> #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time
```

Use the `slice_sample()` function to randomly select rows. Use the option `prop` to choose a certain proportion of the cases:


```r

slice_sample(flights, n = 10)
#> # A tibble: 10 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     8    20    1756    1805      -9    1920    1950
#>  2  2013    11    10    2100    1950      70    2334    2215
#>  3  2013     3     1     755     755       0     912     930
#>  4  2013     7    28     945     955     -10    1134    1213
#>  5  2013     9     3    1735    1725      10    2013    2037
#>  6  2013     6    10    1123    1126      -3    1403    1415
#>  7  2013     5    17    2027    2030      -3    2235    2227
#>  8  2013     7    23    2100    1829     151    2249    2033
#>  9  2013     3    21    1312    1320      -8    1557    1628
#> 10  2013     6    25     559     600      -1     825     830
#> # … with 11 more variables: arr_delay <int>, carrier <chr>,
#> #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


```r

slice_sample(flights, prop = 0.001)
#> # A tibble: 336 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     8    15    1526    1450      36    1802    1719
#>  2  2013     3    19    1550    1515      35    1726    1700
#>  3  2013     9    30    1702    1710      -8    1954    2033
#>  4  2013     4    29     720     723      -3     829     847
#>  5  2013     7    15    1149    1155      -6    1256    1323
#>  6  2013     5     9     653     655      -2     756     820
#>  7  2013     5    14     847     811      36    1009     921
#>  8  2013     7    26     758     800      -2    1043    1104
#>  9  2013     4     5    1255    1259      -4    1416    1420
#> 10  2013     1    17    1825    1745      40    2127    2042
#> # … with 326 more rows, 11 more variables: arr_delay <int>,
#> #   carrier <chr>, flight <int>, tailnum <chr>,
#> #   origin <chr>, dest <chr>, air_time <int>,
#> #   distance <int>, hour <int>, minute <int>,
#> #   time_hour <chr>, and abbreviated variable names
#> #   ¹​dep_time, ²​sched_dep_time, ³​dep_delay, ⁴​arr_time,
#> #   ⁵​sched_arr_time
```

Use `replace = TRUE` to take a sample with replacement. 


### arrange() Function {-}

The `arrange()` function is used to change the order of rows in a data set. It takes a data frame and a set of column names (or more complicated expressions) to order by. If you provide more than one column name, each additional column will be used to break ties in the values of preceding columns:


```r

arrange(flights, year, month, day)
#> # A tibble: 336,776 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     517     515       2     830     819
#>  2  2013     1     1     533     529       4     850     830
#>  3  2013     1     1     542     540       2     923     850
#>  4  2013     1     1     544     545      -1    1004    1022
#>  5  2013     1     1     554     600      -6     812     837
#>  6  2013     1     1     554     558      -4     740     728
#>  7  2013     1     1     555     600      -5     913     854
#>  8  2013     1     1     557     600      -3     709     723
#>  9  2013     1     1     557     600      -3     838     846
#> 10  2013     1     1     558     600      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```

Use `desc()` to re-order by a column in descending order:


```r

arrange(flights, desc(dep_delay))
#> # A tibble: 336,776 × 19
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     9     641     900    1301    1242    1530
#>  2  2013     6    15    1432    1935    1137    1607    2120
#>  3  2013     1    10    1121    1635    1126    1239    1810
#>  4  2013     9    20    1139    1845    1014    1457    2210
#>  5  2013     7    22     845    1600    1005    1044    1815
#>  6  2013     4    10    1100    1900     960    1342    2211
#>  7  2013     3    17    2321     810     911     135    1020
#>  8  2013     6    27     959    1900     899    1236    2226
#>  9  2013     7    22    2257     759     898     121    1026
#> 10  2013    12     5     756    1700     896    1058    2020
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```



### select() Function {-}

Often you work with large data sets with many columns but only a few are actually of interest to you. `select()` function allows you to rapidly zoom in on a useful subset. You can select columns by name:


```r

select(flights, year, month, day)
#> # A tibble: 336,776 × 3
#>     year month   day
#>    <int> <int> <int>
#>  1  2013     1     1
#>  2  2013     1     1
#>  3  2013     1     1
#>  4  2013     1     1
#>  5  2013     1     1
#>  6  2013     1     1
#>  7  2013     1     1
#>  8  2013     1     1
#>  9  2013     1     1
#> 10  2013     1     1
#> # … with 336,766 more rows
```

You can select all columns between two variables (inclusive):


```r

select(flights, year:day)
#> # A tibble: 336,776 × 3
#>     year month   day
#>    <int> <int> <int>
#>  1  2013     1     1
#>  2  2013     1     1
#>  3  2013     1     1
#>  4  2013     1     1
#>  5  2013     1     1
#>  6  2013     1     1
#>  7  2013     1     1
#>  8  2013     1     1
#>  9  2013     1     1
#> 10  2013     1     1
#> # … with 336,766 more rows
```

You can select all columns except some:


```r

select(flights, -(year:day))
#> # A tibble: 336,776 × 16
#>    dep_time sched_…¹ dep_d…² arr_t…³ sched…⁴ arr_d…⁵ carrier
#>       <int>    <int>   <int>   <int>   <int>   <int> <chr>  
#>  1      517      515       2     830     819      11 UA     
#>  2      533      529       4     850     830      20 UA     
#>  3      542      540       2     923     850      33 AA     
#>  4      544      545      -1    1004    1022     -18 B6     
#>  5      554      600      -6     812     837     -25 DL     
#>  6      554      558      -4     740     728      12 UA     
#>  7      555      600      -5     913     854      19 B6     
#>  8      557      600      -3     709     723     -14 EV     
#>  9      557      600      -3     838     846      -8 B6     
#> 10      558      600      -2     753     745       8 AA     
#> # … with 336,766 more rows, 9 more variables: flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time, ⁵​arr_delay
```

You can do the same operation with `!` operator:


```r

select(flights, !(year:day))
#> # A tibble: 336,776 × 16
#>    dep_time sched_…¹ dep_d…² arr_t…³ sched…⁴ arr_d…⁵ carrier
#>       <int>    <int>   <int>   <int>   <int>   <int> <chr>  
#>  1      517      515       2     830     819      11 UA     
#>  2      533      529       4     850     830      20 UA     
#>  3      542      540       2     923     850      33 AA     
#>  4      544      545      -1    1004    1022     -18 B6     
#>  5      554      600      -6     812     837     -25 DL     
#>  6      554      558      -4     740     728      12 UA     
#>  7      555      600      -5     913     854      19 B6     
#>  8      557      600      -3     709     723     -14 EV     
#>  9      557      600      -3     838     846      -8 B6     
#> 10      558      600      -2     753     745       8 AA     
#> # … with 336,766 more rows, 9 more variables: flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time, ⁵​arr_delay
```

You can use column indexes for column selection:


```r

select(flights, c(1, 5, 8))
#> # A tibble: 336,776 × 3
#>     year sched_dep_time sched_arr_time
#>    <int>          <int>          <int>
#>  1  2013            515            819
#>  2  2013            529            830
#>  3  2013            540            850
#>  4  2013            545           1022
#>  5  2013            600            837
#>  6  2013            558            728
#>  7  2013            600            854
#>  8  2013            600            723
#>  9  2013            600            846
#> 10  2013            600            745
#> # … with 336,766 more rows
```

There are a number of helper functions you can use within `select()`. For example, `starts_with()`, `ends_with()`, `matches()` and `contains()`. These let you quickly match larger blocks of variables that meet some criterion.

Let's select all columns that start with "sched":


```r

select(flights, starts_with("sched"))
#> # A tibble: 336,776 × 2
#>    sched_dep_time sched_arr_time
#>             <int>          <int>
#>  1            515            819
#>  2            529            830
#>  3            540            850
#>  4            545           1022
#>  5            600            837
#>  6            558            728
#>  7            600            854
#>  8            600            723
#>  9            600            846
#> 10            600            745
#> # … with 336,766 more rows
```

You can select all columns in the data set that end with "time":


```r

select(flights, ends_with("time"))
#> # A tibble: 336,776 × 5
#>    dep_time sched_dep_time arr_time sched_arr_time air_time
#>       <int>          <int>    <int>          <int>    <int>
#>  1      517            515      830            819      227
#>  2      533            529      850            830      227
#>  3      542            540      923            850      160
#>  4      544            545     1004           1022      183
#>  5      554            600      812            837      116
#>  6      554            558      740            728      150
#>  7      555            600      913            854      158
#>  8      557            600      709            723       53
#>  9      557            600      838            846      140
#> 10      558            600      753            745      138
#> # … with 336,766 more rows
```

Or suppose you want to select all columns in the data set that contain "ar":


```r

select(flights, contains("ar"))
#> # A tibble: 336,776 × 5
#>     year arr_time sched_arr_time arr_delay carrier
#>    <int>    <int>          <int>     <int> <chr>  
#>  1  2013      830            819        11 UA     
#>  2  2013      850            830        20 UA     
#>  3  2013      923            850        33 AA     
#>  4  2013     1004           1022       -18 B6     
#>  5  2013      812            837       -25 DL     
#>  6  2013      740            728        12 UA     
#>  7  2013      913            854        19 B6     
#>  8  2013      709            723       -14 EV     
#>  9  2013      838            846        -8 B6     
#> 10  2013      753            745         8 AA     
#> # … with 336,766 more rows
```

You can even combine these arguments:


```r

select(flights, starts_with("sched") & ends_with("time"))
#> # A tibble: 336,776 × 2
#>    sched_dep_time sched_arr_time
#>             <int>          <int>
#>  1            515            819
#>  2            529            830
#>  3            540            850
#>  4            545           1022
#>  5            600            837
#>  6            558            728
#>  7            600            854
#>  8            600            723
#>  9            600            846
#> 10            600            745
#> # … with 336,766 more rows
```


### rename() Function {-}

Use `rename()` function to rename columns in a data frame. Suppose we want to rename the "year" and "month" variables and make them uppercase:


```r

rename(flights, YEAR = year, MONTH = month)
#> # A tibble: 336,776 × 19
#>     YEAR MONTH   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     517     515       2     830     819
#>  2  2013     1     1     533     529       4     850     830
#>  3  2013     1     1     542     540       2     923     850
#>  4  2013     1     1     544     545      -1    1004    1022
#>  5  2013     1     1     554     600      -6     812     837
#>  6  2013     1     1     554     558      -4     740     728
#>  7  2013     1     1     555     600      -5     913     854
#>  8  2013     1     1     557     600      -3     709     723
#>  9  2013     1     1     557     600      -3     838     846
#> 10  2013     1     1     558     600      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


### relocate() Function {-}

`relocate()` function allows to change the positions of columns in a data frame. It has two useful arguments `.before` and `.after` that helps precisely select a location for a variable:


```r

relocate(flights, year, .after = month)
#> # A tibble: 336,776 × 19
#>    month  year   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1     1  2013     1     517     515       2     830     819
#>  2     1  2013     1     533     529       4     850     830
#>  3     1  2013     1     542     540       2     923     850
#>  4     1  2013     1     544     545      -1    1004    1022
#>  5     1  2013     1     554     600      -6     812     837
#>  6     1  2013     1     554     558      -4     740     728
#>  7     1  2013     1     555     600      -5     913     854
#>  8     1  2013     1     557     600      -3     709     723
#>  9     1  2013     1     557     600      -3     838     846
#> 10     1  2013     1     558     600      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


```r

relocate(flights, c(year, month), .before = dep_delay)
#> # A tibble: 336,776 × 19
#>      day dep_t…¹ sched…²  year month dep_d…³ arr_t…⁴ sched…⁵
#>    <int>   <int>   <int> <int> <int>   <int>   <int>   <int>
#>  1     1     517     515  2013     1       2     830     819
#>  2     1     533     529  2013     1       4     850     830
#>  3     1     542     540  2013     1       2     923     850
#>  4     1     544     545  2013     1      -1    1004    1022
#>  5     1     554     600  2013     1      -6     812     837
#>  6     1     554     558  2013     1      -4     740     728
#>  7     1     555     600  2013     1      -5     913     854
#>  8     1     557     600  2013     1      -3     709     723
#>  9     1     557     600  2013     1      -3     838     846
#> 10     1     558     600  2013     1      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```



```r

relocate(flights, c(year, month), .after = last_col())
#> # A tibble: 336,776 × 19
#>      day dep_time sched_de…¹ dep_d…² arr_t…³ sched…⁴ arr_d…⁵
#>    <int>    <int>      <int>   <int>   <int>   <int>   <int>
#>  1     1      517        515       2     830     819      11
#>  2     1      533        529       4     850     830      20
#>  3     1      542        540       2     923     850      33
#>  4     1      544        545      -1    1004    1022     -18
#>  5     1      554        600      -6     812     837     -25
#>  6     1      554        558      -4     740     728      12
#>  7     1      555        600      -5     913     854      19
#>  8     1      557        600      -3     709     723     -14
#>  9     1      557        600      -3     838     846      -8
#> 10     1      558        600      -2     753     745       8
#> # … with 336,766 more rows, 12 more variables:
#> #   carrier <chr>, flight <int>, tailnum <chr>,
#> #   origin <chr>, dest <chr>, air_time <int>,
#> #   distance <int>, hour <int>, minute <int>,
#> #   time_hour <chr>, year <int>, month <int>, and
#> #   abbreviated variable names ¹​sched_dep_time, ²​dep_delay,
#> #   ³​arr_time, ⁴​sched_arr_time, ⁵​arr_delay
```


```r

relocate(flights, dep_delay, .before = everything())
#> # A tibble: 336,776 × 19
#>    dep_d…¹  year month   day dep_t…² sched…³ arr_t…⁴ sched…⁵
#>      <int> <int> <int> <int>   <int>   <int>   <int>   <int>
#>  1       2  2013     1     1     517     515     830     819
#>  2       4  2013     1     1     533     529     850     830
#>  3       2  2013     1     1     542     540     923     850
#>  4      -1  2013     1     1     544     545    1004    1022
#>  5      -6  2013     1     1     554     600     812     837
#>  6      -4  2013     1     1     554     558     740     728
#>  7      -5  2013     1     1     555     600     913     854
#>  8      -3  2013     1     1     557     600     709     723
#>  9      -3  2013     1     1     557     600     838     846
#> 10      -2  2013     1     1     558     600     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_delay, ²​dep_time, ³​sched_dep_time,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```



### mutate() Function {-}

It’s often useful to add new columns that are functions of existing columns. That's what the `mutate()` function does. 

`mutate()` always adds new columns at the end of your data set so we’ll start by creating a narrower data set so we can see the new variables:


```r

flights_2 <- select(flights, month, ends_with("delay"), distance, air_time)
```


Now let's add "gain" and "speed" columns to the data frame:


```r

mutate(flights_2, gain = dep_delay - arr_delay, speed = distance / air_time * 60)
#> # A tibble: 336,776 × 7
#>    month dep_delay arr_delay distance air_time  gain speed
#>    <int>     <int>     <int>    <int>    <int> <int> <dbl>
#>  1     1         2        11     1400      227    -9  370.
#>  2     1         4        20     1416      227   -16  374.
#>  3     1         2        33     1089      160   -31  408.
#>  4     1        -1       -18     1576      183    17  517.
#>  5     1        -6       -25      762      116    19  394.
#>  6     1        -4        12      719      150   -16  288.
#>  7     1        -5        19     1065      158   -24  404.
#>  8     1        -3       -14      229       53    11  259.
#>  9     1        -3        -8      944      140     5  405.
#> 10     1        -2         8      733      138   -10  319.
#> # … with 336,766 more rows
```

Note that you can refer to columns that you've just created:


```r

mutate(flights_2, gain = dep_delay - arr_delay, hours = air_time/60, gain_per_hour = gain/hours)
#> # A tibble: 336,776 × 8
#>    month dep_d…¹ arr_d…² dista…³ air_t…⁴  gain hours gain_…⁵
#>    <int>   <int>   <int>   <int>   <int> <int> <dbl>   <dbl>
#>  1     1       2      11    1400     227    -9 3.78    -2.38
#>  2     1       4      20    1416     227   -16 3.78    -4.23
#>  3     1       2      33    1089     160   -31 2.67   -11.6 
#>  4     1      -1     -18    1576     183    17 3.05     5.57
#>  5     1      -6     -25     762     116    19 1.93     9.83
#>  6     1      -4      12     719     150   -16 2.5     -6.4 
#>  7     1      -5      19    1065     158   -24 2.63    -9.11
#>  8     1      -3     -14     229      53    11 0.883   12.5 
#>  9     1      -3      -8     944     140     5 2.33     2.14
#> 10     1      -2       8     733     138   -10 2.3     -4.35
#> # … with 336,766 more rows, and abbreviated variable names
#> #   ¹​dep_delay, ²​arr_delay, ³​distance, ⁴​air_time,
#> #   ⁵​gain_per_hour
```

If you only want to keep the new variable, use `transmute()` function:


```r

transmute(flights_2, gain = dep_delay - arr_delay, hours = air_time/60, gain_per_hour = gain/hours)
#> # A tibble: 336,776 × 3
#>     gain hours gain_per_hour
#>    <int> <dbl>         <dbl>
#>  1    -9 3.78          -2.38
#>  2   -16 3.78          -4.23
#>  3   -31 2.67         -11.6 
#>  4    17 3.05           5.57
#>  5    19 1.93           9.83
#>  6   -16 2.5           -6.4 
#>  7   -24 2.63          -9.11
#>  8    11 0.883         12.5 
#>  9     5 2.33           2.14
#> 10   -10 2.3           -4.35
#> # … with 336,766 more rows
```


### `%>%` Pipe Operator {-}

The dplyr functions are functional in the sense that function calls don’t have side-effects. You must always save their results. This doesn’t lead to particularly elegant code, especially if you want to do many operations at once. You either have to do it step-by-step or if you don’t want to name the intermediate results, you need to wrap the function calls inside each other, which lead to a messy and complex code:


```r

select(filter(flights, month == 11 | month == 12), starts_with("sched") & ends_with("time"))
#> # A tibble: 55,403 × 2
#>    sched_dep_time sched_arr_time
#>             <int>          <int>
#>  1           2359            345
#>  2           2250           2356
#>  3            500            651
#>  4            545            827
#>  5            545            855
#>  6            600            923
#>  7            600            659
#>  8            600            701
#>  9            600            827
#> 10            600            751
#> # … with 55,393 more rows
```

This is difficult to read because the order of the operations is from inside to out. Thus, the arguments are a long way away from the function. To get around this problem, dplyr provides the `%>%` operator. The pipe operator, `%>%`, comes from the **magrittr** package by Stefan Milton Bache. Packages in the tidyverse load `%>%` for you automatically, so you don't usually load magrittr explicitly. 


`x %>% f(y)` turns into `f(x, y)` so you can use it to rewrite multiple operations that you can read left-to-right, top-to-bottom (reading the pipe operator as “then”):



```r

flights %>% 
  
  filter(month == 11 | month == 12) %>%
  
  select( starts_with("sched") & ends_with("time"))
#> # A tibble: 55,403 × 2
#>    sched_dep_time sched_arr_time
#>             <int>          <int>
#>  1           2359            345
#>  2           2250           2356
#>  3            500            651
#>  4            545            827
#>  5            545            855
#>  6            600            923
#>  7            600            659
#>  8            600            701
#>  9            600            827
#> 10            600            751
#> # … with 55,393 more rows
```


Try to understand what the following code is doing:



```r

flights %>% 
  
  filter(month %in% c(10, 11, 12), arr_delay < 10) %>%
  
  slice(1:30) %>%
  
  arrange(desc(arr_delay)) %>%
  
  select(-c(1,4))
#> # A tibble: 30 × 17
#>    month   day sched_dep_t…¹ dep_d…² arr_t…³ sched…⁴ arr_d…⁵
#>    <int> <int>         <int>   <int>   <int>   <int>   <int>
#>  1    10     1           600      -9     727     730      -3
#>  2    10     1           600      -2     743     751      -8
#>  3    10     1           600     -10     649     659     -10
#>  4    10     1           610      -7     735     745     -10
#>  5    10     1           600      -9     710     721     -11
#>  6    10     1           600      -2     650     701     -11
#>  7    10     1           600      -1     719     730     -11
#>  8    10     1           600       0     706     717     -11
#>  9    10     1           600     -10     648     700     -12
#> 10    10     1           600      -9     655     708     -13
#> # … with 20 more rows, 10 more variables: carrier <chr>,
#> #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​sched_dep_time, ²​dep_delay, ³​arr_time,
#> #   ⁴​sched_arr_time, ⁵​arr_delay
```


### group_by(), summarise(), and across() Functions {-}

Most data operations are done on groups defined by variables. `dplyr` verbs are particularly powerful when you apply them to grouped data frames. The most important grouping verb is `group_by()`. It takes an existing data frame and converts it into a grouped data frame where operations are performed "by group". In other words, it takes a data frame and one or more variables to group by:


```r

by_origin <- flights %>% group_by(origin)

by_origin
#> # A tibble: 336,776 × 19
#> # Groups:   origin [3]
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     517     515       2     830     819
#>  2  2013     1     1     533     529       4     850     830
#>  3  2013     1     1     542     540       2     923     850
#>  4  2013     1     1     544     545      -1    1004    1022
#>  5  2013     1     1     554     600      -6     812     837
#>  6  2013     1     1     554     558      -4     740     728
#>  7  2013     1     1     555     600      -5     913     854
#>  8  2013     1     1     557     600      -3     709     723
#>  9  2013     1     1     557     600      -3     838     846
#> 10  2013     1     1     558     600      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


```r

by_origin_carrier <- flights %>% group_by(origin, carrier)

by_origin_carrier
#> # A tibble: 336,776 × 19
#> # Groups:   origin, carrier [35]
#>     year month   day dep_t…¹ sched…² dep_d…³ arr_t…⁴ sched…⁵
#>    <int> <int> <int>   <int>   <int>   <int>   <int>   <int>
#>  1  2013     1     1     517     515       2     830     819
#>  2  2013     1     1     533     529       4     850     830
#>  3  2013     1     1     542     540       2     923     850
#>  4  2013     1     1     544     545      -1    1004    1022
#>  5  2013     1     1     554     600      -6     812     837
#>  6  2013     1     1     554     558      -4     740     728
#>  7  2013     1     1     555     600      -5     913     854
#>  8  2013     1     1     557     600      -3     709     723
#>  9  2013     1     1     557     600      -3     838     846
#> 10  2013     1     1     558     600      -2     753     745
#> # … with 336,766 more rows, 11 more variables:
#> #   arr_delay <int>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <int>, distance <int>, hour <int>,
#> #   minute <int>, time_hour <chr>, and abbreviated variable
#> #   names ¹​dep_time, ²​sched_dep_time, ³​dep_delay,
#> #   ⁴​arr_time, ⁵​sched_arr_time
```


Grouping does not change how the data looks apart from listing how it is grouped.

Grouping is most useful when used in conjunction with the `summarise()` function. `summarise()` creates a new data frame. It returns one row for each combination of grouping variables; if there are no grouping variables, the output will have a single row summarizing all observations in the input. It will contain one column for each grouping variable and one column for each of the summary statistics that you have specified. Thus, it changes the unit of analysis from the complete dataset to individual groups. Together `group_by()` and `summarise()` provide one of the tools that you’ll use most commonly when working with dplyr: grouped summaries.

For instance, let's calculate the average arrival delay time for each group in the `by_origin` grouped data:


```r

by_origin %>% summarise(Mean = mean(arr_delay, na.rm = T))
#> # A tibble: 3 × 2
#>   origin  Mean
#>   <chr>  <dbl>
#> 1 EWR     9.11
#> 2 JFK     5.55
#> 3 LGA     5.78
```

You can even pass several variables to it:


```r

by_origin %>% 
  
  summarise(Mean = mean(arr_delay, na.rm = T),
            
            Median = median(arr_delay, na.rm = T),
            
            Count = n())
#> # A tibble: 3 × 4
#>   origin  Mean Median  Count
#>   <chr>  <dbl>  <dbl>  <int>
#> 1 EWR     9.11     -4 120835
#> 2 JFK     5.55     -6 111279
#> 3 LGA     5.78     -5 104662
```


The table below displays useful functions that are frequently used with `summarise()`:


Functionality | Functions
--------------| -----------
Center | `mean()`, `median()`
Spread | `sd()`, `IQR()`, `var()`, `quantile()`
Range | `min()`, `max()`, `range()`
Position| `first()`, `last()`, `nth()`
Count | `n()`, `n_distinct()`
Logical | `any()`, `all()`


`group_by()` and `summarise()` functions can be combined with other single table verbs:



```r

by_carrier <- flights %>% group_by(carrier)

by_carrier %>%
  
  summarise (Count = n(), Distance_sd = sd(distance)) %>%
  
  filter(Count < 10000) %>%
  
  arrange(desc(Distance_sd))
#> # A tibble: 7 × 3
#>   carrier Count Distance_sd
#>   <chr>   <int>       <dbl>
#> 1 OO         32       206. 
#> 2 FL       3260       161. 
#> 3 YV        601       160. 
#> 4 VX       5162        88.0
#> 5 AS        714         0  
#> 6 F9        685         0  
#> 7 HA        342         0
```


If you need to remove grouping and return to operations on ungrouped data, use `ungroup()`:


```r

by_carrier %>%
  
  ungroup() %>%
  
  summarise(flights = n())
#> # A tibble: 1 × 1
#>   flights
#>     <int>
#> 1  336776
```


It’s often useful to perform the same operation on multiple columns, but copying and pasting is both tedious and error prone. For example:



```r

flights %>% 
  
  group_by(origin, carrier) %>%
  
  summarise(Mean_dep_delay = mean(dep_delay, na.rm = T),
            
            Mean_arrival_delay = mean(arr_delay, na.rm = T),
            
            Mean_air_time = mean(air_time, na.rm = T))
#> `summarise()` has grouped output by 'origin'. You can
#> override using the `.groups` argument.
#> # A tibble: 35 × 5
#> # Groups:   origin [3]
#>    origin carrier Mean_dep_delay Mean_arrival_delay Mean_a…¹
#>    <chr>  <chr>            <dbl>              <dbl>    <dbl>
#>  1 EWR    9E                5.95              1.62     103. 
#>  2 EWR    AA               10.0               0.978    196. 
#>  3 EWR    AS                5.80             -9.93     326. 
#>  4 EWR    B6               13.1               9.39     118. 
#>  5 EWR    DL               12.1               8.78     125. 
#>  6 EWR    EV               20.2              17.0       94.0
#>  7 EWR    MQ               17.5              16.3      112. 
#>  8 EWR    OO               20.8              21.5      137. 
#>  9 EWR    UA               12.5               3.48     207. 
#> 10 EWR    US                3.74              0.977    138. 
#> # … with 25 more rows, and abbreviated variable name
#> #   ¹​Mean_air_time
```


Instead, we can use `across()` function, which  lets you rewrite the previous code more succinctly:


```r

flights %>% 
  
  group_by(origin, carrier) %>%
  
  summarise(across(
    
    c(dep_delay, arr_delay, air_time),
    
    ~ mean(.x, na.rm = T)
    
  ))
#> `summarise()` has grouped output by 'origin'. You can
#> override using the `.groups` argument.
#> # A tibble: 35 × 5
#> # Groups:   origin [3]
#>    origin carrier dep_delay arr_delay air_time
#>    <chr>  <chr>       <dbl>     <dbl>    <dbl>
#>  1 EWR    9E           5.95     1.62     103. 
#>  2 EWR    AA          10.0      0.978    196. 
#>  3 EWR    AS           5.80    -9.93     326. 
#>  4 EWR    B6          13.1      9.39     118. 
#>  5 EWR    DL          12.1      8.78     125. 
#>  6 EWR    EV          20.2     17.0       94.0
#>  7 EWR    MQ          17.5     16.3      112. 
#>  8 EWR    OO          20.8     21.5      137. 
#>  9 EWR    UA          12.5      3.48     207. 
#> 10 EWR    US           3.74     0.977    138. 
#> # … with 25 more rows
```


`across()` has two primary arguments: (1) the first argument, `.col`, selects the columns you want to operate on; (2) the second argument, `.fns`, is a function or list of functions to apply to each column. Here are some examples:


```r

flights %>% 
  
  summarise(across(where(is.factor), n_distinct))
#> # A tibble: 1 × 0
```



```r

flights %>% 
  
  group_by(origin) %>%
  
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))
#> # A tibble: 3 × 15
#>   origin  year month   day dep_time sched_…¹ dep_d…² arr_t…³
#>   <chr>  <dbl> <dbl> <dbl>    <dbl>    <dbl>   <dbl>   <dbl>
#> 1 EWR     2013  6.49  15.7    1337.    1322.    15.1   1492.
#> 2 JFK     2013  6.50  15.7    1399.    1402.    12.1   1520.
#> 3 LGA     2013  6.67  15.7    1310.    1308.    10.3   1494.
#> # … with 7 more variables: sched_arr_time <dbl>,
#> #   arr_delay <dbl>, flight <dbl>, air_time <dbl>,
#> #   distance <dbl>, hour <dbl>, minute <dbl>, and
#> #   abbreviated variable names ¹​sched_dep_time, ²​dep_delay,
#> #   ³​arr_time
```


You can transform each variable with more than one function by supplying a named list of functions or lambda functions in the second argument:


```r


min_max <- list(
  
  min = ~min(.x, na.rm = TRUE), 
  
  max = ~max(.x, na.rm = TRUE)
)

flights %>% 
  
  group_by(origin) %>%
  
  summarise(across(where(is.numeric), min_max))
#> # A tibble: 3 × 29
#>   origin year_min year_max month_min month…¹ day_min day_max
#>   <chr>     <int>    <int>     <int>   <int>   <int>   <int>
#> 1 EWR        2013     2013         1      12       1      31
#> 2 JFK        2013     2013         1      12       1      31
#> 3 LGA        2013     2013         1      12       1      31
#> # … with 22 more variables: dep_time_min <int>,
#> #   dep_time_max <int>, sched_dep_time_min <int>,
#> #   sched_dep_time_max <int>, dep_delay_min <int>,
#> #   dep_delay_max <int>, arr_time_min <int>,
#> #   arr_time_max <int>, sched_arr_time_min <int>,
#> #   sched_arr_time_max <int>, arr_delay_min <int>,
#> #   arr_delay_max <int>, flight_min <int>, …
```

You can control how the names are created with the `.names` argument:


```r

flights %>% 
  
  group_by(origin) %>%
  
  summarise(across(where(is.numeric), min_max,
                   
                   .names = "{.fn}.{.col}"
                   
                   ))
#> # A tibble: 3 × 29
#>   origin min.year max.year min.month max.m…¹ min.day max.day
#>   <chr>     <int>    <int>     <int>   <int>   <int>   <int>
#> 1 EWR        2013     2013         1      12       1      31
#> 2 JFK        2013     2013         1      12       1      31
#> 3 LGA        2013     2013         1      12       1      31
#> # … with 22 more variables: min.dep_time <int>,
#> #   max.dep_time <int>, min.sched_dep_time <int>,
#> #   max.sched_dep_time <int>, min.dep_delay <int>,
#> #   max.dep_delay <int>, min.arr_time <int>,
#> #   max.arr_time <int>, min.sched_arr_time <int>,
#> #   max.sched_arr_time <int>, min.arr_delay <int>,
#> #   max.arr_delay <int>, min.flight <int>, …
```


## Relational Data: Two-Table Verbs {-}

It’s rare that a data analysis involves only a single table of data. In practice, you’ll normally have many tables that contribute to an analysis, and you need flexible tools to combine them. 


In dplyr, there are three families of verbs that work with two tables at a time:

* **Mutating joins**, which add new variables to one table from matching rows in another
* **Filtering joins**, which filter observations from one table based on whether or not they match an observation in the other table
* **Set operations**, which combine the observations in the data sets as if they were set elements


### Mutating joins {-}

Mutating joins allow you to combine variables from multiple tables. It first matches observations by their keys, then copies across variables from one table to the other. There are four types of mutating join, which differ in their behavior when a match is not found. These are:

* `inner_join()`
* `left_join()`
* `right_join()`
* `full_join()`

All these functions have the same input arguments. We will be focusing on the following arguments:

* `x` and `y` - tables or dataframes that are being combined (`x` is known as a primary table and `y` as a secondary table)
* `by` - the join key, a variable or variables that is/are used to match the rows between the `x` and `y` tables. In other words, it controls which variables are used to match observations in the two tables.
* `keep` - a logical operator indicating whether the join keys from both `x` and `y` tables should be preserved in the output. The default value is `FALSE`.


The output is always a new table. By default, if an observation in `x` matches multiple observations in `y`, all of the matching observations in `y` will be returned. If this occurs, normally a warning will be thrown stating that multiple matches have been detected since this is usually surprising.

To illustrative how these functions work, we will be using the following toy data frames:


```r

df1 <- data.frame(
  
  a = c(1, 2, 3, 2, 4),
  
  b = c(10, 20, 30, 35, 40),
  
  c  = c(100, 200, 300, 350, 400)
  
)

print(df1)
#>   a  b   c
#> 1 1 10 100
#> 2 2 20 200
#> 3 3 30 300
#> 4 2 35 350
#> 5 4 40 400
```



```r

df2 <- data.frame(
  
  a =  c(1, 2, 5, 4, 6, 2),
  
  b  =  c(10, 40, 50, 40, 60, 50),
  
  x = c(15, 25, 35, 45, 55, 65),
  
  z = c(150, 200, 350, 400, 550, 270)

)

print(df2)
#>   a  b  x   z
#> 1 1 10 15 150
#> 2 2 40 25 200
#> 3 5 50 35 350
#> 4 4 40 45 400
#> 5 6 60 55 550
#> 6 2 50 65 270
```


#### inner_join() {-}

The simplest type of join is the **inner join**. An inner join matches pairs of observations whenever their keys are equal. The output of an inner join is a new data frame that contains the key, the `x` values, and the `y` values. The most important property of an inner join is that unmatched rows in either input are not included in the result.

Below are some examples of inner join:


```r

# Merging tables by the "a" variable

df1 %>%
  
  inner_join(df2, by = "a")
#>   a b.x   c b.y  x   z
#> 1 1  10 100  10 15 150
#> 2 2  20 200  40 25 200
#> 3 2  20 200  50 65 270
#> 4 2  35 350  40 25 200
#> 5 2  35 350  50 65 270
#> 6 4  40 400  40 45 400
```



```r

# Merging tables by the "a" and "b" variable

df1 %>%
  
  inner_join(df2, by = c("a", "b"))
#>   a  b   c  x   z
#> 1 1 10 100 15 150
#> 2 4 40 400 45 400
```



```r

## Merging tables by the "c" and "z" variable (Have different variable names)

df1 %>%
  
  inner_join(df2, by = c("c" = "z"))
#>   a.x b.x   c a.y b.y  x
#> 1   2  20 200   2  40 25
#> 2   2  35 350   5  50 35
#> 3   4  40 400   4  40 45
```



```r

## Merging tables by the "c" and "z" variable (Have different variable names) and keeping both key variables in the output table

df1 %>%
  
  inner_join(df2, by = c("c" = "z"), keep = T)
#>   a.x b.x   c a.y b.y  x   z
#> 1   2  20 200   2  40 25 200
#> 2   2  35 350   5  50 35 350
#> 3   4  40 400   4  40 45 400
```


#### left_join() {-}

`left_join()` includes all observations in `x`, regardless of whether they match or not. This is the most commonly used join because it ensures that you don’t lose observations from your primary table:


```r

# Merging tables by the "a" variable

df1 %>%
  
  left_join(df2, by = "a")
#>   a b.x   c b.y  x   z
#> 1 1  10 100  10 15 150
#> 2 2  20 200  40 25 200
#> 3 2  20 200  50 65 270
#> 4 3  30 300  NA NA  NA
#> 5 2  35 350  40 25 200
#> 6 2  35 350  50 65 270
#> 7 4  40 400  40 45 400
```



```r

# Merging tables by the "a" and "b" variable

df1 %>%
  
  left_join(df2, by = c("a", "b"))
#>   a  b   c  x   z
#> 1 1 10 100 15 150
#> 2 2 20 200 NA  NA
#> 3 3 30 300 NA  NA
#> 4 2 35 350 NA  NA
#> 5 4 40 400 45 400
```



```r

## Merging tables by the "c" and "z" variable (Have different variable names)

df1 %>%
  
  left_join(df2, by = c("c" = "z"))
#>   a.x b.x   c a.y b.y  x
#> 1   1  10 100  NA  NA NA
#> 2   2  20 200   2  40 25
#> 3   3  30 300  NA  NA NA
#> 4   2  35 350   5  50 35
#> 5   4  40 400   4  40 45
```



#### right_join() {-}

`right_join()` includes all observations in `y`:


```r

# Merging tables by the "a" variable

df1 %>%
  
  right_join(df2, by = "a")
#>   a b.x   c b.y  x   z
#> 1 1  10 100  10 15 150
#> 2 2  20 200  40 25 200
#> 3 2  20 200  50 65 270
#> 4 2  35 350  40 25 200
#> 5 2  35 350  50 65 270
#> 6 4  40 400  40 45 400
#> 7 5  NA  NA  50 35 350
#> 8 6  NA  NA  60 55 550
```



```r

# Merging tables by the "a" and "b" variable

df1 %>%
  
  right_join(df2, by = c("a", "b"))
#>   a  b   c  x   z
#> 1 1 10 100 15 150
#> 2 4 40 400 45 400
#> 3 2 40  NA 25 200
#> 4 5 50  NA 35 350
#> 5 6 60  NA 55 550
#> 6 2 50  NA 65 270
```



```r

## Merging tables by the "c" and "z" variable (Have different variable names)

df1 %>%
  
  right_join(df2, by = c("c" = "z"))
#>   a.x b.x   c a.y b.y  x
#> 1   2  20 200   2  40 25
#> 2   2  35 350   5  50 35
#> 3   4  40 400   4  40 45
#> 4  NA  NA 150   1  10 15
#> 5  NA  NA 550   6  60 55
#> 6  NA  NA 270   2  50 65
```


#### full_join() {-}

`full_join()` includes all observations from both `x` and `y`:


```r

# Merging tables by the "a" variable

df1 %>%
  
  full_join(df2, by = "a")
#>   a b.x   c b.y  x   z
#> 1 1  10 100  10 15 150
#> 2 2  20 200  40 25 200
#> 3 2  20 200  50 65 270
#> 4 3  30 300  NA NA  NA
#> 5 2  35 350  40 25 200
#> 6 2  35 350  50 65 270
#> 7 4  40 400  40 45 400
#> 8 5  NA  NA  50 35 350
#> 9 6  NA  NA  60 55 550
```



```r

# Merging tables by the "a" and "b" variable

df1 %>%
  
  full_join(df2, by = c("a", "b"))
#>   a  b   c  x   z
#> 1 1 10 100 15 150
#> 2 2 20 200 NA  NA
#> 3 3 30 300 NA  NA
#> 4 2 35 350 NA  NA
#> 5 4 40 400 45 400
#> 6 2 40  NA 25 200
#> 7 5 50  NA 35 350
#> 8 6 60  NA 55 550
#> 9 2 50  NA 65 270
```



```r

## Merging tables by the "c" and "z" variable (Have different variable names)

df1 %>%
  
  full_join(df2, by = c("c" = "z"))
#>   a.x b.x   c a.y b.y  x
#> 1   1  10 100  NA  NA NA
#> 2   2  20 200   2  40 25
#> 3   3  30 300  NA  NA NA
#> 4   2  35 350   5  50 35
#> 5   4  40 400   4  40 45
#> 6  NA  NA 150   1  10 15
#> 7  NA  NA 550   6  60 55
#> 8  NA  NA 270   2  50 65
```


### Filtering joins {-}

Filtering joins match observations in the same way as mutating joins, but affect the observations, not the variables. There are two types:

* `semi_join(x, y)` - **keeps** all observations in `x` that have a match in `y`
* `anti_join(x, y)` - **drops** all observations in `x` that have a match in `y`



```r

df1 %>%
  
  semi_join(df2, by = "a")
#>   a  b   c
#> 1 1 10 100
#> 2 2 20 200
#> 3 2 35 350
#> 4 4 40 400
```



```r

df1 %>%
  
  semi_join(df2, by = c("a", "b"))
#>   a  b   c
#> 1 1 10 100
#> 2 4 40 400
```



```r

df1 %>%
  
  anti_join(df2, by = "a")
#>   a  b   c
#> 1 3 30 300
```



```r

df1 %>%
  
  anti_join(df2, by = c("a", "b"))
#>   a  b   c
#> 1 2 20 200
#> 2 3 30 300
#> 3 2 35 350
```


### Set Operations {-}

Set operations expect `x` and `y` tables to have the same variables, and treat the observations as sets:

* `itersect(x, y)` - returns only observations in both `x` and `y`
* `union(x, y)` - returns unique observations in both `x` and `y`
* `setdiff(x, y)` - returns observations in `x`, but not in `y`


We will first create toy data frames and then apply these functions to them:



```r

df1 <- data.frame(
  
  a = c(1, 2, 3, 4, 5),
  
  b = c(10, 20, 30, 40, 50)
  
)

df1
#>   a  b
#> 1 1 10
#> 2 2 20
#> 3 3 30
#> 4 4 40
#> 5 5 50
```


```r

df2 <- data.frame(
  
  a = c(1, 2, 3, 4, 5),
  
  b = c(10, 15, 30, 45, 65)
  
)

df2
#>   a  b
#> 1 1 10
#> 2 2 15
#> 3 3 30
#> 4 4 45
#> 5 5 65
```


```r

intersect(df1, df2)
#>   a  b
#> 1 1 10
#> 2 3 30
```


```r

union(df1, df2)
#>   a  b
#> 1 1 10
#> 2 2 20
#> 3 3 30
#> 4 4 40
#> 5 5 50
#> 6 2 15
#> 7 4 45
#> 8 5 65
```


```r

setdiff(df1, df2)
#>   a  b
#> 1 2 20
#> 2 4 40
#> 3 5 50
```


```r

setdiff(df2, df1)
#>   a  b
#> 1 2 15
#> 2 4 45
#> 3 5 65
```



### Practice Data Sets {-}


Here are two data sets that you can use to practice two-table verbs:



```r

data1 <- data.frame(
  
  Name = c("James", "Linda", "Jim", "Margo", "Nick", "Stacy", "Mary", "Tom", "Anna", "Bob", "Jeniffer", "Lucas", "Amy"),
  
  Age = c(22, 56, 34, 48, 19, 25, 31, 68, 72, 42, 39, 52, 39),
  
  State = c("California", "New York", "New York", "California", "Michigan", "Texas", "Ohio", "Arizona", "Texas", "Florida", "Nebraska", "Indiana", "Florida"),
  
  state_abr = c("CA", "NY", "NY", "CA", "MI", "TX", "OH", "AZ", "TX", "FL", "NE", "IN", "FL"),
  
  City = c("Los Angeles", "New York", "Buffalo", "San Diego", "Detroit", "Austin", "Cleveland", "Phoenix", "Houston", "Tampa", "Lincoln", "Indianapolis", "Miami"),
  
  Salary = c(30000, 96500, 72000, 59000, 54300, 25000, 61000, 64000, 74700, 40000, 83000, 92400, 82000)
  
)

data1
#>        Name Age      State state_abr         City Salary
#> 1     James  22 California        CA  Los Angeles  30000
#> 2     Linda  56   New York        NY     New York  96500
#> 3       Jim  34   New York        NY      Buffalo  72000
#> 4     Margo  48 California        CA    San Diego  59000
#> 5      Nick  19   Michigan        MI      Detroit  54300
#> 6     Stacy  25      Texas        TX       Austin  25000
#> 7      Mary  31       Ohio        OH    Cleveland  61000
#> 8       Tom  68    Arizona        AZ      Phoenix  64000
#> 9      Anna  72      Texas        TX      Houston  74700
#> 10      Bob  42    Florida        FL        Tampa  40000
#> 11 Jeniffer  39   Nebraska        NE      Lincoln  83000
#> 12    Lucas  52    Indiana        IN Indianapolis  92400
#> 13      Amy  39    Florida        FL        Miami  82000
```



```r

data2 <- data.frame(
  
  State = c("Washington", "Florida", "Nebraska", "Indiana", "Florida","California", "New York", "New York", "California", "Michigan", "Texas", "Ohio", "Arizona", "Utah"),
  
  state_abbriviation = c("WA", "FL", "NE", "IN", "FL","CA", "NY", "NY", "CA", "MI", "TX", "OH", "AZ", "UT"),
  
  City = c( "Seatle", "Tampa", "Lincoln", "Indianapolis", "Miami","Los Angeles", "New York", "Ithaca", "San Francisco", "Detroit", "Dallas", "Cleveland", "Phoenix", "Salt Lake City"),
  
  Average_salary = c(63500, 53900, 59900, 59800, 57900, 79000, 80000, 75000, 85000, 54000, 63800, 57000, 61000, 58600)
  
) 

data2
#>         State state_abbriviation           City
#> 1  Washington                 WA         Seatle
#> 2     Florida                 FL          Tampa
#> 3    Nebraska                 NE        Lincoln
#> 4     Indiana                 IN   Indianapolis
#> 5     Florida                 FL          Miami
#> 6  California                 CA    Los Angeles
#> 7    New York                 NY       New York
#> 8    New York                 NY         Ithaca
#> 9  California                 CA  San Francisco
#> 10   Michigan                 MI        Detroit
#> 11      Texas                 TX         Dallas
#> 12       Ohio                 OH      Cleveland
#> 13    Arizona                 AZ        Phoenix
#> 14       Utah                 UT Salt Lake City
#>    Average_salary
#> 1           63500
#> 2           53900
#> 3           59900
#> 4           59800
#> 5           57900
#> 6           79000
#> 7           80000
#> 8           75000
#> 9           85000
#> 10          54000
#> 11          63800
#> 12          57000
#> 13          61000
#> 14          58600
```
