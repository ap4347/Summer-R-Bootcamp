
# Problem Set 2 {-}

&nbsp;


You will be working with the datasets containing demographic information of midwest counties from 2000 US census. **Dataset_1**, **Dataset_2**, and **Dataset_3** are available on Courseworks.

&nbsp;

**Dataset_1** contains the following variables:

* **PID** - Unique county identifier
* **county** - County name
* **area** - Area of county (units unknown). This variable is spread across 5 columns (IL - WI)
* **poptotal** - Total population
* **state** - State to which county belongs to

&nbsp;

**Dataset_2** contains the following variables:

* **PID** - Unique county identifier
* **county** - County name
* **race** - Total population for each racial group (White, Black, American Indians, Asians, Other races)
* **inmetro** - A factor with levels 0 and 1 to indicate whether county considered in a metro area 
* **category** - Miscellaneous

&nbsp;

**Dataset_3** contains the following variables:

* **PID** - Unique county identifier
* **county** - County name
* **popadults** - Number of adults
* **perchsd** - Percent of population with high school diploma
* **percollege** - Percent of college educated population
* **percprof** - Percent of population with professional degree
* **percbelowpoverty** - Percent of population below poverty line
* **percchildbelowpovert** - Percent of children below poverty line
* **percadultpoverty** - Percent of adults below poverty line
* **percelderlypoverty** - Percent of elderly below poverty line

&nbsp;

Note: The original description of the dataset was not documented and the current descriptions here (provided by `tidyverse` package) are based on speculation.


&nbsp;


## Problem 1 {-}

1. In **Dataset_1** the `area` variable is spread across multiple columns that represent values of the `state` variable. Transform/Tidy the dataset as follows: move the column names (IL-WI) to the `state` variable and the column values to the `area` variable. Then, remove all the missing value from the dataset. Name the new dataset `data1`.

&nbsp;

2. In **Dataset_2** the `race` variable combines information about the total population for each racial group, given in following order: White, Black, American Indians, Asians, Other. Pull apart this column into multiple columns, by splitting wherever a separator character appers. Name these variables `popwhite`, `popblack`, `popamerindian`, `popasian`, and `popother`, respectively. Name the new dataset `data2`.

&nbsp;

3. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from `data1`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.
   
&nbsp;

4. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from `data2`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.


&nbsp;

5. Merge `data1` and `data2`: they should be joined by the `state` variable and the output result should contain all the observation from both `data1` and `data2`, regardless of whether they match or not. What are the dimensions of the output? How many missing values does it contain? 

   Repeat the above procedure again by joining the datasets by the `state` and `county` variables.
   
&nbsp;

6. Join `data1` and `data2` by the `state` and `county` variables such that the unmatched rows in either input dataset are not included in the result. Name the output dataset `data`.

&nbsp;

7. Remove `PID` and `category` from `data` by selecting all variables except these two. Then, remove all duplicates from the dataset.

&nbsp;

8. Add a new variable to the dataset (name it `popdensity`), which represents a population density in each county (in order to compute a population density you need to divide the total population by the corresponding area).

   Then, for each racial group, add a new variable to the dataset that will represent the percentage of the total population that belongs to this group (name them `percwhite`, `percblack`, `percamerindan`, `percasian`, and `percother`, respectively).

&nbsp;

9. Join `data` and `Dataset_3` by the `state` and `county` variables such that the unmatched rows in either input dataset are not included in the result.

&nbsp;

10. Add new variables to the dataset that correspond to the `percbelowpoverty` and `percadultpoverty` variables and represent the actual number of people that belong to these groups. Name these variables `popcbelowpoverty`, and `popcadultpoverty`, respectively.

&nbsp;

11. Move the `inmetro` variable to the end of the dataset; change the position of the `poptotal` variable so that it comes after the `area` variables; change the position of the `popdensity` variable so that it comes after the `poptotal` variables.

&nbsp;

12. What is the biggest/smallest state by the total population? What is the biggest/smallest state by the total area? What is the average population density in each state? In each state, compare the population densities of counties that are in metro area to counties that are not. Hint: you might want to use the grouping functions.

&nbsp;

13. In all states combined, what is the average percentage of each racial group? In each state separately, what is the average percentage of each racial group? In each state separately, compare the average percentage of each racial group in metro areas to non-metro areas. Discuss the results you obtained.

&nbsp;

14. For each, state calculate the average percentage of the total population who are below poverty. Now using the same measurement, compare the metro areas to non-metro areas in each state. What do you observe? Now filter out counties with less than 50000 population and repeat the previous step. What do you observe?

