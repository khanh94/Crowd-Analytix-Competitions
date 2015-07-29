#Modeling Competition Script

cancer_train = read.csv('CAX_CANCER_TRAIN_data.csv')
cancer_test = read.csv('CAX_CANCER_TEST_data.csv')

#Regression Model

#Regression = lm(TD50~Mol.Wt. + H.DonorCount + DipoleMoment + RotatableBondCount + I(polarizabilityAHC^2) + polarizabilityAHP + I(X3ChainCount^2) + I(X4ChainCount^2), data=cancer_train)
#Regression2 = glm(TD50~Mol.Wt. + Volume + H.DonorCount + RotatableBondCount + X3ChainCount + X4ChainCount, data=cancer_train, family=binomial)
#Regression = lm(TD50~Mol.Wt. + slogp + XlogP + H.DonorCount + DipoleMoment + RotatableBondCount + I(polarizabilityAHC^2) + polarizabilityAHP + I(X3ChainCount^2) + I(X4ChainCount^2) + I(X5ChainCount^2) + vdWSurfaceArea, data=cancer_train) (Best Solution)
#Regression = lm(TD50~Mol.Wt. + smr + slogp + XlogP + H.DonorCount + DipoleMoment + RotatableBondCount + I(polarizabilityAHC^2) + polarizabilityAHP + I(X3ChainCount^2) + I(X4ChainCount^2) + X4pathClusterCount, data=cancer_train)
Regression = lm(TD50~Mol.Wt. + slogp + XlogP + H.DonorCount + DipoleMoment + RotatableBondCount + I(polarizabilityAHC^2) + polarizabilityAHP + I(X3ChainCount^2) + I(X4ChainCount^2) + I(X5ChainCount^2) + vdWSurfaceArea, data=cancer_train)

#Make a prediction using the model
first_prediction = predict(Regression, newdata=cancer_train)
for (i in 1:length(first_prediction))
{
  if (first_prediction[i] < quantile(first_prediction, 0.55)){
    first_prediction[i] = 0
  }
}

#second_prediction = predict(Regression, newdata=cancer_train)
#for (item in second_prediction)
#{
# if (item < 0){
#  item = 0
#}
#}

#Calculate SSE & RMSE
SSE = sum((first_prediction - cancer_train$TD50)^2)
RMSE = sqrt(SSE/nrow(cancer_train))

#SSE2 = sum((second_prediction - cancer_train$TD50)^2)
#RMSE2 = sqrt(SSE/nrow(cancer_train))

#Write to csv files
#submission$TD50 = first_prediction
#write.csv(submission, file="/Users/ChemLab6/Documents/Crowd-Analytix-Competitions/submission.csv")
