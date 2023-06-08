###############################################################
# This script do the following:                               #
# 1. Basics Example to Understand R                           #
# 2. Reading and Writing to File                              #
# 3. Simpe plotting                                           #
#                                                             #
# NOTE:                                                       #
# 1. Open the Script in RStudio                               #
# 2. To execute the command just press: ctrl + Enter          #
#                                                             #
#-------------------------------------------------------------#
# Credit: Dr. Prashant Singh Rana                             #
# Email : psrana@gmail.com                                    #
# Web   : www.psrana.com                                      #
###############################################################



#-------------------------------------------------------------
# Step 1: Simple Examples
#-------------------------------------------------------------
2 + 2                 # Addition
a=10                  # To assign
b=20
c=a+b                 # Addition
c
cat(c)                # To Print
exp(-200)             # Exponential function
log(200, base = 40)   # Log



#-------------------------------------------------------------
# Step 2: Generate Random Number
#-------------------------------------------------------------
runif(1)        # Generate one random numbers between 0 and 1
runif(1)        # Generate one random numbers between 0 and 1
runif(5)        # Generate five random numbers between 0 and 1
runif(5)        # Generate five random numbers between 0 and 1
round(runif(10, min = -5, max = 5),2)    # Generate five random numbers between 1 and 5

N=runif(5)            
N
class(N)        # Type of Variable

N<-runif(5)            
N
class(N)        # Type of Variable

min(N)          # Min
max(N)          # Max
sum(N)          # Sum

mean(N)         # Mean
sd(N)           # Standad Deviation



#-------------------------------------------------------------
# Step 3: Loop and if-else
#-------------------------------------------------------------
# Print 1 to 10
s=1
for ( i in 1:10){
  cat (i,"\n")
  s=s*i
}
cat(s)


# Print 10 random number between 1 and 100
for ( i in 1:10){
  cat (i, "-->", round(runif(1,min=1,max=100),0), "\n")
}

# If-else
if (i==20){
  print("Yes")
}else{
  print("NO")
}



#-------------------------------------------------------------
# Step 4: Some More Examples
#-------------------------------------------------------------
Actual <- runif(100, min = 1, max = 5)
Actual
head(Actual)
head(Actual,10)
head(Actual,20)
Predicted <- runif(100, min = 1, max = 5)
Predicted
head(Predicted)
Actual-Predicted            # Difference
sum(Actual-Predicted)       # Sum
mean(abs(Actual-Predicted)) # Mean Absolute Error: MAE
cor(Actual,Predicted)       # Correlation


#-------------------------------------------------------------
# Step 5: Writing to File
#-------------------------------------------------------------
write.csv(data.frame(Actual,Predicted), file="SampleData.csv", row.names=FALSE)
getwd()
# Go to the path and check for file




#-------------------------------------------------------------
# Step 6: Read from File
#-------------------------------------------------------------
dataset <- read.csv("SampleData.csv")    # Read the datafile
# Help: If you face error in file reading then go to Session -->
# Set Working Directory --> To source File Location

head(dataset)
dataset$Actual
dataset$Predicted
cor(dataset$Actual,dataset$Predicted)       # Correlation
mean(abs(dataset$Actual-dataset$Predicted)) # Mean Absolute Error: MAE


#-------------------------------------------------------------
# Step 7: Generate Random Number
#-------------------------------------------------------------
x <- runif(100, min = 1, max = 5)
x
class(x)    # To know the type of variable

y <- x^2 + runif(100)
y


#-------------------------------------------------------------
# Step 8: Plot x
#-------------------------------------------------------------
plot(x)
plot(x, main = "Plot of x against index 1, 2, ..., length(x)")
plot(x, main = "Plot of x against index 1, 2, ..., length(x)",xlab = "X Axis", ylab="Y Axis")


# 8.1 Plot Bivariate 'scatter plot' of y vs x
plot(x, y, main = "Bivariate 'scatter plot' of y vs x")


# 8.2 Saving the Plot to a file
png(filename="MyPlot.png")
plot(x, y, main = "Bivariate 'scatter plot' of y vs x",xlab = "X Axis", ylab="Y Axis")
dev.off()

getwd()   # Get the Current Working Directory, Similar to pwd in linux


#-------------------------------------------------------------
# Step 9: Other Plots
#-------------------------------------------------------------
z1 <- list(x = x, y = y)
z1
class(z1)
plot(z1)


#-------------------------------------------------------------
# Step 10: Variation in Plot
#-------------------------------------------------------------
plot(z1, type = "l")  # l is for lines


#-------------------------------------------------------------
# Step 11: Increasing Order Plotting
#-------------------------------------------------------------
x
ord <- order(x)
ord
z2 <- list(x = x[ord], y = y[ord])
z2
plot(z2, type = "l", main= "X vs Y", xlab = "X Axis", ylab="Y Axis")  # lines
plot(z2, type = "o") # points and lines overlayed
plot(z2, type = "s") # steps
plot(z2, type = "h") # histogram-like


#-------------------------------------------------------------
# Step 12: Grid and a curve plotting
#-------------------------------------------------------------
z2
plot(z2, type = "n")
grid(lty = 1, lwd = 2)
curve(x^2, col = "blue", add = TRUE)
curve(x^2 + 1, col = "blue", add = TRUE)
points(z2, pch = 20)


#-------------------------------------------------------------
# Step 13: Grphical Parameters
#-------------------------------------------------------------
plot(z2, type = "o", col = 'red', pch = 16, cex = 2)
plot(z2, col = c('red', 'blue'), pch = "+", cex = 2)


#-------------------------------------------------------------
# Step 14: Colors Plotting
#-------------------------------------------------------------
colors()
palette() ## default palette
palette(sample(colors(), 10)) ## change palette
plot(runif(50), col = rep(1:10, each = 5), pch = 16, cex = 2)


#-------------------------------------------------------------
# Step 15: Histogram Plotting - Frequency Plotting
#-------------------------------------------------------------

# create a grouping variable of length 100
a <- factor(sample(1:5, 100, replace = TRUE), levels = 1:5)
a
levels(a) <- LETTERS[1:5]
a
plot(a)
plot(y ~ a)   # Box Plot


#-------------------------------------------------------------
# Step 16: Plotting of Data frames 
#-------------------------------------------------------------

# scatterplot matrix: a matrix of all pairwise bivariate scatterplots.
iris        # Dataset
head(iris)
class(iris)
plot(iris)
plot(iris[1:4], col = as.numeric(iris$Species)) # color by Species


#-------------------------------------------------------------
# Step 17: Function Plotting
#-------------------------------------------------------------
plot(sin, from = -2 * pi, to = 2 * pi)
plot(cos, from = -2 * pi, to = 2 * pi)

damped.sin <- function(x) sin(5 * x) * exp(-x^2) ## New function
class(damped.sin)
plot(damped.sin, from = -pi, to = pi)


