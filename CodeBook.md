## CodeBook

* Feature variable names are cleaned (signs and duplicate names are removed) and new feature name data is stored as a vector in variable <b> featureNamesUnique </b>

* Data from X train set is updated with new feature names and subject numbers. This is stored in table <b> XTrainAll. </b>

* Data from X test set is updated with new feature names and subject numbers. This is stored in table <b> XTestAll. </b>

* Merged test and train sets are stored in table <b> mergedData. </b>

* Selection of elements form mergedData that contain mean and standard deviation values is stored in <b> mergedDataSelect table </b>. Activity values column is implemented in this table.

* From <b>mergedDataSelect </b> table mean values of each column based on activity for each subject is calculated and stored as merged.data1 table.

* merged.data1 is exported as <b> CourseProject.txt </b> file.


### Elements of merged.data1 table.

<b>Variables</b>:

subject – numbers of the subject who carried out the experiment

activity – six types of activities each subject performed during the experiment

<b>Measuring variables</b> – Ones that contain “mean” in the name are mean values, ones that contain “std” in the name are standard deviation values:

tBodyAccmeanX                    
tBodyAccmeanY                     
tBodyAccmeanZ                    
tGravityAccmeanX                 
tGravityAccmeanY                  
tGravityAccmeanZ                 
tBodyAccJerkmeanX                
tBodyAccJerkmeanY                 
tBodyAccJerkmeanZ                 
tBodyGyromeanX                   
tBodyGyromeanY                    
tBodyGyromeanZ                    
tBodyGyroJerkmeanX               
tBodyGyroJerkmeanY               
tBodyGyroJerkmeanZ                
tBodyAccMagmean                  
tGravityAccMagmean                
tBodyAccJerkMagmean               
tBodyGyroMagmean                 
tBodyGyroJerkMagmean              
fBodyAccmeanX                     
fBodyAccmeanY                    
fBodyAccmeanZ                     
fBodyAccmeanFreqX                 
fBodyAccmeanFreqY                
fBodyAccmeanFreqZ                 
fBodyAccJerkmeanX                 
fBodyAccJerkmeanY                
fBodyAccJerkmeanZ                 
fBodyAccJerkmeanFreqX             
fBodyAccJerkmeanFreqY            
fBodyAccJerkmeanFreqZ             
fBodyGyromeanX                    
fBodyGyromeanY                   
fBodyGyromeanZ                    
fBodyGyromeanFreqX                
fBodyGyromeanFreqY               
fBodyGyromeanFreqZ                
fBodyAccMagmean                   
fBodyAccMagmeanFreq              
fBodyBodyAccJerkMagmean           
fBodyBodyAccJerkMagmeanFreq       
fBodyBodyGyroMagmean             
fBodyBodyGyroMagmeanFreq          
fBodyBodyGyroJerkMagmean          
fBodyBodyGyroJerkMagmeanFreq     
angletBodyAccMeangravity          
angletBodyAccJerkMeangravityMean  
angletBodyGyroMeangravityMean    
angletBodyGyroJerkMeangravityMean 
angleXgravityMean                 
angleYgravityMean                
angleZgravityMean                 
tBodyAccstdX                      
tBodyAccstdY                     
tBodyAccstdZ                      
tGravityAccstdX                   
tGravityAccstdY                  
tGravityAccstdZ                   
tBodyAccJerkstdX                  
tBodyAccJerkstdY                 
tBodyAccJerkstdZ                  
tBodyGyrostdX                     
tBodyGyrostdY                    
tBodyGyrostdZ                     
tBodyGyroJerkstdX                
tBodyGyroJerkstdY                
tBodyGyroJerkstdZ                 
tBodyAccMagstd                    
tGravityAccMagstd                
tBodyAccJerkMagstd               
tBodyGyroMagstd                  
tBodyGyroJerkMagstd              
fBodyAccstdX                      
fBodyAccstdY                      
fBodyAccstdZ                     
fBodyAccJerkstdX                  
fBodyAccJerkstdY                  
fBodyAccJerkstdZ                 
fBodyGyrostdX                     
fBodyGyrostdY                     
fBodyGyrostdZ                    
fBodyAccMagstd                    
fBodyBodyAccJerkMagstd            
fBodyBodyGyroMagstd              
fBodyBodyGyroJerkMagstd          

