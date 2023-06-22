
# (PART) **Week** 3 {-}

# Module 8 {-} 

&nbsp;

## Data Visualization (Base R) {-}

We have already learned how to use R built-in functions to compute basic numerical summaries of data such as mean, median, IQR, quantiles, and so on. In this module, we are going to learn how to get summary of your data via visualization. 

**Data visualization** plays a crucial role in data analysis. Prior to building statistical models or performing any other statistical procedure, you will want to plot your data as it will suggest what statistical tools might be more appropriate. In this module, you will learn how to visualize data in `Base R`. Later, we will learn how to use `ggplot2` package to do so. It is more versatile and has advanced visualization tools.

We will be using the same data set as before (**Lung Capacity** data set), which is available on Courseworks.


```r

data <- read.table(file = "C:/Users/alexp/OneDrive/Desktop/R Bootcamp/R_bootcamp/lung_capacity.txt", header = T, sep = "", stringsAsFactors = TRUE)
```

### Histograms {-}

Histograms display a distribution of numerical data. They represent the frequencies of values of a variable bucketed into ranges. The function `hist()` is used to plot histograms. Let's plot a histogram of the `Age` variable:


```r

hist(data$Age)
```

<img src="Module_8_files/figure-html/unnamed-chunk-2-1.png" width="672" />

You can change labels of a histogram by passing `xlab`, `ylab`, and `main` arguments to the function:



```r

hist(data$Age,
     
     xlab = "AGE",
     
     ylab = "FREQUENCY",
     
     main = "Histogram of AGE")
```

<img src="Module_8_files/figure-html/unnamed-chunk-3-1.png" width="672" />

The x-axis contains a range of values of the variable. Histograms divide it into intervals known as bins. Histograms are tricky because it depends on the subjective judgments of where exactly to put the bin margins that what graph you will be looking at. Wide bins produce one picture, narrow bins produce a different picture, and unequal bins produce confusion. You can choose a number of bins to display by passing a `break` argument to the function. In the example below, you specify the starting and ending points of each bin (for instance, 0 to 2, 2 to 4, and so on):



```r

hist(data$Age,
     
     xlab = "AGE",
     
     ylab = "FREQUENCY",
     
     main = "Histogram of AGE",
     
     breaks = seq(0, 20, 2)
     
     )
```

<img src="Module_8_files/figure-html/unnamed-chunk-4-1.png" width="672" />


You can change the color of bins and corresponding borders:



```r

hist(data$Age,
     
     xlab = "AGE",
     
     ylab = "FREQUENCY",
     
     main = "Histogram of AGE",
     
     breaks = seq(0, 20, 2),
     
     col = "lightpink",
     
     border = "black")
```

<img src="Module_8_files/figure-html/unnamed-chunk-5-1.png" width="672" />


You can display specific parts of a histogram by passing `xlim()` arguments. It will display the part of a histogram that corresponds to the specified range:



```r

hist(data$Age,
     
     xlab = "AGE",
     
     ylab = "FREQUENCY",
     
     main = "Histogram of AGE",
     
     breaks = seq(0, 20, 2),
     
     col = "lightpink",
     
     border = "black",
     
     xlim = c(0, 12)
     
     )
```

<img src="Module_8_files/figure-html/unnamed-chunk-6-1.png" width="672" />


### Barplots {-}

Barplots are similar to histograms but are used for categorical/qualitative variables (in R we call them factors). They display levels of a categorical variable and their corresponding frequencies. We will create a barplot for the `Status` variable:



```r

barplot(table(data$Status))
```

<img src="Module_8_files/figure-html/unnamed-chunk-7-1.png" width="672" />


Like histgorams, barplots can be customized. Let's add labels to your barplot:


```r

barplot(table(data$Status),
        
        xlab = "Disease Stage",
        
        ylab = "Frequences",
        
        main = "Disease Status",
        
        names.arg = c("Healthy", "Stage 1", "Stage 2", "Stage 3"))
```

<img src="Module_8_files/figure-html/unnamed-chunk-8-1.png" width="672" />

Now, let's change the color of bins and borders:


```r

barplot(table(data$Status),
        
        xlab = "Disease Stage",
        
        ylab = "Frequences",
        
        main = "Disease Status",
        
        names.arg = c("Healthy", "Stage 1", "Stage 2", "Stage 3"),
        
        col = "orange",
        
        border = "blue")
```

<img src="Module_8_files/figure-html/unnamed-chunk-9-1.png" width="672" />

You can even make a horizontal barplot:


```r

barplot(table(data$Status),
        
        xlab = "Frequences",
        
        ylab = "Disease Stage",
        
        main = "Disease Status",
        
        names.arg = c("Healthy", "Stage 1", "Stage 2", "Stage 3"),
        
        col = "orange",
        
        border = "blue",
        
        horiz = TRUE)
```

<img src="Module_8_files/figure-html/unnamed-chunk-10-1.png" width="672" />

In R, you can create clustered barplots. For the two examples given below, guess what they are displaying:



```r

barplot(table(data[, c("Sex", "Status")]),
        
        legend.text = TRUE,
        
        ylab = "Frequences",
        
        xlab = "Disease Stage",
        
        main = "Disease Status vs Sex",
        
        names.arg = c("Healthy", "Stage 1", "Stage 2", "Stage 3"),
        
        col = c("orange", "red"))
```

<img src="Module_8_files/figure-html/unnamed-chunk-11-1.png" width="672" />


```r

barplot(table(data[, c("Sex", "Status")]),
        
        beside = TRUE,
        
        legend.text = TRUE,
        
        ylab = "Frequences",
        
        xlab = "Disease Stage",
        
        main = "Disease Status vs Sex",
        
        names.arg = c("Healthy", "Stage 1", "Stage 2", "Stage 3"),
        
        col = c("orange", "red"))
```

<img src="Module_8_files/figure-html/unnamed-chunk-12-1.png" width="672" />


### Boxplots {-}

Boxplots are used to visualize a 5-Number summary (Minimum, Q1 (first quartile, also known as 25th percentile), median, Q3 (third quartile, also known as 75th percentile), and Maximum). Below is a boxplot for the `Age` variable:


```r

boxplot(data$Age)
```

<img src="Module_8_files/figure-html/unnamed-chunk-13-1.png" width="672" />

Let's add labels to it and change the colors:


```r

boxplot(data$Age,
        
        xlab = "AGE",
        
        ylab = "Values",
        
        main = "Boxplot of AGE",
        
        col = "darkorange",
        
        border = "dodgerblue")
```

<img src="Module_8_files/figure-html/unnamed-chunk-14-1.png" width="672" />

You can even add a notch to it if you want to: 


```r

boxplot(data$Age,
        
        xlab = "AGE",
        
        ylab = "Values",
        
        main = "Boxplot of AGE",
        
        col = "darkorange",
        
        border = "dodgerblue",
        
        notch = T)
```

<img src="Module_8_files/figure-html/unnamed-chunk-15-1.png" width="672" />

You can change the shape and size of points in the plot by passing `pch` and `cex` arguments, respectfully. Type `?pch` in the console to see what shapes are available.


```r

boxplot(data$Age,
        
        xlab = "AGE",
        
        ylab = "Values",
        
        main = "Boxplot of AGE",
        
        col = "darkorange",
        
        border = "dodgerblue",
        
        notch = T,
        
        pch = 20,
        
        cex  = 2)
```

<img src="Module_8_files/figure-html/unnamed-chunk-16-1.png" width="672" />

Often you will be using boxplots to compare a numerical variable for different levels of other categorical variables (that is, levels of a factor). Let's compare boxplots of the `Age` variable for female and male patients:


```r

boxplot(data$Age ~ data$Sex,
        
        xlab = "SEX",
        
        ylab = "AGE",
        
        main = "Grouped Boxplots",
        
        col = c("darkorange", "red"),
        
        border = c("dodgerblue", "black"),
        
        notch = T)
```

<img src="Module_8_files/figure-html/unnamed-chunk-17-1.png" width="672" />

Let's make it more complicated:


```r

boxplot(data$Age ~ data$Sex:data$Smoke,
        
        xlab = "COMBINATION OF SEX AND SMOKE VARIABLES",
        
        ylab = "AGE",
        
        main = "Grouped Boxplots",
        
        names = c("F_Nonsmokers","M_Nonsmokers", "F_Smokers", "M_Smokers"),
        
        col = c("darkorange", "red"),
        
        border = c("dodgerblue", "black"),
        
        notch = T)
```

<img src="Module_8_files/figure-html/unnamed-chunk-18-1.png" width="672" />


### Scatterplots {-}

As mentioned earlier, before building a statistical model, it is recommended to visualize a relationship among variables. Suppose, you want to build a regression model that will describe the relationship between `Age` and `Lung Capacity` variables. First, we will visualize the data using `plot()` function:


```r

plot(x = data$Age, y = data$LungCap)
```

<img src="Module_8_files/figure-html/unnamed-chunk-19-1.png" width="672" />

As you can observe, there is a linear trend between these two variables, so this suggests that a linear regression model might be appropriate. Now let's customize the plot by labeling it and changing the color, shape, and size of the points:


```r

plot(x = data$Age,
     
     y = data$LungCap,
     
     xlab = "AGE",
     
     ylab = "Lung Capacity",
     
     main = "Lung Capacity vs Age",
     
     col = "dodgerblue",
     
     pch = 20,
     
     cex  = 0.5)
```

<img src="Module_8_files/figure-html/unnamed-chunk-20-1.png" width="672" />

You can focus on specific parts of the plot by adding `xlim()` argument:


```r

plot(x = data$Age,
     
     y = data$LungCap,
     
     xlab = "AGE",
     
     ylab = "Lung Capacity",
     
     main = "Lung Capacity vs Age",
     
     col = "dodgerblue",
     
     pch = 20,
     
     cex  = 1,
     
     xlim = c(0, 10))
```

<img src="Module_8_files/figure-html/unnamed-chunk-21-1.png" width="672" />


You can change the color (or the size) of points based on other factor variables. For example, we can make observation that belong to the female patients be displayed as red dots and observation that belong to the male patients be displayed as blue ones. In addition, we can add legends to clarify the meaning of colors in the plot:


```r

colors <- c("red", "blue")

plot(x = data$Age,
     
     y = data$LungCap,
     
     xlab = "AGE",
     
     ylab = "Lung Capacity",
     
     main = "Lung Capacity vs Age",
     
     col = colors[data$Sex],
     
     pch = 20,
     
     cex  = 1)


legend("topleft", legend = c("FEMALE", "MALE"), pch = 20, col = colors)
```

<img src="Module_8_files/figure-html/unnamed-chunk-22-1.png" width="672" />

Finally, in R you are able to display multiple plots in a single image. To do so, you need to use `par()` function. You pass an `mfrow()` argument to this function that specifies dimensions of your final plot. For example, if you want to plot two images in one row (that is, 1 row and 2 columns), then you execute `par(mfrow = c(1, 2))` function followed by the plots that you aim to include in it: 


```r

par(mfrow = c(1, 2))


boxplot(data$LungCap ~ data$Sex,
        
        xlab = "SEX",
        
        ylab = "AGE",
        
        main = "Grouped Boxplots",
        
        col = c("darkorange", "red"),
        
        border = c("dodgerblue", "black"),
        
        notch = T)


plot(x = data$Age,
     
     y = data$LungCap,
     
     xlab = "AGE",
     
     ylab = "Lung Capacity",
     
     main = "Lung Capacity vs Age",
     
     col = colors[data$Sex],
     
     pch = 20,
     
     cex  = 1)


legend("topleft", legend = c("FEMALE", "MALE"), pch = 20, col = colors)
```

<img src="Module_8_files/figure-html/unnamed-chunk-23-1.png" width="672" />

