

library(tidyverse)

# Let's create a data table

tribble(~Name, ~Gender,  ~Age, ~Gradelevel, ~Examone, ~Examtwo,
        "Leon", "Male",   18,      11,         72,      81,
        "Mary", "Female", 17,      12,         82,      86,
        "Alice","Female", 18,      11,         77,      83,
        "Matthew", "Male",16,      11,         86,      80
        ) -> StudentData
StudentData
# Let's add another observational row to our data table

#  John is a male who is 17 year old senior who scored 80 on Examone
# and 85 on Examtwo

# Find the average score for Examone

# Method 1
mean(StudentData$Examone)

# Method 2
summary(StudentData)


# Find the minimun, maximum, mean, and the median age for Examtwo
summary(StudentData)



# DATA VISUALIZTION

# Create a boxplot for Age

ggplot(data = StudentData) +
  geom_boxplot(mapping = aes(y = Age))

# Change the orientation of your boxplot to horizontal

ggplot(data = StudentData) +
  geom_boxplot(mapping = aes(x = Age))

# Estimate Q1, the median, Q3, the minimum, and the maximum
# by interpreting the boxplot


# Use R coding to find exact values

summary(StudentData)

# Color your boxplot green

ggplot(data = StudentData) +
  geom_boxplot(mapping = aes(y = Age), fill = "green")

# Create side by side boxplots that provides an assignment of Gender
# to Examone scores

ggplot(data = StudentData) +
  geom_boxplot(mapping = aes(y = Examone, x = Gender))

# Now let's provide color for our boxplots

ggplot(data = StudentData) +
  geom_boxplot(mapping = aes(y = Examone, x = Gender, fill = Gender))

# Let's generate a scatter plot that shows a relationship between the
# variables Examone and Examtwo (Color the data points red)

ggplot(data = StudentData) +
  geom_point(mapping = aes(x = Examone, y = Examtwo, color = "red"))

# Does the scatter plot suggest that we have an outlier ?

# Now create a bar graph that provides assignments for Examone scores
# and Names

ggplot(data = StudentData) +
  geom_bar(mapping = aes(y = Examone, x = Name), stat = "identity")

# Decorate your boxplot by coloring the bars

ggplot(data = StudentData) +
  geom_bar(mapping = aes(y = Examone, x = Name, fill = Name),
  stat = "identity") 

# Now let's switch our bar graph to a horizontal orientation and 
# let's also add the title "EXAM ONE SCORES"
ggplot(data = StudentData) +
  geom_bar(mapping = aes(y = Examone, x = Name, fill = Name),
  stat = "identity") +
  coord_flip() +
  ggtitle("EXAM ONE SCORES")
           
# DATA TRANSFORMATION

library(dplyr)

# Let's modify the StudentData table so that it only shows
# data for female students  (We will use the dplyr command
# filter and the pipe operator %>%)

StudentData

StudentData%>%
  filter(Gender == "Female")

# Let's modify the StudentData table so that it only shows
# data for female students who had an Examtwo score that is
# greater that 85

StudentData%>%
  filter(Gender == "Female", Examtwo > 85)

# Now let's use the dplyr function arrange, to sequence Examone
# scores from the original table in descending order(from highest to
# lowest)

StudentData%>%
  arrange(desc(Examone))


# Let's modify the StudentData table so that it only shows
# the variables Name, Examone, and Examtwo (use the dplyr function
# select)

StudentData%>%
  select(Name, Examone, Examtwo) 

# Now, using the dplyr functions select and mutate, create a data
# table that chooses the variables Name, Examone,and Examtwo again, 
# but also creates a new variable that calculates mean values for
# the exams

StudentData%>%
  select(Name, Examone, Examtwo) %>%
  mutate(meanofexams = (Examone + Examtwo)/2)

# Finally, find the Minimum, Q1, the Median, Mean, Q3, and the
# Maximum for the mean values of the table produced above.

StudentData%>%
  select(Name, Examone, Examtwo) %>%
  mutate(meanofexams = (Examone + Examtwo)/2) -> SD1
SD1

summary(SD1)

# Let's try these together !!

# Using the StudentData data table, create a boxplot for the variable
#  Examtwo that is colored yellow.




# Using the StudentData data table create a modified data table, 
# that only shows data for the variables Name, Age, and Gradelevel. 
# Also your table only shows observational rows for Examone scores 
# that are greater than 80.















