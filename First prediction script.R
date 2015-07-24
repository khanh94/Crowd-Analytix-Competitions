#Modeling Competition Script

cancer_train = read.csv('CAX_CANCER_TRAIN_data.csv')
cancer_test = read.csv('CAX_CANCER_TEST_data.csv')

#Regression Model
#Regression = lm(TD50~Mol.Wt. + Volume + H.DonorCount + RotatableBondCount + chi3chain + chi4chain + chi5chain + chi6chain, data=cancer_train)
Regression = lm(TD50~Mol.Wt. + H.DonorCount + DipoleMoment + RotatableBondCount + I(polarizabilityAHC^2) + polarizabilityAHP + I(X3ChainCount^2) + I(X4ChainCount^2), data=cancer_train)

#Make a prediction using the model
first_prediction = predict(Regression, newdata=cancer_test)
for (i in 1:length(first_prediction))
{
  if (first_prediction[i] < 0){
    first_prediction[i] = 0
  }
}
#Calculate SSE & RMSE
#SSE = sum((first_prediction - cancer_test$TD50)^2)
#RMSE = sqrt(SSE/nrow(cancer_train))

#Write to csv files
submission$TD50 = first_prediction
write.csv(submission, file="/Users/ChemLab6/Documents/Crowd-Analytix-Competitions/submission.csv")
