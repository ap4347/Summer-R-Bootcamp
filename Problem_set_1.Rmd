
# Problem Set 1 {-}

&nbsp;

## Problem 1 {-}

&nbsp;

1. Create vectors containing {3.1, 4.1, 5.1, 6.1, 7.1, 8.1} elements in three different ways using the following functions:  `c()`, `seq()` with a `by` argument, and `seq()` with a `length.out` argument. Name them `vector1`, `vector2`, and `vector3`, respectively.

&nbsp;

2. Add three new elements to `vector1`: 10, 20, 30. 10 should be the first element in the vector, 20 should be the 3rd element in the vector given that 10 has been already added to it, and 30 should be the 6th element in the vector given that 10 and 20 have been already added to the vector.

&nbsp;

3. Create a new vector containing {2, 3, 6, 10, 15, 18, 22, 25, 27, 30, 31, 35, 42} elements. Name it `vector4`. Extract/Select elements that are greater than 5 and are divisible by 3 using a logical statement and create a new vector `vector5` with these elements. Check whether element 27 is in `vector5` using a logical operator.

&nbsp;


## Problem 2 {-}

&nbsp;

1. Create a list with the following elements: [1, 50, 88], ["yesterday", "today", "tomorrow"], 22.5, [33.8, 42], "class_0001". Name it `list1`. 

&nbsp;

2. Apply `unlist()` function to `list1`. What are the data type and data structure of the output? What do you think why you got this specific data type? 

&nbsp;

3. Create a new list (name it `list2`) by removing the third element of the first element of `list1`. Then extract/select the second and third elements of the second element of `list2`. 

&nbsp;

4. Create a new list with the following elements: 23, "new", 45.7. Name it `list3`. Now create a new list (name it `list4`) by merging `list2` and `list3` with a `c()`. How many elements does `list4` contain (use a built-in function to count). Extract the first element of `list4` as a list and as a vector.

&nbsp;


## Problem 3 {-}

&nbsp;

1. Create a data frame (name it `df1`) with the following variables:


   * `Name` - {"James", "Linda", "Stacy", "Mary", "Tom", "Anna", "Bob", "Jeniffer", "Lucas", "Amy", "Jim"}
   * `Major` - {"Math", "Math", "Genetics", "Statistics", "Accounting", "Art", "Music", "Business", "Finance", "Finance", "Math"}
   * `Grad_Year` - {2023, 2025, 2025, 2024, 2026, 2024, 2025, 2025, 2023, 2026, 2024}
   * `GPA` - {3.9, 3.75, 4.0, 4.0, 3.4, 3.9, 3.3, 3.8, 3.55, 4.0, 3.6}
   
&nbsp;
 

2. After you created `df1`, capitalize its column names. Get a 6-number summary of `GPA` column. What is a data type of `GRAD_YEAR` column? What should it be? Convert it into the correct data type. Display the frequency of its elements.

&nbsp;

3. Use a simple `ifelse` statement to add a new column `NEXT_YEAR` to the `df1`. This would be a boolean column, indicating `TRUE` if a student is graduating next year (2024) and `FALSE` if not (Check `GRAD_YEAR` column to see what year a student plans to graduate).

&nbsp;

4. Extract/Select all students in the `df1` who is majoring in Math and is not going to graduate this year (2023).


&nbsp;


## Problem 4 {-}

&nbsp;

1. Create a matrix with 5 columns filled by columns with the following elements: 10, 3, 6, 23, -5, -4, 13, 17, 5, 6, -7, -10, 13, 39, 20, 2, 1, 9, 11, -22, 23, -15, -3, 6, 12. Name it `matrix1`.

&nbsp;

2. Use a `For loop` to replace elements of `matrix1` as follows: if an element has a negative value, replace it with 0, if an element is greater than or equal to 10, replace it with 10, and if an element is greater than or equal to 0 and less than 10, replace it with 5.

&nbsp;

3. Create an empty vector `vector6`. Use a `While loop` to populate `vector6` as follows: populate `vector6` with odd numbers that are greater than 0 and less than 30 skipping odd numbers that are divisible by 3.

&nbsp;


## Problem 5 {-}

&nbsp;

1. Create a function (name it `fun1`) that will take a numeric vector as input and will extract elements of the input vector that are greater than 10. Do it in two ways: using `for loop` combined with conditional statement, and without it (using logical and extraction operators). Test your function with the following vector: `[1, 4, 45, 23, 7, 9, 12, 15, 33]`

&nbsp;

2. Create a function (name it `fun2`) that will take two matrices as inputs (mat1 and mat2) and will produce another matrix that has its elements populated as follows: if an element in `mat1` is greater than the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Greater than"`; if an element in `mat1` is less than the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Less than"`; and if an element in `mat1` is equal to the corresponding element in `mat2`, then the corresponding element in the output matrix would be `"Equal to"`.

   For example, if `mat1[1, 1] = 10` and `mat2[1, 1] = 5`, then the output matrix will have `"Greater than"` element at `[1, 1]` position. Test your function with the following matrices: [1, 4, 9, 5, 2, 7, 4, 3, 10], 3 rows and filled by row; [2, 3, 10, 9, 1, 4, 4, 3, 9], 3 rows and filled by row.

   
