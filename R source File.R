# GOAL :- Predict salary with respect to the years of experience
data<-read.csv("C:\\Users\\Ujjwal\\Downloads\\Salary_Data.csv")
View(data)
library(caTools)
set.seed(123)
split=sample.split(data$Salary,SplitRatio = 2/3)
train_data=subset(data,split==TRUE)
test_data=subset(data,split==FALSE)
#trainnng the model using train set
regresor= lm(formula = Salary ~ YearsExperience,
             data = train_data)
# predicting the test set
y_pred = predict(regresor,newdata = test_data)
y_pred

# visualizing the train data
library(ggplot2)
ggplot() +
  geom_point(aes(x = train_data$YearsExperience , y = train_data$Salary),
             colour = 'red') +
  geom_line(aes(x = train_data$YearsExperience , y = predict(regresor , newdata = train_data)),
            colour = 'blue')+
  ggtitle('Salary vs Year of experience (Training data)')+
  xlab('Years of Expreince')+
  ylab('Salary')
# visulizing the test data
ggplot()+
  geom_point(aes(x = test_data$YearsExperience, y = test_data$Salary),
             colour = 'red')+
  geom_line(aes(x = train_data$YearsExperience , y = predict(regresor , newdata = train_data)),
            colour = 'blue')+
  ggtitle('Salary vs Years of experience (test data)')+
  xlab('Years of Experience')+
  ylab('Salary')
