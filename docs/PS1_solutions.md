
# PS 1 Solutions {-}

&nbsp;

## Problem 1 {-}

&nbsp;

1. Create vectors containing {3.1, 4.1, 5.1, 6.1, 7.1, 8.1} elements in three different ways using the following functions:  `c()`, `seq()` with a `by` argument, and `seq()` with a `length.out` argument. Name them `vector1`, `vector2`, and `vector3`, respectively.


```r
vector1 <- c(3.1, 4.1, 5.1, 6.1, 7.1, 8.1)

print(vector1)
#> [1] 3.1 4.1 5.1 6.1 7.1 8.1

vector2 <- seq(3.1, 8.1, by=1)

print(vector2)
#> [1] 3.1 4.1 5.1 6.1 7.1 8.1

vector3 <- seq(3.1, 8.1, length.out=6)

print(vector3)
#> [1] 3.1 4.1 5.1 6.1 7.1 8.1
```

&nbsp;

2. Add three new elements to `vector1`: 10, 20, 30. 10 should be the first element in the vector, 20 should be the 3rd element in the vector given that 10 has been already added to it, and 30 should be the 6th element in the vector given that 10 and 20 have been already added to the vector.


```r
vector1 <- append(vector1, 10, after=0)

vector1 <- append(vector1, 20, after=2)

vector1 <- append(vector1, 30, after=5)

print(vector1)
#> [1] 10.0  3.1 20.0  4.1  5.1 30.0  6.1  7.1  8.1
```

&nbsp;

3. Create a new vector containing {2, 3, 6, 10, 15, 18, 22, 25, 27, 30, 31, 35, 42} elements. Name it `vector4`. Extract/Select elements that are greater than 5 and are divisible by 3 using a logical statement and create a new vector `vector5` with these elements. Check whether element 27 is in `vector5` using a logical operator.


```r
vector4 <- c(2, 3, 6, 10, 15, 18, 22, 25, 27, 30, 31, 35, 42)

vector5 <- vector4[vector4>5 & vector4%%3==0]

print(vector5)
#> [1]  6 15 18 27 30 42

27 %in% vector5
#> [1] TRUE
```

&nbsp;


## Problem 2 {-}

&nbsp;

1. Create a list with the following elements: [1, 50, 88], ["yesterday", "today", "tomorrow"], 22.5, [33.8, 42], "class_0001". Name it `list1`. 


```r
list1 <- list(c(1, 50, 88), c("yesterday", "today", "tomorrow"), 22.5, c(33.8, 42), "class_0001")

print(list1)
#> [[1]]
#> [1]  1 50 88
#> 
#> [[2]]
#> [1] "yesterday" "today"     "tomorrow" 
#> 
#> [[3]]
#> [1] 22.5
#> 
#> [[4]]
#> [1] 33.8 42.0
#> 
#> [[5]]
#> [1] "class_0001"
```

&nbsp;

2. Apply `unlist()` function to `list1`. What are the data type and data structure of the output? What do you think why you got this specific data type? 


```r
unlist(list1)
#>  [1] "1"          "50"         "88"         "yesterday" 
#>  [5] "today"      "tomorrow"   "22.5"       "33.8"      
#>  [9] "42"         "class_0001"

class(unlist(list1))
#> [1] "character"

str(unlist(list1))
#>  chr [1:10] "1" "50" "88" "yesterday" "today" ...
```

The unlisted `list1` is a vector contains elements in "character" type. The `unlist` function returns vector in "character" type when the list consists of data in different types, such as `c(1, 50, 88)` and `c("yesterday", "today", "tomorrow")`.

&nbsp;

3. Create a new list (name it `list2`) by removing the third element of the first element of `list1`. Then extract/select the second and third elements of the second element of `list2`. 


```r
list2 <- list1

list2[[1]] <- list2[[1]][-3]

print(list2)
#> [[1]]
#> [1]  1 50
#> 
#> [[2]]
#> [1] "yesterday" "today"     "tomorrow" 
#> 
#> [[3]]
#> [1] 22.5
#> 
#> [[4]]
#> [1] 33.8 42.0
#> 
#> [[5]]
#> [1] "class_0001"

list2[[2]][c(2,3)]
#> [1] "today"    "tomorrow"
```

&nbsp;

4. Create a new list with the following elements: 23, "new", 45.7. Name it `list3`. Now create a new list (name it `list4`) by merging `list2` and `list3` with a `c()`. How many elements does `list4` contain (use a built-in function to count). Extract the first element of `list4` as a list and as a vector.


```r
list3 <- list(23, "new", 45.7)

print(list3)
#> [[1]]
#> [1] 23
#> 
#> [[2]]
#> [1] "new"
#> 
#> [[3]]
#> [1] 45.7

# merge

list4 <- c(list2, list3)

print(list4)
#> [[1]]
#> [1]  1 50
#> 
#> [[2]]
#> [1] "yesterday" "today"     "tomorrow" 
#> 
#> [[3]]
#> [1] 22.5
#> 
#> [[4]]
#> [1] 33.8 42.0
#> 
#> [[5]]
#> [1] "class_0001"
#> 
#> [[6]]
#> [1] 23
#> 
#> [[7]]
#> [1] "new"
#> 
#> [[8]]
#> [1] 45.7

length(list4)
#> [1] 8

# Extract as a list

list(list4[[1]])
#> [[1]]
#> [1]  1 50

# Extract as a vector

list4[[1]]
#> [1]  1 50
```

&nbsp;


## Problem 3 {-}

&nbsp;

1. Create a data frame (name it `df1`) with the following variables:


   * `Name` - {"James", "Linda", "Stacy", "Mary", "Tom", "Anna", "Bob", "Jeniffer", "Lucas", "Amy", "Jim"}
   * `Major` - {"Math", "Math", "Genetics", "Statistics", "Accounting", "Art", "Music", "Business", "Finance", "Finance", "Math"}
   * `Grad_Year` - {2023, 2025, 2025, 2024, 2026, 2024, 2025, 2025, 2023, 2026, 2024}
   * `GPA` - {3.9, 3.75, 4.0, 4.0, 3.4, 3.9, 3.3, 3.8, 3.55, 4.0, 3.6}
   

```r
Name <- c("James", "Linda", "Stacy", "Mary", "Tom", "Anna", "Bob", "Jeniffer", "Lucas", "Amy", "Jim")

Major <- c("Math", "Math", "Genetics", "Statistics", "Accounting", "Art", "Music", "Business", "Finance", "Finance", "Math")

Grad_Year <- c(2023, 2025, 2025, 2024, 2026, 2024, 2025, 2025, 2023, 2026, 2024)

GPA <- c(3.9, 3.75, 4.0, 4.0, 3.4, 3.9, 3.3, 3.8, 3.55, 4.0, 3.6)

df1 <- data.frame(Name, Major, Grad_Year, GPA)

print(df1)
#>        Name      Major Grad_Year  GPA
#> 1     James       Math      2023 3.90
#> 2     Linda       Math      2025 3.75
#> 3     Stacy   Genetics      2025 4.00
#> 4      Mary Statistics      2024 4.00
#> 5       Tom Accounting      2026 3.40
#> 6      Anna        Art      2024 3.90
#> 7       Bob      Music      2025 3.30
#> 8  Jeniffer   Business      2025 3.80
#> 9     Lucas    Finance      2023 3.55
#> 10      Amy    Finance      2026 4.00
#> 11      Jim       Math      2024 3.60
```
   
&nbsp;
 

2. After you created `df1`, capitalize its column names. Get a 6-number summary of `GPA` column. What is a data type of `GRAD_YEAR` column? Convert it into the correct data structure. Display the frequency of its elements.


```r
colnames(df1) <- c("NAME", "MAJOR", "GRAD_YEAR", "GPA")

summary(df1$GPA)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>   3.300   3.575   3.800   3.745   3.950   4.000

class(df1$GRAD_YEAR)
#> [1] "numeric"

df1$GRAD_YEAR <- as.factor(df1$GRAD_YEAR)

summary(df1$GRAD_YEAR)
#> 2023 2024 2025 2026 
#>    2    3    4    2
```

`GRAD_YEAR` column should be factor type, since it represents meaningful year number, not simply numbers.

&nbsp;

3. Use a simple `ifelse` statement to add a new column `NEXT_YEAR` to the `df1`. This would be a boolean column, indicating `TRUE` if a student is graduating next year (2024) and `FALSE` if not (Check `GRAD_YEAR` column to see what year a student plans to graduate).


```r
df1$NEXT_YEAR <- ifelse(df1$GRAD_YEAR==2024, TRUE, FALSE)

print(df1)
#>        NAME      MAJOR GRAD_YEAR  GPA NEXT_YEAR
#> 1     James       Math      2023 3.90     FALSE
#> 2     Linda       Math      2025 3.75     FALSE
#> 3     Stacy   Genetics      2025 4.00     FALSE
#> 4      Mary Statistics      2024 4.00      TRUE
#> 5       Tom Accounting      2026 3.40     FALSE
#> 6      Anna        Art      2024 3.90      TRUE
#> 7       Bob      Music      2025 3.30     FALSE
#> 8  Jeniffer   Business      2025 3.80     FALSE
#> 9     Lucas    Finance      2023 3.55     FALSE
#> 10      Amy    Finance      2026 4.00     FALSE
#> 11      Jim       Math      2024 3.60      TRUE
```

&nbsp;

4. Extract/Select all students in the `df1` who is majoring in Math and is not going to graduate this year (2023).


```r
df1[df1$MAJOR=="Math" & df1$GRAD_YEAR!="2023", ]
#>     NAME MAJOR GRAD_YEAR  GPA NEXT_YEAR
#> 2  Linda  Math      2025 3.75     FALSE
#> 11   Jim  Math      2024 3.60      TRUE
```

&nbsp;


## Problem 4 {-}

&nbsp;

1. Create a matrix with 5 columns filled by columns with the following elements: 10, 3, 6, 23, -5, -4, 13, 17, 5, 6, -7, -10, 13, 39, 20, 2, 1, 9, 11, -22, 23, -15, -3, 6, 12. Name it `matrix1`.


```r
matrix1 <- matrix(c(10, 3, 6, 23, -5, -4, 13, 17, 5, 6, -7, -10, 13, 39, 20, 2, 1, 9, 11, -22, 23, -15, -3, 6, 12), ncol=5)

print(matrix1)
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]   10   -4   -7    2   23
#> [2,]    3   13  -10    1  -15
#> [3,]    6   17   13    9   -3
#> [4,]   23    5   39   11    6
#> [5,]   -5    6   20  -22   12
```

&nbsp;

2. Use a `For loop` to replace elements of `matrix1` as follows: if an element has a negative value, replace it with 0, if an element is greater than or equal to 10, replace it with 10, and if an element is greater than or equal to 0 and less than 10, replace it with 5.


```r
for (i in 1:dim(matrix1)[1]) {
  
  for (j in 1:dim(matrix1)[2]) {
    
    if (matrix1[i,j] < 0) {
      
      matrix1[i, j] = 0
      
    }
    
    else if (matrix1[i,j] >= 10) {
      
      matrix1[i,j] = 10
      
    }
    
    else {
      
      matrix1[i,j] = 5
    }
  }
}

print(matrix1)
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]   10    0    0    5   10
#> [2,]    5   10    0    5    0
#> [3,]    5   10   10    5    0
#> [4,]   10    5   10   10    5
#> [5,]    0    5   10    0   10
```

&nbsp;

3. Create an empty vector `vector6`. Use a `While loop` to populate `vector6` as follows: populate `vector6` with odd numbers that are greater than 0 and less than 30 skipping odd numbers that are divisible by 3.


```r
vector6 <- c()

i <- 0

while (i < 30) {
  
  i <- i + 1
  
  if (i%%2==0 || i%%3==0) {
    
    next
    
  }
  
  vector6 <- c(vector6, i)
  
}

print(vector6)
#>  [1]  1  5  7 11 13 17 19 23 25 29
```

&nbsp;


## Problem 5 {-}

&nbsp;

1. Create a function (name it `fun1`) that will take a numeric vector as input and will extract elements of the input vector that are greater than 10. Do it in two ways: using `for loop` combined with conditional statement, and without it (using logical and extraction operators). Test your function with the following vector: `[1, 4, 45, 23, 7, 9, 12, 15, 33]`


```r
vector <- c(1, 4, 45, 23, 7, 9, 12, 15, 33)

fun1 <- function(vec) {
  
  result <- c()
  
  for (i in 1:length(vec)) {
    
    if (vec[i] > 10) {
      
      result <- c(result, vec[i])
      
    }
  }
  
  return(result)
}

fun1(vector)
#> [1] 45 23 12 15 33

fun1 <- function(vec) {
  
  return(vec[vec>10])
  
}

fun1(vector)
#> [1] 45 23 12 15 33
```

&nbsp;

2. Create a function (name it `fun2`) that will take two matrices as inputs (mat1 and mat2) and will produce another matrix that has its elements populated as follows: if an element in `mat1` is greater than the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Greater than"`; if an element in `mat1` is less than the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Less than"`; and if an element in `mat1` is equal to the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Equal to"`.

   For example, if `mat1[1, 1] = 10` and `mat2[1, 1] = 5`, then the output matrix will have `"Greater than"` element at `[1, 1]` position. Test your function with the following matrices: [1, 4, 9, 5, 2, 7, 4, 3, 10], 3 rows and filled by row; [2, 3, 10, 9, 1, 4, 4, 3, 9], 3 rows and filled by row.


```r
mat1 <- matrix(c(1, 4, 9, 5, 2, 7, 4, 3, 10), nrow=3, byrow=TRUE)

mat2 <- matrix(c(2, 3, 10, 9, 1, 4, 4, 3, 9), nrow=3, byrow=TRUE)

fun2 <- function(mat1, mat2) {
  
  mat3 <- matrix(nrow=dim(mat1)[1], ncol=dim(mat1)[2])
  
  for (i in 1:dim(mat1)[1]) {
    
    for (j in 1:dim(mat1)[2]) {
      
      if (mat1[i,j]>mat2[i,j]) {
        
        mat3[i,j] <- "Greater than"
        
      }
      
      else if (mat1[i,j]<mat2[i,j]) {
        
        mat3[i,j] <- "Less than"
      }
      
      else {
        
        mat3[i,j] <- "Equal to"
      }
    }
  }
  
  return(mat3)
}

fun2(mat1, mat2)
#>      [,1]        [,2]           [,3]          
#> [1,] "Less than" "Greater than" "Less than"   
#> [2,] "Less than" "Greater than" "Greater than"
#> [3,] "Equal to"  "Equal to"     "Greater than"
```
