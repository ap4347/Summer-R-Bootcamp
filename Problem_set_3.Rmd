
# Problem Set 3 {-}

&nbsp;

## Problem 1 (Use Base R) {-}

Download the `carseats` data set from Courseworks and import it into R (don't forget to convert all character variables into factors). It provides information about sales of child car seats at 400 different stores. It contains the following variables:

  &nbsp;

* `Sales` -  Unit sales (in thousands) at each location
* `Advertising` -  Local advertising budget for company at each location (in thousands of dollars)
* `Population` -  Population size in region (in thousands)
* `Price` -  Price company charges for car seats at each site
* `ShelveLoc` -  A factor with levels Bad, Good and Medium indicating the quality of the shelving location for the car seats at each site
* `Age` - Average age of the local population
* `Urban` -  A factor with levels No and Yes to indicate whether the store is in an urban or rural location
* `US` - A factor with levels No and Yes to indicate whether the store is in the US or not

  &nbsp;

1. Compare the average age of local population for the US and non-US stores by displaying their boxplots. Customize your boxplots as follows: add labels, change the colors, and add notches.

&nbsp;

2. Summarize the quality of shelving locations by displaying its barplot. Customize it as discussed in the previous question ( no notches here).

&nbsp;

3. Plot a side-by-side barplots displaying the frequency of `ShelveLoc` variable in urban and rural areas. Customize your plot as discussed above.

&nbsp;

4. Plot the `Sales` variable against the `Price` variable. Label the plot and axes accordingly, change the shape of points to triangular, change the color of points based on whether the store is located in urban (orange color) or rural (green color) area and add the corresponding legend to the plot, change the size of points to 0.9.

&nbsp;

5. Combine a histogram of the `Price` variable and a boxplot of the `Population` variable in one image. Customize both plots as discussed in part (1) (no notches for the histogram).


&nbsp;


## Problem 2 (Use ggplot2 Package) {-}


In this problem, you will be working with the `ames_housing.csv` dataset (available on Courseworks). It contains information about the homes sold in Ames, Iowa, between 2006 and 2010. The dataset includes 18 variables and covers a wide range of home characteristics. For the purpose of this assignment, you are going to work with the following variables:


* **Sales_Price** - Sale Price
* **Neighborhood** - Physical locations within Ames city limits
* **Roof_Style** - Type of roof
* **Fence** - Fence quality
* **TotRms_AbvGrd** - Total rooms above grade (does not include bathrooms)
* **Gr_Liv_Area** - Above grade(ground) living area square feet


&nbsp;

1. Plot a histogram of the `Sale_Price` variable: add labels (title, subtitle, x and y labels); adjust the limits of the x axis by adding new ticks to it (step size = 100,000) and changing the angle of ticks to 60; change the theme to minimal; change the colors of bins and bin outlines (it is up to you to pick colors); add a blue vertical line that represents the mean value of the variable. 

&nbsp;

2. Use a stacked barplot to visualize the relationship between these two categorical variables (make sure the bars have the same height); add labels to the plot (title, subtitle, x and y labels).

&nbsp;

3. Plot a boxplot of the `Sales_Price` variable reflecting the `North_Ames` and `College_Creek` neighborhoods; add black dots to these boxplots that represent the average prices in these groups; make boxplots transparent (use transparency rate of 0.45).

&nbsp;

4. Add a new variable to the dataset (name it `Rooms`) that will split all homes in the dataset into the following three groups based on the total number of rooms above the ground: `"2-4"`, `"5-8"`, and `"9 or more"`. In other words, you need to create a factor variable with 3 levels by converting the `TotRms_AbvGrd` variable. (Hint: you might want to check out the `case_when()` function from `dpyr` package).

   Plot a barplot of the `Rooms` variable: add labels to this barplot that display the exact frequency of each category. Plot another barplot of the `Rooms` variable with labels that display the frequency of each category as percentages. Now create a composition (assemble) of these plots (it is up to you to pick a layout). In other words, combine these barplots in one plot.

&nbsp;

5. Plot the `Sale_Price` variable (Y) against the `Gr_Liv_Area` variable (X): add labels to the scatterplot (title, subtitle, caption, x and y labels) and change their colors; change the size and shape of datapoints; change the color of datapoints based on the `Rooms` variable; move the legends to the left.

&nbsp;

6. Plot the `Sale_Price` variable (Y) against the `Gr_Liv_Area` variable (X) for each level of the `Rooms` variable separately, using facets. 




