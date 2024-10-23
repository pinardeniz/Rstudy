#############################
# CHEAT SHEET
#############################

#############################
# Using Libraries
#############################

install.packages("dplyr") # Download and install a package from CRAN.
library(dplyr) # Load the package into the session, making all its functions available to use.

dplyr::select # Use a particular function from a package.
data(iris) # Load a built-in dataset into the environment.


#############################
# Working Directory
#############################

getwd() # Find the current working directory (where inputs are found and outputs are sent)
setwd("C://file/path") # Change the current working directory

####################################
##### READING AND WRITING DATA #####
####################################

# 1) READ FROM A TEXT FILE USING TABS AS SEPARATORS

# read.delim -> Reads a file in table format and creates a data frame from it

df <- read.delim("ekc.txt",sep = "\t",header = TRUE, stringsAsFactors = FALSE)

# if data is in the correct working directory. If not, indicate the location in the pc
# string is a sequence of characters used to represent text
# factors is a data structure used for storing categorical data
# stringsAsFactors -> a logical that indicates whether strings in a data frame should be treated as factor variables or as just plain strings.
# To avoid problems delay re-encoding of strings by using stringsAsFactors = FALSE when creating data.frames.
# sep is for separator


# 2) READ FROM AN EXCEL FILE BUT A SPECIFIC RANGE AND SHEET

install.packages("readxl")
library(readxl)

excelfile <- read_excel("time_series.xlsx", range=cell_cols(1:3), sheet="phillips_curve")


# 3) READ FROM A REPOSITORY USING A URL 

ekc <- read.table("https://raw.githubusercontent.com/pinardeniz/Rstudy/main/ekc.txt", 
                  sep = "\t", 
                  stringsAsFactors = FALSE, 
                  header = TRUE, 
                  fill = TRUE, 
                  quote = "")

# The raw.githubusercontent.com domain is used to serve unprocessed versions of files stored in GitHub repositories.
# If you browse to a file on GitHub and then click the Raw link
# fill = TRUE to allow R to handle rows with different numbers of columns.
# quote = "" -> will treat quotes as part of the data instead of delimiters.


# 4) READ FROM A TEXT FILE USING TABS AS SEPARATORS

ekc <- read.table("ekc.txt", sep = "\t", stringsAsFactors = FALSE,header = TRUE, fill = TRUE, quote = "")

# IN SHORT
# use read.delim() when you know your data is tab-delimited, as it simplifies the process.
# Use read.table() for more general cases or when dealing with different types of delimiters.

write.table(ekc, "file.txt") # write a delimited text file.
write.csv(ekc, "file.csv") # write a comma separated value file


#############################
# Creating Vectors
#############################

c(2, 4, 6) # 2 4 6 Join elements into a vector
2:6  # 2 3 4 5 6 An integer sequence
seq(2, 3, by=0.5)  # 2.0 2.5 3.0 A complex sequence
rep(1:2, times=3)  # 1 2 1 2 1 2 Repeat a vector
rep(1:2, each=3)  # 1 1 1 2 2 2 Repeat elements of a vector

#############################
# Variable Assignment
#############################
a=6
a <- 5
a <- "apple"

#############################
# Vector Functions
#############################
x <- c(1,3,5,2,8,0,4,4)


sort(x) # Return x sorted.
rev(x)  # Return x reversed.
table(x)  # See counts of values.
unique(x) # See unique values.
x <- t(x) # Transpose

#############################
# Selecting Vector Elements
#############################

# By Position
x <- read.delim("ekc.txt",sep = "\t",header = TRUE, stringsAsFactors = FALSE) # here x is a dataframe

x <- c(1,2,5)  # here x is a vector
x[3] # The fourth element.
x[-1] # All but the first
x[2:3] # Elements two to three
x[-(2:3)] # All elements except two to three
x[c(1, 3)] # Elements one and three

# By Value

x[x == 10]# Elements which are equal to 10.
x[x < 4] # All elements less than four
x[x %in% c(1, 2, 5)] # Elements in the set 1, 2, 5, i.e., set containing the numbers 1, 2, and 5

# Named Vectors
x["co2"] # Element with name ‘co2’.

#############################
# Conditions
#############################

a <- c(1,5,6)
a == b # Are equal
a > b #Greater than 
a >= b # Greater than or equal to
is.na(a) # Is missing
a != b # Not equal
a < b # Less than 
a <= b # Less than or equal to
is.null(a) # Is null


#############################
# Programming
#############################

# For Loop
# for (variable in sequence){
#   Do something
# }

for (i in 1:4){
  j <- i + 10
  print(j)
}

# While Loop
# while (condition){
# Do something
# }

i= 4
while (i < 5){
print(i)
i <- i + 1
}

# If Statements
# if (condition){
#   Do something
# } else {
#   Do something different
# }


if (i > 3){
  print("Yes")
  } else {
    print("No")
  }



# Functions
# function_name <- function(var){
#   Do something
#   return(new_variable)
# }


bla <- function(x){
  blasq <- x*x
  return(blasq)
}

bla(i)

#############################
# Maths Functions
#############################
data <- read.delim("ekc.txt",sep = "\t",header = TRUE, stringsAsFactors = FALSE)
x <- data$gdppc # subsetting using the name
data[[2]] # this is also subsetting using the order
y <- data$co2


data[ , 2]  # this is matrix subsetting using the order [row,column]
data[2 , 2]  # this is matrix subsetting using the order
data[2 , ]  # this is matrix subsetting using the order


log(x) # Natural log
sum(x) # Sum
exp(x) # Exponential
mean(x) # Mean.
max(x) # Largest element
median(x) # Median
min(x) # Smallest element
quantile(x) # Percentage quantiles
round(x, 2) # Round to 2 decimal places
rank(x) # Rank of elements
signif(x, 2) # Round to 2 significant figures
var(x) # The variance
cor(x, y) # Correlation
sd(x) # The standard deviation

#############################
# Strings
#############################
paste(x, y, sep = ' ') # Join multiple vectors together.
paste(x, collapse = ' ') # Join elements of a vector together.


#############################
# Converting between common data types
#############################
data <- read.delim("ekc.txt",sep = "\t",header = TRUE, stringsAsFactors = FALSE)
x <- as.character(x)
x <- as.numeric(x)


#############################
# Statistics and Plotting
#############################
ekc <- read.delim("ekc.txt")

head(ekc)

summary(ekc)

hist(ekc$co2) #to create histogram

plot(ekc$gdppc) # Plot values in order
plot(ekc$gdppc, ekc$co2) # Values of x against y



#ggplot command will be used for plotting graphs.
#it is not available by default, so let's install it. To install a package from CRAN, type install.packages ('nameofpackage')
# install.packages("ggplot2")
install.packages('ggplot2', repos = "http://cran.us.r-project.org")

#to use an installed package, type library(nameofpackage)
library(ggplot2)

# ggplot() function is used to construct the plot, aes (aesthetics) aes(x, y) part is for the independent (x) and dependent (y)
# variables, it is followed by + to add component to the plot.
#  method lm() is used for linear smooths, glm() for generalised linear smooths, and loess() for local smooths.

ggplot(ekc,aes(x=gdppc,y=co2))+
  geom_point()+
  geom_smooth(method = "lm")

loggdppc<-log(ekc$gdppc)
logco2<-log(ekc$co2)

gdppc2<-loggdppc^2

ggplot(data=ekc,aes(x=loggdppc,y=logco2))+
  geom_point()+
  geom_smooth(formula = y~poly(x,2), method = "lm")

#to create regression model
fit<- lm(formula=logco2~loggdppc+gdppc2,data=ekc)
summary(fit) # Get more detailed information out a model

aov(fit) # Analysis of variance
t.test(loggdppc, logco2) # Preform a t-test for difference between means


#############################
# save figures
#############################
jpeg("my_plot.jpg", width = 800, height = 600) # Create your plot by setting up the JPEG device

plot(ekc$gdppc, ekc$co2) # Replace with your actual plotting code

dev.off() # Turn off the device

