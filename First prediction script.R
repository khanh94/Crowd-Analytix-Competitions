#Modeling Competition Script

cancer_train = read.csv('CAX_CANCER_TRAIN_data.csv')
cancer_test = read.csv('CAX_CANCER_TEST_data.csv')

#Regression Model
Regression = lm(TD50~Mol.Wt. + Volume + H.DonorCount + RotatableBondCount, data=cancer_train)

#Make a prediction using the model
first_prediction = predict(Regression, newdata=cancer_test)

#Calculate SSE & RMSE
#SSE = sum((first_prediction - cancer_test$TD50)^2)
#RMSE = sqrt(SSE/nrow(cancer_train))

#Write to csv files
submission$TD50 = first_prediction
write.csv(submission, file="/Users/ChemLab6/Documents/Crowd-Analytix-Competitions/submission.csv")
