#Class exercise 1
# Laura Cortes, 08/22/2018, this program does the KM analysis and plot.
# Load the datasets, survival package which has function for KM analysis
require(datasets)
require(survival)

# check your dataset
head(lung)

# make a object survData
survData <- lung (copying data to an object which we renamed to "survData")

# "type' is 'right' censoring data, because some are alive and some are dead. If intervals are present, then type as interval, if left, then left, completed if everyone is dead. 

#for exam, he'll ask to describe everything in this function "survObj <- Surv(time=survData$time,event=survData$status==2, type="right")"

# x and y axis are "time" and "event". from surv data we are picking "time" data column to plot. From surv data we are also taking another column "status" 

#for surv function of survival package, we are also only taking only status = 2, because we only want those that dead.d To pick something in R you use double = sign ["=="]

#survdata puts only data of 2 which will read "TRUE"

#to get dimensions of data and figure out how many patients we have, use "dim (name of data set)' for us "dim(survData)". So we have 228. 

# fit your plot to the intercept, 1 is "insert" Clarify. 
fit <- survfit (survObj ~ 1)  
survObj is our data, and we fix it with the y intercept. 

#plot the fit
plot(fit,main="KM plot for Lung Cancer Data", xlab="Time in days", ylab="Percent survival")

#for help, "?plot"

#fit your plot to the sexes 
fit <- survfit(survObj ~ survData$sex==1)
~ is a mathetmical formula, so youre putting all your data into survObj

#plot the new fit 
plot(fit, main = "KM plot for lung cancer data in males and females", xlab = "Time in days", ylab = "percent survival", col=c(1,2))

#x11 is so that you make a new plot 

#need to asign labels to male and female
legend ('topright', c("Male", "Female"), lty=1, col=c(1,2))
