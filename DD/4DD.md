#Requirement Traceability
Sign-up

[R1] A user must be able to sign up to the system with a unique personal username and password:
* SignUpManager: this component receives username and password of a new user, 
    register them in the database and notify the user of the success, in case of no errors. 
    Otherwise, the registration fails and the user is notified by an error message.

Log-in

[R2] The system must allow only registered users to login with their username and password
* LoginManager: this component receives user's username and password and, in case there is a match in the database, 
    returns a token used for further identified communication.  
    
[R3] The system must allow only municipal authorities to login with their username and password
* LoginManager: this component receives authority's username and password and, in case there is a match in the database, 
    returns a token used for further identified communication.  
    
[R4] A users, municipal employee or local officer must be uniquely identified by his/her username
* SignUpManager: this component prevents that, during registration, no two users have the same username, while, for 
    authorities, this requirement holds a priori.
    
Add Report

[R5] When composing the report, the system must be able to access the user’s device camera and GPS sensor
* UserMobileApp: the application is able to access user's device camera. 

[R6] When composing the report, a user must take a picture from the device’s camera and highlight the license plate
* UserMobileApp: the application let user take a picture only from the device's camera and highlight the license plate

[R7] When composing the report, time and date get automatically retrieved from the internet
* UserMobileApp: the application automatically retrieves time and date from the internet as soon the picture for the report has been confirmed. 

[R8] When composing the report, position gets automatically retrieved from the device’s GPS
* UserMobileApp: the application automatically retrieves position from the device's GPS as soon the picture for the report has been confirmed. 

[R9] When composing the report, a user can choose at least one type of violation
* UserMobileApp: the application let the user choosing at least one type of violation.

[R10] When composing the report, a user can’t add the same violation type two times in the same report
* UserMobileApp: the application does not let the user add twice the same type of violation in the same report.

[R11] When composing the report, a user can revert each phase of the creation of the report at any time, before sending it
* UserMobileApp: the application let the user revert each phase of the creation of the report at any time, before sending it.

[R12] When composing the report, a user can abort the creation of the report at any time, before sending it
* UserMobileApp: the application let the user abort the creation of the report at any time, before sending it.

[R13] Once a report has been sent, it can’t be aborted or reverted
* UserMobileApp: the application does not let the user abort or revert the report, after sending it

[R14] When receiving a report, the system must store it, recognize the car plate, if possible, and marked as unchecked
* ReportReceiver: this component receives the report and does the following actions:
    * retrieving of the municipality where the report has been created, by employing the MS apis.
    * recognizing the car's plate in the picture, by employing the OCRS apis. In case of an unrecognizable plate, the report status is set to "NOTVALID" by default, otherwise is set to "NOTVERIFIED" by default(which means that a local officer has still to prove its validity).
    * saving the report in the system's database.
    
GetMyReports

[R15] When a user asks for his/her reports, the system must provide the saved reports sent by that user
* ReportMiner
    
GetReportsTypeByArea

[R16] When getting the valid reports by area, a user can choose a position, or automatically get his/her from the GPS
* UserMobileApp
    
[R17]When getting the valid reports by area, the system must provide all the valid reports near the position given by the user and display their violation type through the MS
* ReportMiner
    
MineReports

[R18] When mining the information, a municipal employee or a local officer can access only to violations type of reports occurred in his/her municipality
* ReportMiner

[R19] When mining the information, a municipal employee or a local officer can filter reports by area, date, time or type of violation
* ReportMiner

ValidateReports

[R20] A municipal officer must be able to mark a report as valid or not valid
* ReportValidator
    
RetrieveStatistics
    
[R21] When retrieving statistics, a municipal employee or a local officer can access only to reports of violations that occurred in his/her municipality
* StatisticsComputationManager

[R22] The system must be able to calculate statistics from the reports of violations and issued tickets of the municipal employee or local officer’s municipality
* StatisticsComputationManager
* StatisticsDownloadManager
    
GetImprovements

[R23] When getting improvements, a municipal employee can access only to data of reports occurred in his/her municipality
* ImprovementsManager

[R24] The system must be able to retrieve information about accidents from the MAS (municipal accident system)
* ImprovementsManager

[R25] The system must be able to identify the possible unsafe areas of the municipal employee or local officer’s municipality
* ImprovementsManager

[R26] The system must be able to suggest possible interventions on a specific unsafe area
* ImprovementsManager

//TODO

