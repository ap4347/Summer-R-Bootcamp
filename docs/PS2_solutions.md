
# PS 2 Solutions {-}

&nbsp;


```r

library(tidyverse)
#> ── Attaching core tidyverse packages ──── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   3.5.0     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
#> ✔ purrr     1.0.2     
#> ── Conflicts ────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

Dataset_1 <- as_tibble(read.csv("C:/Users/alexp/OneDrive/Desktop/R Bootcamp/R_bootcamp/Dataset_1.csv"))

Dataset_2 <- as_tibble(read.csv("C:/Users/alexp/OneDrive/Desktop/R Bootcamp/R_bootcamp/Dataset_2.csv"))

Dataset_3 <- as_tibble(read.csv("C:/Users/alexp/OneDrive/Desktop/R Bootcamp/R_bootcamp/Dataset_3.csv"))
```

&nbsp;

1. In **Dataset_1** the `area` variable is spread across multiple columns that represent values of the `state` variable. Transform/Tidy the dataset as follows: move the column names (IL-WI) to the `state` variable and the column values to the `area` variable. Then, remove all the missing value from the dataset. Name the new dataset `data1`.


```r

data1 <- Dataset_1 %>%
  pivot_longer(IL:WI, names_to="state", values_to="area", values_drop_na=T)
data1
#> # A tibble: 457 × 5
#>      PID county    poptotal state  area
#>    <int> <chr>        <int> <chr> <dbl>
#>  1   561 ADAMS        66090 IL    0.052
#>  2   562 ALEXANDER    10626 IL    0.014
#>  3   563 BOND         14991 IL    0.022
#>  4   564 BOONE        30806 IL    0.017
#>  5   565 BROWN         5836 IL    0.018
#>  6   566 BUREAU       35688 IL    0.05 
#>  7   567 CALHOUN       5322 IL    0.017
#>  8   568 CARROLL      16805 IL    0.027
#>  9   569 CASS         13437 IL    0.024
#> 10   570 CHAMPAIGN   173025 IL    0.058
#> # ℹ 447 more rows
```

&nbsp;

2. In **Dataset_2** the `race` variable combines information about the total population for each racial group, given in following order: White, Black, American Indians, Asians, Other. Pull apart this column into multiple columns, by splitting wherever a separator character appers. Name these variables `popwhite`, `popblack`, `popamerindian`, `popasian`, and `popother`, respectively. Name the new dataset `data2`.


```r
data2 <- Dataset_2 %>%
  separate(race, into=c("popwhite", "popblack", "popamerindian", "popasian", "popother"), sep="/", convert=T)
data2
#> # A tibble: 487 × 9
#>    county    state popwhite popblack popamerindian popasian
#>    <chr>     <chr>    <int>    <int>         <int>    <int>
#>  1 ADAMS     IL       63917     1702            98      249
#>  2 ALEXANDER IL        7054     3496            19       48
#>  3 BOND      IL       14477      429            35       16
#>  4 BOONE     IL       29344      127            46      150
#>  5 BROWN     IL        5264      547            14        5
#>  6 BUREAU    IL       35157       50            65      195
#>  7 CALHOUN   IL        5298        1             8       15
#>  8 CARROLL   IL       16519      111            30       61
#>  9 CASS      IL       13384       16             8       23
#> 10 CHAMPAIGN IL      146506    16559           331     8033
#> # ℹ 477 more rows
#> # ℹ 3 more variables: popother <int>, inmetro <int>,
#> #   category <chr>
```

&nbsp;

3. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from `data1`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.
   

```r
out3_1 <- data1 %>%
  left_join(data2, by="state")
#> Warning in left_join(., data2, by = "state"): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out3_1
#> # A tibble: 46,825 × 13
#>      PID county.x poptotal state  area county.y  popwhite
#>    <int> <chr>       <int> <chr> <dbl> <chr>        <int>
#>  1   561 ADAMS       66090 IL    0.052 ADAMS        63917
#>  2   561 ADAMS       66090 IL    0.052 ALEXANDER     7054
#>  3   561 ADAMS       66090 IL    0.052 BOND         14477
#>  4   561 ADAMS       66090 IL    0.052 BOONE        29344
#>  5   561 ADAMS       66090 IL    0.052 BROWN         5264
#>  6   561 ADAMS       66090 IL    0.052 BUREAU       35157
#>  7   561 ADAMS       66090 IL    0.052 CALHOUN       5298
#>  8   561 ADAMS       66090 IL    0.052 CARROLL      16519
#>  9   561 ADAMS       66090 IL    0.052 CASS         13384
#> 10   561 ADAMS       66090 IL    0.052 CHAMPAIGN   146506
#> # ℹ 46,815 more rows
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <chr>
dim_desc(out3_1)
#> [1] "[46,825 x 13]"
out3_1 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 13
#>     PID county.x poptotal state  area county.y popwhite
#>   <int>    <int>    <int> <int> <int>    <int>    <int>
#> 1     0        0        0     0     0        0        0
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <int>
```


```r
out3_2 <- data1 %>%
  left_join(data2, by=c("state", "county"))
#> Warning in left_join(., data2, by = c("state", "county")): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out3_2
#> # A tibble: 527 × 12
#>      PID county    poptotal state  area popwhite popblack
#>    <int> <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1   561 ADAMS        66090 IL    0.052    63917     1702
#>  2   561 ADAMS        66090 IL    0.052    63917     1702
#>  3   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  4   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  5   563 BOND         14991 IL    0.022    14477      429
#>  6   563 BOND         14991 IL    0.022    14477      429
#>  7   564 BOONE        30806 IL    0.017    29344      127
#>  8   564 BOONE        30806 IL    0.017    29344      127
#>  9   565 BROWN         5836 IL    0.018     5264      547
#> 10   565 BROWN         5836 IL    0.018     5264      547
#> # ℹ 517 more rows
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <chr>
dim_desc(out3_2)
#> [1] "[527 x 12]"
out3_2 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 12
#>     PID county poptotal state  area popwhite popblack
#>   <int>  <int>    <int> <int> <int>    <int>    <int>
#> 1     0      0        0     0     0        0        0
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <int>
```
   
&nbsp;

4. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from `data2`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.


```r
out4_1 <- data1 %>%
  right_join(data2, by="state")
#> Warning in right_join(., data2, by = "state"): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out4_1
#> # A tibble: 46,825 × 13
#>      PID county.x poptotal state  area county.y  popwhite
#>    <int> <chr>       <int> <chr> <dbl> <chr>        <int>
#>  1   561 ADAMS       66090 IL    0.052 ADAMS        63917
#>  2   561 ADAMS       66090 IL    0.052 ALEXANDER     7054
#>  3   561 ADAMS       66090 IL    0.052 BOND         14477
#>  4   561 ADAMS       66090 IL    0.052 BOONE        29344
#>  5   561 ADAMS       66090 IL    0.052 BROWN         5264
#>  6   561 ADAMS       66090 IL    0.052 BUREAU       35157
#>  7   561 ADAMS       66090 IL    0.052 CALHOUN       5298
#>  8   561 ADAMS       66090 IL    0.052 CARROLL      16519
#>  9   561 ADAMS       66090 IL    0.052 CASS         13384
#> 10   561 ADAMS       66090 IL    0.052 CHAMPAIGN   146506
#> # ℹ 46,815 more rows
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <chr>
dim_desc(out4_1)
#> [1] "[46,825 x 13]"
out4_1 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 13
#>     PID county.x poptotal state  area county.y popwhite
#>   <int>    <int>    <int> <int> <int>    <int>    <int>
#> 1     0        0        0     0     0        0        0
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <int>
```



```r
out4_2 <- data1 %>%
  right_join(data2, by=c("state","county"))
#> Warning in right_join(., data2, by = c("state", "county")): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out4_2
#> # A tibble: 527 × 12
#>      PID county    poptotal state  area popwhite popblack
#>    <int> <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1   561 ADAMS        66090 IL    0.052    63917     1702
#>  2   561 ADAMS        66090 IL    0.052    63917     1702
#>  3   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  4   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  5   563 BOND         14991 IL    0.022    14477      429
#>  6   563 BOND         14991 IL    0.022    14477      429
#>  7   564 BOONE        30806 IL    0.017    29344      127
#>  8   564 BOONE        30806 IL    0.017    29344      127
#>  9   565 BROWN         5836 IL    0.018     5264      547
#> 10   565 BROWN         5836 IL    0.018     5264      547
#> # ℹ 517 more rows
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <chr>
dim_desc(out4_2)
#> [1] "[527 x 12]"
out4_2 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 12
#>     PID county poptotal state  area popwhite popblack
#>   <int>  <int>    <int> <int> <int>    <int>    <int>
#> 1     0      0        0     0     0        0        0
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <int>
```

&nbsp;

5. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from both `data1` and `data2`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.
   

```r
out5_1 <- data1 %>%
  full_join(data2, by="state")
#> Warning in full_join(., data2, by = "state"): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out5_1
#> # A tibble: 46,825 × 13
#>      PID county.x poptotal state  area county.y  popwhite
#>    <int> <chr>       <int> <chr> <dbl> <chr>        <int>
#>  1   561 ADAMS       66090 IL    0.052 ADAMS        63917
#>  2   561 ADAMS       66090 IL    0.052 ALEXANDER     7054
#>  3   561 ADAMS       66090 IL    0.052 BOND         14477
#>  4   561 ADAMS       66090 IL    0.052 BOONE        29344
#>  5   561 ADAMS       66090 IL    0.052 BROWN         5264
#>  6   561 ADAMS       66090 IL    0.052 BUREAU       35157
#>  7   561 ADAMS       66090 IL    0.052 CALHOUN       5298
#>  8   561 ADAMS       66090 IL    0.052 CARROLL      16519
#>  9   561 ADAMS       66090 IL    0.052 CASS         13384
#> 10   561 ADAMS       66090 IL    0.052 CHAMPAIGN   146506
#> # ℹ 46,815 more rows
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <chr>
dim_desc(out5_1)
#> [1] "[46,825 x 13]"
out5_1 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 13
#>     PID county.x poptotal state  area county.y popwhite
#>   <int>    <int>    <int> <int> <int>    <int>    <int>
#> 1     0        0        0     0     0        0        0
#> # ℹ 6 more variables: popblack <int>, popamerindian <int>,
#> #   popasian <int>, popother <int>, inmetro <int>,
#> #   category <int>
```



```r
out5_2 <- data1 %>%
  full_join(data2, by=c("state","county"))
#> Warning in full_join(., data2, by = c("state", "county")): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
out5_2
#> # A tibble: 527 × 12
#>      PID county    poptotal state  area popwhite popblack
#>    <int> <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1   561 ADAMS        66090 IL    0.052    63917     1702
#>  2   561 ADAMS        66090 IL    0.052    63917     1702
#>  3   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  4   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  5   563 BOND         14991 IL    0.022    14477      429
#>  6   563 BOND         14991 IL    0.022    14477      429
#>  7   564 BOONE        30806 IL    0.017    29344      127
#>  8   564 BOONE        30806 IL    0.017    29344      127
#>  9   565 BROWN         5836 IL    0.018     5264      547
#> 10   565 BROWN         5836 IL    0.018     5264      547
#> # ℹ 517 more rows
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <chr>
dim_desc(out5_2)
#> [1] "[527 x 12]"
out5_2 %>%
  summarize(across(everything(), ~sum(is.na(.))))
#> # A tibble: 1 × 12
#>     PID county poptotal state  area popwhite popblack
#>   <int>  <int>    <int> <int> <int>    <int>    <int>
#> 1     0      0        0     0     0        0        0
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <int>
```
   
&nbsp;

6. Join `data1` and `data2` by the `state` and `county` variables such that the unmatched rows in either input dataset are not included in the result. Name the output dataset `data`.


```r
data <- data1 %>%
  inner_join(data2, by=c("state","county"))
#> Warning in inner_join(., data2, by = c("state", "county")): Detected an unexpected many-to-many relationship between
#> `x` and `y`.
#> ℹ Row 1 of `x` matches multiple rows in `y`.
#> ℹ Row 1 of `y` matches multiple rows in `x`.
#> ℹ If a many-to-many relationship is expected, set
#>   `relationship = "many-to-many"` to silence this warning.
data
#> # A tibble: 527 × 12
#>      PID county    poptotal state  area popwhite popblack
#>    <int> <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1   561 ADAMS        66090 IL    0.052    63917     1702
#>  2   561 ADAMS        66090 IL    0.052    63917     1702
#>  3   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  4   562 ALEXANDER    10626 IL    0.014     7054     3496
#>  5   563 BOND         14991 IL    0.022    14477      429
#>  6   563 BOND         14991 IL    0.022    14477      429
#>  7   564 BOONE        30806 IL    0.017    29344      127
#>  8   564 BOONE        30806 IL    0.017    29344      127
#>  9   565 BROWN         5836 IL    0.018     5264      547
#> 10   565 BROWN         5836 IL    0.018     5264      547
#> # ℹ 517 more rows
#> # ℹ 5 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, category <chr>
```

&nbsp;

7. Remove `PID` and `category` from `data` by selecting all variables except these two. Then, remove all duplicates from the dataset.


```r
data <- data %>%
  select(!c(PID, category)) %>%
  distinct()
data
#> # A tibble: 437 × 10
#>    county    poptotal state  area popwhite popblack
#>    <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1 ADAMS        66090 IL    0.052    63917     1702
#>  2 ALEXANDER    10626 IL    0.014     7054     3496
#>  3 BOND         14991 IL    0.022    14477      429
#>  4 BOONE        30806 IL    0.017    29344      127
#>  5 BROWN         5836 IL    0.018     5264      547
#>  6 BUREAU       35688 IL    0.05     35157       50
#>  7 CALHOUN       5322 IL    0.017     5298        1
#>  8 CARROLL      16805 IL    0.027    16519      111
#>  9 CASS         13437 IL    0.024    13384       16
#> 10 CHAMPAIGN   173025 IL    0.058   146506    16559
#> # ℹ 427 more rows
#> # ℹ 4 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>
```

&nbsp;

8. Add a new variable to the dataset (name it `popdensity`), which represents a population density in each county (in order to compute a population density you need to divide the total population by the corresponding area).

   Then, for each racial group, add a new variable to the dataset that will represent the percentage of the total population that belongs to this group (name them `percwhite`, `percblack`, `percamerindan`, `percasian`, and `percother`, respectively).
   

```r
data <- data %>%
  mutate(popdensity=poptotal/area, 
         percwhite=100*popwhite/poptotal,
         percblack=100*popblack/poptotal,
         percamerindian=100*popamerindian/poptotal,
         percasian=100*popasian/poptotal,
         percother=100*popother/poptotal)
data[8:13]
#> # A tibble: 437 × 6
#>    popasian popother inmetro popdensity percwhite percblack
#>       <int>    <int>   <int>      <dbl>     <dbl>     <dbl>
#>  1      249      124       0   1270962.      96.7    2.58  
#>  2       48        9       0    759000       66.4   32.9   
#>  3       16       34       0    681409.      96.6    2.86  
#>  4      150     1139       1   1812118.      95.3    0.412 
#>  5        5        6       0    324222.      90.2    9.37  
#>  6      195      221       0    713760       98.5    0.140 
#>  7       15        0       0    313059.      99.5    0.0188
#>  8       61       84       0    622407.      98.3    0.661 
#>  9       23        6       0    559875       99.6    0.119 
#> 10     8033     1596       1   2983190.      84.7    9.57  
#> # ℹ 427 more rows
```

&nbsp;

9. Join `data` and `Dataset_3` by the `state` and `county` variables such that the unmatched rows in either input dataset are not included in the result.


```r
data3 <- Dataset_3
data3
#> # A tibble: 437 × 10
#>    county    state popadults perchsd percollege percprof
#>    <chr>     <chr>     <int>   <dbl>      <dbl>    <dbl>
#>  1 ADAMS     IL        43298    75.1       19.6     4.36
#>  2 ALEXANDER IL         6724    59.7       11.2     2.87
#>  3 BOND      IL         9669    69.3       17.0     4.49
#>  4 BOONE     IL        19272    75.5       17.3     4.20
#>  5 BROWN     IL         3979    68.9       14.5     3.37
#>  6 BUREAU    IL        23444    76.6       18.9     3.28
#>  7 CALHOUN   IL         3583    62.8       11.9     3.21
#>  8 CARROLL   IL        11323    76.0       16.2     3.06
#>  9 CASS      IL         8825    72.3       14.1     3.21
#> 10 CHAMPAIGN IL        95971    87.5       41.3    17.8 
#> # ℹ 427 more rows
#> # ℹ 4 more variables: percbelowpoverty <dbl>,
#> #   percchildbelowpovert <dbl>, percadultpoverty <dbl>,
#> #   percelderlypoverty <dbl>
data <- data %>%
  inner_join(data3, by=c("state","county"))
data
#> # A tibble: 437 × 24
#>    county    poptotal state  area popwhite popblack
#>    <chr>        <int> <chr> <dbl>    <int>    <int>
#>  1 ADAMS        66090 IL    0.052    63917     1702
#>  2 ALEXANDER    10626 IL    0.014     7054     3496
#>  3 BOND         14991 IL    0.022    14477      429
#>  4 BOONE        30806 IL    0.017    29344      127
#>  5 BROWN         5836 IL    0.018     5264      547
#>  6 BUREAU       35688 IL    0.05     35157       50
#>  7 CALHOUN       5322 IL    0.017     5298        1
#>  8 CARROLL      16805 IL    0.027    16519      111
#>  9 CASS         13437 IL    0.024    13384       16
#> 10 CHAMPAIGN   173025 IL    0.058   146506    16559
#> # ℹ 427 more rows
#> # ℹ 18 more variables: popamerindian <int>, popasian <int>,
#> #   popother <int>, inmetro <int>, popdensity <dbl>,
#> #   percwhite <dbl>, percblack <dbl>, percamerindian <dbl>,
#> #   percasian <dbl>, percother <dbl>, popadults <int>,
#> #   perchsd <dbl>, percollege <dbl>, percprof <dbl>,
#> #   percbelowpoverty <dbl>, percchildbelowpovert <dbl>, …
```

&nbsp;

10. Add new variables to the dataset that correspond to the `percbelowpoverty` and `percadultpoverty` variables and represent the actual number of people that belong to these groups. Name these variables `popcbelowpoverty`, and `popcadultpoverty`, respectively.


```r
data <- data %>%
  mutate(popcbelowpoverty=poptotal*percbelowpoverty,
         popcadultpoverty=popadults*percadultpoverty)
data[24:26]
#> # A tibble: 437 × 3
#>    percelderlypoverty popcbelowpoverty popcadultpoverty
#>                 <dbl>            <dbl>            <dbl>
#>  1              12.4           869179.          476701.
#>  2              25.2           342628.          184141.
#>  3              12.7           180924.          104929.
#>  4               6.22          222081.          106690.
#>  5              19.2            78904.           44339.
#>  6              11.0           371142.          191755.
#>  7              21.1            80627.           46337.
#>  8               9.53          196799.          113536.
#>  9              13.7           186440.          105144.
#> 10               8.11         2694421.         1685513.
#> # ℹ 427 more rows
```

&nbsp;

11. Move the `inmetro` variable to the end of the dataset; change the position of the `poptotal` variable so that it comes after the `area` variables; change the position of the `popdensity` variable so that it comes after the `poptotal` variables.


```r
data <- data %>%
  relocate(inmetro, .after=last_col()) %>%
  relocate(poptotal, .after=area) %>%
  relocate(popdensity, .after=poptotal)
data[3:8]
#> # A tibble: 437 × 6
#>     area poptotal popdensity popwhite popblack popamerindian
#>    <dbl>    <int>      <dbl>    <int>    <int>         <int>
#>  1 0.052    66090   1270962.    63917     1702            98
#>  2 0.014    10626    759000      7054     3496            19
#>  3 0.022    14991    681409.    14477      429            35
#>  4 0.017    30806   1812118.    29344      127            46
#>  5 0.018     5836    324222.     5264      547            14
#>  6 0.05     35688    713760     35157       50            65
#>  7 0.017     5322    313059.     5298        1             8
#>  8 0.027    16805    622407.    16519      111            30
#>  9 0.024    13437    559875     13384       16             8
#> 10 0.058   173025   2983190.   146506    16559           331
#> # ℹ 427 more rows
data[23:26]
#> # A tibble: 437 × 4
#>    percelderlypoverty popcbelowpoverty popcadultpoverty
#>                 <dbl>            <dbl>            <dbl>
#>  1              12.4           869179.          476701.
#>  2              25.2           342628.          184141.
#>  3              12.7           180924.          104929.
#>  4               6.22          222081.          106690.
#>  5              19.2            78904.           44339.
#>  6              11.0           371142.          191755.
#>  7              21.1            80627.           46337.
#>  8               9.53          196799.          113536.
#>  9              13.7           186440.          105144.
#> 10               8.11         2694421.         1685513.
#> # ℹ 427 more rows
#> # ℹ 1 more variable: inmetro <int>
```

&nbsp;

12. What is the biggest/smallest state by the total population? What is the biggest/smallest state by the total area? What is the average population density in each state? In each state, compare the population densities of counties that are in metro area to counties that are not. Hint: you might want to use the grouping functions.

The state with minimum total population is "WI", the state with maximum total population is "IL".



```r
data %>%
  group_by(state) %>%
  summarise(tot_pop = sum(poptotal)) %>%
  arrange(tot_pop)
#> # A tibble: 5 × 2
#>   state  tot_pop
#>   <chr>    <int>
#> 1 WI     4891769
#> 2 IN     5544159
#> 3 MI     9295297
#> 4 OH    10847115
#> 5 IL    11430602
```

The state with minimum total area is "IN", the state with maximum total area is "MI".


```r
data %>%
  group_by(state) %>%
  summarise(tot_area = sum(area)) %>%
  arrange(tot_area)
#> # A tibble: 5 × 2
#>   state tot_area
#>   <chr>    <dbl>
#> 1 IN        2.13
#> 2 OH        2.42
#> 3 WI        3.29
#> 4 IL        3.30
#> 5 MI        3.36
```


```r
data %>%
  group_by(state) %>%
  summarise(avg_popdensity = mean(popdensity))
#> # A tibble: 5 × 2
#>   state avg_popdensity
#>   <chr>          <dbl>
#> 1 IL          2823731.
#> 2 IN          2573130.
#> 3 MI          3010809.
#> 4 OH          4639024.
#> 5 WI          2372694.
```


```r
data %>%
  group_by(state, inmetro) %>%
  summarise(avg_popdensity = mean(popdensity))
#> `summarise()` has grouped output by 'state'. You can
#> override using the `.groups` argument.
#> # A tibble: 10 × 3
#> # Groups:   state [5]
#>    state inmetro avg_popdensity
#>    <chr>   <int>          <dbl>
#>  1 IL          0        773783.
#>  2 IL          1       8241451.
#>  3 IN          0       1183804.
#>  4 IN          1       4638344.
#>  5 MI          0        743790.
#>  6 MI          1       8270292.
#>  7 OH          0       1506462.
#>  8 OH          1       8398098.
#>  9 WI          0        674527.
#> 10 WI          1       6787929.
```

&nbsp;

13. In all states combined, what is the average percentage of each racial group? In each state separately, what is the average percentage of each racial group? In each state separately, compare the average percentage of each racial group in metro areas to non-metro areas. Discuss the results you obtained.


```r
data %>%
  summarise(across(percwhite:percother, ~mean(.x)))
#> # A tibble: 1 × 5
#>   percwhite percblack percamerindian percasian percother
#>       <dbl>     <dbl>          <dbl>     <dbl>     <dbl>
#> 1      95.6      2.68          0.799     0.487     0.479
```


```r
data %>%
  group_by(state) %>%
  summarise(across(percwhite:percother, ~mean(.x)))
#> # A tibble: 5 × 6
#>   state percwhite percblack percamerindian percasian
#>   <chr>     <dbl>     <dbl>          <dbl>     <dbl>
#> 1 IL         95.0     3.65           0.174     0.564
#> 2 IN         97.2     1.89           0.222     0.383
#> 3 MI         94.4     3.07           1.37      0.507
#> 4 OH         95.4     3.51           0.184     0.433
#> 5 WI         95.8     0.822          2.52      0.556
#> # ℹ 1 more variable: percother <dbl>
```

Percentages of white are higher in non-metro area. Percentages of black are higher in metro area. Percentages of American indian are higher in non-metro area. Percentages of Asian are higher in metro area. Percentages of other race groups are higher in metro area.


```r
data %>%
  group_by(state, inmetro) %>%
  summarise(across(percwhite:percother, ~mean(.x)))
#> `summarise()` has grouped output by 'state'. You can
#> override using the `.groups` argument.
#> # A tibble: 10 × 7
#> # Groups:   state [5]
#>    state inmetro percwhite percblack percamerindian
#>    <chr>   <int>     <dbl>     <dbl>          <dbl>
#>  1 IL          0      96.5     2.70           0.169
#>  2 IL          1      90.9     6.17           0.186
#>  3 IN          0      98.4     0.881          0.233
#>  4 IN          1      95.4     3.39           0.206
#>  5 MI          0      96.5     1.06           1.73 
#>  6 MI          1      89.6     7.71           0.508
#>  7 OH          0      97.4     1.61           0.188
#>  8 OH          1      93.0     5.80           0.179
#>  9 WI          0      95.9     0.248          3.27 
#> 10 WI          1      95.4     2.31           0.564
#> # ℹ 2 more variables: percasian <dbl>, percother <dbl>
```


&nbsp;

14. For each, state calculate the average percentage of the total population who are below poverty. Now using the same measurement, compare the metro areas to non-metro areas in each state. What do you observe? Now filter out counties with less than 50000 population and repeat the previous step. What do you observe?



```r
data %>%
  group_by(state) %>%
  summarise(mean(percbelowpoverty))
#> # A tibble: 5 × 2
#>   state `mean(percbelowpoverty)`
#>   <chr>                    <dbl>
#> 1 IL                        13.1
#> 2 IN                        10.3
#> 3 MI                        14.2
#> 4 OH                        13.0
#> 5 WI                        11.9
```

Percentages below poverty are higher in non-metro area.


```r
data %>%
  group_by(state, inmetro) %>%
  summarise(mean(percbelowpoverty))
#> `summarise()` has grouped output by 'state'. You can
#> override using the `.groups` argument.
#> # A tibble: 10 × 3
#> # Groups:   state [5]
#>    state inmetro `mean(percbelowpoverty)`
#>    <chr>   <int>                    <dbl>
#>  1 IL          0                    14.4 
#>  2 IL          1                     9.56
#>  3 IN          0                    10.8 
#>  4 IN          1                     9.59
#>  5 MI          0                    15.5 
#>  6 MI          1                    11.3 
#>  7 OH          0                    14.3 
#>  8 OH          1                    11.5 
#>  9 WI          0                    13.0 
#> 10 WI          1                     9.01
```

The significance of the percentages of below-poverty in non-metro area higher than that of metro area becomes less.


```r
data %>%
  filter(poptotal >= 50000) %>%
  group_by(state, inmetro) %>%
  summarise(mean(percbelowpoverty))
#> `summarise()` has grouped output by 'state'. You can
#> override using the `.groups` argument.
#> # A tibble: 10 × 3
#> # Groups:   state [5]
#>    state inmetro `mean(percbelowpoverty)`
#>    <chr>   <int>                    <dbl>
#>  1 IL          0                    15.7 
#>  2 IL          1                    10.6 
#>  3 IN          0                    10.6 
#>  4 IN          1                    10.6 
#>  5 MI          0                    13.0 
#>  6 MI          1                    11.3 
#>  7 OH          0                    13.8 
#>  8 OH          1                    11.8 
#>  9 WI          0                     8.70
#> 10 WI          1                     8.82
```
