
# Problem Set 4 {-}

&nbsp;


## Problem 1 {-}

In this problem use functions from the `apply()` family of functions whenever you think you need `loops`.

&nbsp;

1. Create a function (name it `fun1`) that takes three arguments _n_, _miu_, and _sd_ (where _n_ is the number of randomly generated numbers, _miu_ is the mean value of the distribution that numbers come from, and _sd_ is the standard deviation of that distribution) and does the following:

   * First it generates _n_ random numbers from a normal distribution with mean = _miu_ and standard deviation = _sd_
   * Then it populates an empty matrix as follows: if _n_ is divisible by 2 but not by 3, it fills a matrix by row, having 2 rows and _n/2_ columns; if _n_ is divisible by 3 but not by 2, it fills a matrix by column, having 3 columns and _n/3_ rows; if _n_ is divisible by 2 and by 3, it fills a matrix by row, having 6 rows and _n/6_ columns; else it fills by row and has only one column
   * And returns a vector of mean values of each column in the matrix if none of the randomly generated numbers are negative; it returns a vector of median values of each row in the matrix if some of the randomly generated numbers are negative.
  
  
   Test your function with (_n_ = 50, _miu_ = 0.5, _sd_ = 2)

&nbsp;

2. Create a function (name it `fun2`) that will take one argument _n_, which represents a number of trials in your simulation. Your function should simulate a process of rolling an unfair die with the following probability distribution: "1" - 0.1, "2" - 0.3, "3" - 0.2, "4" - 0.05, "5" - 0.3, "6" - 0.05. It should report the results of _n_ trials by returning the frequency table of the outcomes (for example, how many times you got "1", "2", and so on).

   Test your function with _n_ = 100.
   
  &nbsp; 
  
3. Create a function (name it `fun3`) that will take one argument _n_, which represents a number of trials in your simulation. Your function should simulate a process of rolling two fair dice. It should report the results of _n_ trials by returning vectors of outcomes from both dice (name them `Die1` and `Die2`, respectively) and a vector that compares outcomes obtained from `Die1` and `Die2` (name it `comparison`). `comparison` vector should be created as follows: it should be created using `mapply()` function and should be a factor with three levels ("Die1 > Die2", "Die1 < Die2", "Die1 = Die2"). For instance, if the outcome of `Die1` is 5 and the outcome of `Die2` is 4, then it should produce "Die1 > Die2". 

   Test your function with _n_ = 30.

  &nbsp;
  
  
## Problem 2 {-}

Once again, you will be working with the `ames_housing.csv` dataset. It contains information about the homes sold in Ames, Iowa, between 2006 and 2010. The dataset includes 18 variables and covers a wide range of home characteristics. For the purpose of this assignment, you are going to work with the following variables:


* **Sales_Price** - Sale Price
* **Neighborhood** - Physical locations within Ames city limits
* **Roof_Style** - Type of roof
* **Fence** - Fence quality
* **TotRms_AbvGrd** - Total rooms above grade (does not include bathrooms)
* **Gr_Liv_Area** - Above grade(ground) living area square feet



&nbsp;

1. John is a new real estate agent in the area. A friend of his, who worked in this area before, told him that the average price for houses sold in the area is \$210,000. John feels a bit skeptical about this claim and wants to test it. Perform an appropriate statistical procedure to test this claim. Use the $\alpha = 0.05$ significance level to make a conclusion. State the null and alternative hypotheses. What is the test statistic? What are the degrees of freedom? What is the p-value? What did you conclude?

&nbsp;

2. John has been in this industry for quite some time. Over the course of past 10 years, he's noticed that a type of roof that houses have can somehow define the fence quality. In other words, he thinks that these two features (`Roof_Style` and `Fence` variables in the dataset) are somehow related. Test his hypothesis based on the sample data at the  $\alpha = 0.01$ significance level. State the null and alternative hypotheses. What is the test statistic? What are the degrees of freedom? What is the p-value? What did you conclude?

&nbsp;

3. John is specifically interested in two neighborhoods: `North_Ames` and `College_Creek`. He did some research prior his arrival and he thinks that on average houses in the `College_Creek` neighborhood are \$50,000 more expensive than the houses sold in the `North_Ames` neighborhood. Test his hypothesis at the $\alpha = 0.02$ significance level. State the null and alternative hypotheses. What is the test statistic? What are the degrees of freedom? What is the p-value? What did you conclude?

&nbsp;

4. John decides to split all homes in the dataset into the following three groups based on the total number of rooms above the ground: `"2-4"`, `"5-8"`, and `"9 or more"`. He believes that 10\% of homes belong to the `"2-4"` category, 85\% belong to the `"5-8"` category, and the remaining 5\% belong to the `"9 or more"` category. Test his hypothesis using the appropriate statistical procedure at the $\alpha = 0.01$ significance level. State the null and alternative hypotheses. What is the test statistic? What are the degrees of freedom? What is the p-value? What did you conclude?

   Before you perform the test, you need to add a new variable to the dataset (name it `Rooms`) using the splitting rule proposed by John. In other words, you need to create a factor variable with 3 levels by converting the `TotRms_AbvGrd` variable. (Hint: you might want to check out the `case_when()` function from `dpyr` package).

&nbsp;

## Problem 3 {-}

The Tri-City Office Equipment Corporation sells an imported copier on a franchise basis and performs preventive maintenance and repair service on this copier. The data in **copier_maintenance.txt** (available on Courseworks) were collected from 45 recent calls on users to perform routine preventive maintenance service; for each observation, they recorded the number of copiers serviced (**Copiers**, predictor) and the total number of minutes spent by the service person (**Minutes**, response).

1. Fit the least squares linear regression model. 

&nbsp;

2. Display summary of the model obtained in part 1.

&nbsp;

3. Plot the data and overlay the linear regression function you obtained in part 1.

&nbsp;

4. Obtain a point estimate of the mean service time when 7 copiers are serviced. 

&nbsp;

5. Obtain a 95% confidence interval for the slope.

&nbsp;

6. Obtain a 95% confidence interval for the mean service time when 7 copiers are serviced.

&nbsp;

7. Obtain a 95% prediction interval for the mean service time when 7 copiers are serviced.



