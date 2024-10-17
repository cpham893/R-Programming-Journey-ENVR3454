# set working directory
setwd("C:/Users/chris/OneDrive/Documents/school/envr stats/Assignments_Homework/hw_lab/lab 5")

# library
#install.packages("ggplot2")
library(ggplot2) ### installing and loading the library 'ggplot2'

# load data
mtcars ### load dataset 'mtcars'

  

# create factors

### turning the 'gear' variable in the 'mtcars' dataset into a factor class with function 'factor'
### and labeling level 3 as '3gears', 4 as '4gears', and 5 as '5gears'
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears"))

### turning the 'am' variable in the 'mtcars' dataset into a factor class with function 'factor'
### and labeling level 0 as 'Automatic' and 1 as 'Manual'
mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual"))

### turning the 'cyl' variable in the 'mtcars' dataset into a factor class with function 'factor'
### and labeling level 4 as '4cyl', 6 as '6cyl', and 8 as '8cyl'
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl"))



# plots

# Kernel density plots for ‘mpg’ grouped by number of ‘gears’ (indicated by color)
###
ggplot(mtcars, aes(x = mpg, fill = gear)) +  ### using the library 'ggplot' on the 'mtcars' dataset, variable 'mpg' on the x axis, filling in the area under the curve for the variable 'gear'
  geom_density(alpha = 0.5) +  ###create a density plot of 'gears' with the function 'geom_density' and setting 'alpha' to 0.5 so the filled area under the curves can be semi transparent
  labs(            ### using function 'labs' to alter labels on the graph
    title = "Distribution of Gas Milage", ### labeling the title as 'Distribution of Gas Milage'
    x = "Miles Per Gallon", ### labeling the x-axis as 'Miles Per Gallon'
    y = "Density") ### labeling the y-axis as 'Density'

#ggsave("plot1.png") ### save density plot as 'plot1.png'



# Scatterplot of ‘mpg’ vs. ‘hp’ for each combination of ‘gears’ and ‘cylinders’ in each facet, ‘transmission’ type is represented by shape and color
###
ggplot(mtcars, aes(x = hp, y = mpg, color = am, shape = am)) +  ### using the library 'ggplot' on the 'mtcars' dataset, variable 'hp' on the x axis, variable 'mpg' on the y axis, colors and shapes vary based on 'am' variable
  geom_point(size = 3) + ### function 'geom_point' setting size of points on scatter plot to 3
  facet_grid(gear ~ cyl) + ### function 'facet_grid' creates new grid based on 'gear' and 'cyl' variable
  labs(     ### using function 'labs' to alter labels on the graph
    x = "Horsepower", ### labeling the x-axis as 'HP'
    y = "Miles per Gallon") ### labeling the y-axis as 'Miles per Gallon'

#ggsave("plot2.png") ### save Scatterplot plot as 'plot2.png'



# Separate regressions of ‘mpg’ on ‘weight’ for each number of ‘cylinders'
###
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +  ### using the library 'ggplot' on the 'mtcars' dataset, variable 'wt' on the x axis, variable 'mpg' on the y axis, colors vary based on 'cyl' variable
  geom_point() + ###function 'geom_point' adds points to the regressions
  geom_smooth(method = "lm", formula = y ~ x) + ### function 'geom_smooth' adds method 'lm', linear model, to the plot based on formula 'y~x'
  labs(     ### using function 'labs' to alter labels on the graph
    title = "Regression of MPG on Weight", ### labeling the title as 'Regression of MPG on Weight'
    x = "Weight", ### labeling the x-axis as 'Weight'
    y = "Miles per Gallon") ### labeling the y-axis as 'Miles per Gallon'

#ggsave("plot3.png") ### save regressions as 'plot3.png'



# Boxplots of ‘mpg’ by number of ‘gears’ observations (points) are overlayed and jittered
###
ggplot(mtcars, aes(x = gear, y = mpg, fill = gear)) +  ### using the library 'ggplot' on the 'mtcars' dataset, variable 'gear' on the x axis, variable 'mpg' on the y axis, filling in the area of the box for the variable 'gear'
  geom_boxplot() +  ### function 'geom_boxplot' creates boxplot of for each 'gear' variable
  geom_jitter() + ### function 'geom_jitter' adds points to boxplots
  labs(     ### using function 'labs' to alter labels on the graph
    title = "Mileage by Gear Number", ### labeling the title as 'Mileage by Gear Number'
    x = "", ### leaves x axis title blank
    y = "Miles per Gallon") ### labeling the y-axis as 'Miles per Gallon'

#ggsave("plot4.png") ### save Boxplots as 'plot4.png'

