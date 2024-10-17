# Question 1

### file name: Lab#3_ChristinePham



# Question 2

### using the concatenate function, c(), to create an object called 'height'
height <- c(65, 72, 68, 67, 70, 74, 67, 71, 66, 72)

### using the concatenate function, c(), to create an object called 'weight'
weight <- c(145, 150, 130, 160, 165, 175, 160, 165, 135, 175)

### using the data.frame() function to create a data frame called 'hw3'
hw3 <- data.frame(height=height, weight=weight)
View(hw3)



# Question 3

### using the hist() function to create a histogram of the 'height' column from the 'hw3' data frame 
hist(hw3$height)

### using the boxplot() function to create a box plot of the 'weight' column from the 'hw3' data frame 
boxplot(hw3$weight)
