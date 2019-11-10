# 3. Specific Requirements
## 3.1. External interface requirements
### 3.1.1. User interfaces
The following mockups give an approximate idea of how the application’s interfaces should appear.

* Unregistered User
    * Sign-Up
    ![SignUp](./images/Mockup/User/SignUp.png)

* Registered User
    * Log-In
    ![UserLogIn](./images/Mockup/User/UserLogin.png)
    * Get My Reports, all Reports
    ![MyReports](./images/Mockup/User/MyReports.png)
    * Get My Reports, information of a single report
    ![MyReportExpanded](./images/Mockup/User/MyReportExpanded.png)
    * Get Unsafe Areas
    ![UnsafeAreas](./images/Mockup/User/UnsafeAreas.png)
    * Add Report, taking photo from camera
    ![Report0Camera](./images/Mockup/User/Report0Camera.png)
    * Add Report, confirmation of the taken photo
    ![Report1ConfirmPhoto](./images/Mockup/User/Report1ConfirmPhoto.png)
    * Add Report, highlighting of the car's plate
    ![Report2HighlightPlate (./images/Mockup/User/Report2HighlightPlate.png)
    * Add Report, choosing of the violation's types
    ![Report3ChooseViolation](./images/Mockup/User/Report3ChooseViolation.png)
    * Add Report, confirmation
    ![Report4Confirm](./images/Mockup/User/Report4Confirm.png)
* Authority
    * Log-In
    ![AuthorityLogIn](./images/Mockup/Authority/AuthorityLogin.png)
* Municipal Employee
    * See Statistics 
    ![SeeStatistics](./images/Mockup/Authority/MunicipalEmployee/SeeStatistics.png)
    * Get Improvements
    ![GetImprovements](./images/Mockup/Authority/MunicipalEmployee/Improvements.png)
    * Mine Reports By *
    ![MineReportsBy*](./images/Mockup/Authority/MunicipalEmployee/MineReports.png)
* Local Officer
    * See Statistics 
    ![SeeStatistics](./images/Mockup/Authority/LocalOfficer/SeeStatistics.png)
    * Validate Reports, compact view
    ![ValidateReports](./images/Mockup/Authority/LocalOfficer/ValidateReport.png)
    * Validate Reports, expanded view
    ![ValidateReports](./images/Mockup/Authority/LocalOfficer/ValidateReportExpanded.png)
    * Mine Reports By *
    ![MineReportsBy*](./images/Mockup/Authority/LocalOfficer/MineReports.png)
### 3.1.2. Hardware interfaces
The system has no hardware interface.
### 3.1.3. Software interfaces
The system does not offer any APIs to external applications for its usage.
### 3.1.4. Communication interfaces
The system does not offer any APIs to external applications for communication.
## 3.2. Functional requirements 
### 3.2.1. Scenarios
#### 3.2.1.1. Scenario 1
Cat has a disabled child. Tired from everybody that leave their car in the disable’s parking lot, Cat decides to download and install SafeStreets app. After subscribing to the service, she starts to take pictures of all the perpetrator’s cars. Sometime after, Cat notices that her reports are getting validated and along with that the number of times that she founds cars in the disabled parking lot start to diminish, that may be because the local police intervened and ticketed them. 
#### 3.2.1.2. Scenario 2 
Ned is looking for a house in the city, he has always lived in the countryside and  he’s scared of the possibility to live in areas with difficulty in finding car parks. He opens SafeStreets and using “Get Reports By Area” he can find the worst areas in the city and he can avoid them, looking for a house with confidence.
#### 3.2.1.3. Scenario 3
Jon has the reputation of not being a trustworthy guy. When he decides to use SafeStreets, Jon starts to report every car that he does not like, hoping that the owners of those car will receive a ticket. Luckily for the owners, those report won’t incur in any fine because the local police is able to validate the received reports and does not issue the cars in order, ignoring Jon’s report.
#### 3.2.1.4. Scenario 4 
Martha works as a municipal employee. The mayor asks her to make a list all possible investment to develop the streets of the city, in order to increase the street security.
Luckily for Martha, SafeStreets with its function "Get Improvements", highlights the most unsafe areas and suggests possible interventions. Reading these recommendations, Martha realizes that some of them have already been done so she diligently set them as completed with the “Notify Improvement”. Martha can now finish her assignment quickly and can dedicate more of her time to do nothing, she works for the municipality after all.
#### 3.2.1.5. Scenario 5 
The mayor, to promote his image before the next elections, wants to publish a report with the statistics regarding public security. With SafeStreets his secretary can easily retrieve such information, and prepare a detailed report with all the areas where public street security has improved during the mayor’s mandate.
#### 3.2.1.6. Scenario 6 
A group of citizens is concerned with the street security of their neighborhood but they don’t have much real data that can be used to support their concerns. They go to the municipality to ask for more information and possibly an interventions of the authorities. The municipality can quickly for search for data regarding their area and forward it higher authorities that will hopefully do something.
#### 3.2.1.7. Scenario 7 
A local officer in patrol is tasked to give fines during his work shift but usually this isn’t such an easy task. Normally he would spend a lot of time searching the usual street but, using SafeStreets, he can now retrieve reports about positions of parking violations using  “Mine Report” function. With these information the local officer starts the search. Luckily for him, he finds a lot of violations in the streets specified by SafeStreet, so he can proceed and charge the owners of those cars for their sins (violations).
### 3.2.2. Use case diagrams 
* Unregistered User
![UU](./images/use_cases_diagrams/UU.svg)
* Registered User
![RU](./images/use_cases_diagrams/RU.svg)
* Municipal Employee
![ME](./images/use_cases_diagrams/ME.svg)
* Local Officer
![LO](./images/use_cases_diagrams/LO.svg)
### 3.2.3. Use cases 
#### 3.2.3.1. Sign-Up
| | |
|-|-|
!Name |Sign-Up !
!Actors |Unregistered User !
!Entry Conditions |The UU is already on the Log-In page. !
!Event Flow | 1. The UU clicks on the "Sign-Up" field to start the registration process. |
| | 1. The UU provides his/her email address. |
| | 1. The UU provides a username. |
| | 1. The UU provides a password and writes it again for confirmation. |
| | 1. The UU clicks on the confirmation button. |
| | 1. The system saves the data. !
!Exit Conditions |The UU becomes now a RU. <br>From now on he/she can Log-In into the application and use SafeStreets service. !
!Exceptions | 1. The UU is already an user. |
| | 1. The UU provides a username already used. <br> In the case 1 an error message is displayed, saying "Credentials already in use, please Log-In", and the UU is taken back to the Log-In page. <br> In the case 2 an error message is displayed, saying "Username already in use, please choose a different one", and the UU is taken back to the point 2. !

#### 3.2.3.2. Registered User Log-In
| | |
|-|-|
!Name |Registered User Log-In !
!Actors |Registered User !
!Entry Conditions |The RU is already on the Log-In page. !
!Event Flow | 1. The RU provides his/her username or email. |
| | 1. The RU provides his/her password. |
| | 1. The RU clicks on the confirmation button.  |
| | 1. The system redirects the RU to the corresponding home page. !
!Exit Conditions |The RU is successfully redirected to the corresponding home page. !
!Exceptions | 1. The RU provides an incorrect username, email or password. <br> In the case 1 an error message is displayed, saying "Wrong Credentials", and the RU is taken back to the point 1. !
#### 3.2.3.3. Add Report                                                                             
| | |
|-|-|
!Name |Add Report !
!Actors |Registered User, OCR Service !
!Entry Conditions |The RU has logged in and is in the home page, which is the "Get My Reports" page !
!Event Flow | 1. The RU clicks on the "Add Report" button. |
| | 1. The RU takes a photo of the car through his/her device's camera and goes to the next phase. |
| | 1. The RU highlight the plate of the reported car and goes to the next phase. |
| | 1. The RU adds one or more type of violations and confirms. |
| | 1. The system receives the report and store it, with the plate recognized thanks to the OCRS. !
!Exit Conditions |The RU successfully uploads a new report into the system. Then he/she is taken back to the home page. !
!Exceptions |There are no exceptions under the given domain assumptions. !
#### 3.2.3.4. Get My Reports
| | |
|-|-|
!Name | Get My Reports !
!Actors | Registered User, Map Service !
!Entry Conditions | The RU has logged in and is in the home page, which is "Get My Reports" page. !
!Event Flow | 1. The system automatically provides the RU with the reports he/she has sent, sorted in chronological order, starting from the newest one. |
| | 1. Eventually the RU is able to open a report, see all its information, with the position provided by the MS, and see its status. !
!Exit Conditions | The RU successfully gets his/her reports and is able to navigate through them. !
!Exceptions | 1. The RU has never uploaded any report. <br> The case 1 is handled by showing only the "Add Report" button. !
#### 3.2.3.5. Get Violations Type By Area
| | |
|-|-|
!Name |Get Violations Type By Area !
!Actors |Registered user, Map Service !
!Entry Conditions |The RU has logged in and is in the home page, which is the "Get My Reports" page. !
!Event Flow | 1. The RU has to swipe to the "Get violations Type By Area" page. |
| | 1. Once in the correct page, the RU has to provide an address or use his/her current GPS location. |
| | 1. A map with the violations, shown as points, is displayed. The map is provided by the MS. !
!Exit Conditions |The RU now is able to browse on the map between violations and see their type. !
!Exceptions | 1. The RU provides an invalid address. <br> In the case 1 an error message is displayed, saying "Invalid address", and the RU is taken back to the point 2. !
#### 3.2.3.6. Authority Log-In
| | |
|-|-|
!Name | Authority Log-In !
!Actors |Municipal Employee, Local Officer !
!Entry Conditions |The ME/LO is already on the Log-In page. !
!Event Flow | 1. The ME/LO provides his/her username or email. |
| | 1. The ME/LO provides his/her password. |
| | 1. The ME/LO chooses his/her type: "Municipal Employee" or "Local Officer". |
| | 1. The ME/LO clicks on the confirmation button.  |
| | 1. The system redirects the ME/LO to the corresponding home page. !
!Exit Conditions |The ME/LO is successfully redirected to the home page. !
!Exceptions | 1. The ME/LO provides an incorrect username, email or password. <br> In the case 1 an error message is displayed, saying "Invalid credentials", and the ME/LO is taken back to the point 1. !
#### 3.2.3.7. Get Improvements
| | |
|-|-|
!Name |Get Improvements !
!Actors |Municipal Employee, Municipal Accident System, Map Service  !
!Entry Conditions |The ME has logged in and is in the home page. !
!Event Flow | 1. The ME clicks on the "Get Improvements" function. |
| | 1. The system cross its information with the MAS and finds all the possible improvements in the ME's municipality. |
| | 1. The system sends the information to the ME.|
| | 1. The possible improvements are shown in a descendant list on the left, starting from the most urgent one. <br>A map with the possible improvements, shown as points, is displayed on the right, thanks to the MS. |
| | 1. The ME can click on a improvements and see it highlighted on the map. !
!Exit Conditions |The ME can browse through all the possible improvements in his/her municipality. !
!Exceptions | 1. There are no possible improvements. <br> In the case 1 an error message is displayed, saying "There is not enough data to generate improvements", and the ME/LO is taken back to the home page.!
#### 3.2.3.8. See Statistics
| | |
|-|-|
!Name | See Statistics !
!Actors | Municipal Employee, Local Officer, Ticket Service !
!Entry Conditions | The ME/LO has logged in and is in the home page. !
!Event Flow | 1. The ME/LO clicks on the "See Statistics" function. |
| | 1. The system creates statistics based on the reports it has stored and the tickets issued through the Ticket Service. |
| | 1. The system sends the statistics to the ME/LO. |
| | 1. The ME/LO can see and download the received statistics. !
!Exit Conditions | The ME/LO successfully receives the statistics provided by the system. !
!Exceptions | 1. The system has no data to build statistics on. <br> In the case 1 an error message is displayed, saying "There is not enough data to create statistics", and the ME is taken back to the home page. !
#### 3.2.3.9. Mine Reports By Type
| | |
|-|-|
!Name | Mine Reports By Type!
!Actors | Municipal Employee, Local Officer, Map Service!
!Entry Conditions | The ME/LO has logged in and is in the home page. !
!Event Flow | 1. The ME/LO clicks on the "Mine Reports" function. |
| | 1. The ME/LO chooses the "Mine By Type" option. |
| | 1. The ME/LO decides one or more types of violations to retrieve. |
| | 1. The system provides the ME/LO with all the violations in his/her municipality, with at least one of the given types. |
| | 1. Only the violation types are shown, in a list on the left, starting from the newest one. <br>A map with violation types, shown as points, is displayed on the right, thanks to the MS.!
!Exit Conditions | The ME/LO is able to search through the violations and see where and when they happened. !
!Exceptions | 1. There are no reports with at least one of the given violation type. <br> In the case 1 an error message is displayed, saying "There are no Violations to be displayed", and the ME/LO is taken back to the home page. !
#### 3.2.3.10. Mine Reports By Date
| | |
|-|-|
!Name | Mine Reports By Date!
!Actors | Municipal Employee, Local Officer, Map Service!
!Entry Conditions | The ME/LO has logged in and is in the home page. !
!Event Flow | 1. The ME/LO clicks on the "Mine Reports" function. |
| | 1. The ME/LO chooses the "Mine By Date" option. |
| | 1. The ME/LO decides the specific date of the violations to retrieve. |
| | 1. The system provides the ME/LO with all the violations in his/her municipality that were issued in the specific day. |
| | 1. Only the violation types are shown, in a list on the left. <br>A map with violation types, shown as points, is displayed on the right, thanks to the MS.!
!Exit Conditions | The ME/LO is able to search through the violations and see where they happened. !
!Exceptions | 1. There are no reports issued in the specific date. <br> In the case 1 an error message is displayed, saying "There are no Violations to be displayed", and the ME/LO is taken back to the home page. !
#### 3.2.3.11. Mine Reports By Time
| | |
|-|-|
!Name | Mine Reports By Time!
!Actors | Municipal Employee, Local Officer, Map Service!
!Entry Conditions | The ME/LO has logged in and is in the home page. !
!Event Flow | 1. The ME/LO clicks on the "Mine Reports" function. |
| | 1. The ME/LO chooses the "Mine By Time" option. |
| | 1. The ME/LO decides the time (expressed in hours, i.e. 8 pm) for the violations he/she wants to retrieve. |
| | 1. The system provides the ME/LO with all the violations in his/her municipality that were issued at the specific time. |
| | 1. Only the violation types are shown, in a list on the left. <br>A map with violation types, shown as points, is displayed on the right, thanks to the MS.!
!Exit Conditions | The ME/LO is able to search through the violations and see where they happened !
!Exceptions | 1. There are no reports issued at the specific time. <br> In the case 1 an error message is displayed, saying "There are no Violations to be displayed", and the ME/LO is taken back to the home page. !
#### 3.2.3.12. Mine Reports By Area
| | |
|-|-|
!Name | Mine Reports By Area!
!Actors | Municipal Employee, Local Officer, Map Service!
!Entry Conditions | The ME/LO has logged in and is in the home page. !
!Event Flow | 1. The ME/LO clicks on the "Mine Reports" function. |
| | 1. The ME/LO chooses the "Mine By Area" option. |
| | 1. The ME/LO decides the address, or selects a point on a map provided by the MS, of the violations to retrieve and select the radius of the search. |
| | 1. The system provides the ME/LO with all the violations in his/her municipality that were issued within the specified radius. |
| |1. Only the violation types are shown, in a list on the left, starting from the newest one. <br>A map with violation types, shown as points, is displayed on the right, thanks to the MS.!
!Exit Conditions | The ME/LO is able to search through the violations and see when they happened !
!Exceptions | 1. There are no reports issued in the specific area. <br> In the case 1 an error message is displayed, saying "There are no Violations to be displayed", and the ME/LO is taken back to the home page. !
#### 3.2.3.13. Validate Reports
| | |
|-|-|
!Name | Validate Reports!
!Actors | Local Officer, Ticket Service!
!Entry Conditions | The LO has logged in and is in the home page. !
!Event Flow | 1. The LO clicks on the "Validate Report" function. |
| | 1. The system provides the LO with all the reports of his/her municipality still not verified. |
| | 1. The reports are shown starting from the newest one.|
| | 1. The LO clicks on one report and is able to validate or invalidate it. |
| | 1. Eventually the LO uses the report data to create a new ticket and add it to the TS. !
!Exit Conditions | The LO is able to browse through the reports and validate or invalidate them!
!Exceptions | 1. There are no reports in LO's municipality. <br> In the case 1 an error message is displayed, saying "There are no Reports to be displayed", and the LO is taken back to the home page. !
### 3.2.4. Sequence diagrams 

* Unregistered User
    * Sign-Up
    ![SignUp](./images/sequence_diagrams/SignUp.svg)
* Registered User
    * Log-In
    ![UserLogIn](./images/sequence_diagrams/RU/UserLogIn.svg)
    * Get My Reports
    ![GetMyReports](./images/sequence_diagrams/RU/GetMyReports.svg)
    * Get Unsafe Areas
    ![GetViolationsTypeByArea](./images/sequence_diagrams/RU/GetViolationsTypeByArea.svg)
    * Add Report
    ![UserLogIn](./images/sequence_diagrams/RU/UserLogIn.svg)
* Authority
    * Log-In
    ![AuthorityLogIn](./images/sequence_diagrams/MELO/AuthorityLogIn.svg)
    * Mine Reports By *
    ![MineReportsBy*](./images/sequence_diagrams/MELO/MineReportsBy.svg) 
    * See Statistics
    ![SeeStatistics](./images/sequence_diagrams/MELO/SeeStatistics.svg)        
* Municipal Employee
    * Get Improvements
    ![GetImprovements](./images/sequence_diagrams/MELO/ME/GetImprovements.svg)
* Local Officer
    * Validate Reports
    ![ValidateReport](./images/sequence_diagrams/MELO/LO/ValidateReport.svg)


### 3.2.5. Mapping requirements
In this section we show that the requirements ensure the satisfaction of the goals in the context of the domain assumptions: the list of requirements and domain assumptions under each goal have this purpose.

* [G1] The system must allow logged-in users to send a report of the violation
    * [D1] The number of possible violations is finite and is aligned to the current traffic rules
    * [D3] When using the S2B, the user’s device is always connected to internet 
    * [D4] When using the S2B, the user’s device has a valid GPS signal
    * [D5] The internet connection works properly without failure
    * [D6] The user device has a camera and is able to take pictures 
    * [D7] The user does not fake his position 
    * [R1] A user must be able to sign up to the system with a unique personal username and password
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username
    * [R5] When composing the report, the system must be able to access the user’s device camera and GPS sensor
    * [R6] When composing the report, a user must take a picture from the device’s camera and highlight the license plate
    * [R7] When composing the report, time and date get automatically retrieved from the internet
    * [R8] When composing the report, position gets automatically retrieved from the device’s GPS
    * [R9] When composing the report, a user can choose at least one type of violation
    * [R10] When composing the report, a user can’t add the same violation type two times in the same report
    * [R11] When composing the report, a user can revert each phase of the creation of the report at any time, before sending it
    * [R12] When composing the report, a user can abort the creation of the report at any time, before sending it
    * [R13] Once a report has been sent, it can’t be aborted or reverted
    * [R14] When receiving a report, the system must store it, recognize the car plate, if possible, and marked as unchecked
* [G2] The System must allow logged-in users to see their past reports
    * [D3] When using the S2B, the user’s device is always connected to internet 
    * [D5] The internet connection works properly without failure
    * [R1] A user must be able to sign up to the system with a unique personal username and password
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username    
    * [R15] When a user asks for his/her reports, the system must provide the saved reports sent by that user
* [G3] The system must allow logged-in users to retrieve information about the position and types of valid reports
    * [D3] When using the S2B, the user’s device is always connected to internet 
    * [D4] When using the S2B, the user’s device has a valid GPS signal
    * [D5] The internet connection works properly without failure
    * [D7] The user does not fake his position 
    * [R1] A user must be able to sign up to the system with a unique personal username and password
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username     
    * [R16] When getting the valid reports by area, a user can choose a position, or automatically get his/her from the GPS
    * [R17]When getting the valid reports by area, the system must provide all the valid reports near the position given by the user and display their violation type through the MS
* [G4] The system must allow verified authorities to mine information about date, time, position and type of valid reports
    * [D5] The internet connection works properly without failure
    * [D8] Every location has one and only one municipality
    * [D10] Each municipality has its own account, certified and authorized by a state authority
    * [D11] Each municipal employee receives his/her official credentials from the municipality (different from those used for report violations)
    * [D12] Each local officer receives his/her official credentials from the municipality (different from those used for report violations)
    * [D13] The municipality voids credentials of its employees or local officers at the end of their service
    * [D14] When using the S2B, the authority's device is always connected to internet
    * [R2] The system must allow a municipality to create account for its employees and local officers
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username
    * [R18] When mining the information, a municipal employee or a local officer can access only to violations type of reports occurred in his/her municipality
    * [R19] When mining the information, a municipal employee or a local officer can filter reports by area, date, time or type of violation
* [G5] The system must allow verified authorities to retrieve statistics about valid reports
    * [D5] The internet connection works properly without failure
    * [D8] Every location has one and only one municipality
    * [D10] Each municipality has its own account, certified and authorized by a state authority
    * [D11] Each municipal employee receives his/her official credentials from the municipality (different from those used for report violations)
    * [D12] Each local officer receives his/her official credentials from the municipality (different from those used for report violations)
    * [D13] The municipality voids credentials of its employees or local officers at the end of their service
    * [D14] When using the S2B, the authority's device is always connected to internet
    * [R2] The system must allow a municipality to create account for its employees and local officers
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username
    * [R20] When a ticket is issued through the TS, the system receives and store it
    * [R21] When retrieving statistics, a municipal employee or a local officer can access only to reports of violations that occurred in his/her municipality
    * [R22] The system must be able to calculate statistics from the reports of violations and issued tickets of the municipal employee or local officer’s municipality
* [G6] The system must be able to cross the data retrieved from the municipality with its own, in order to identify unsafe areas and suggest possible interventions and suggest them to municipal employee
    * [D5] The internet connection works properly without failure
    * [D8] Every location has one and only one municipality
    * [D10] Each municipality has its own account, certified and authorized by a state authority
    * [D11] Each municipal employee receives his/her official credentials from the municipality (different from those used for report violations)
    * [D13] The municipality voids credentials of its employees or local officers at the end of their service
    * [D14] When using the S2B, the authority's device is always connected to internet    
    * [D2] The number of possible interventions is finite and there exists an already established correlation between violations and possible interventions
    * [R2] The system must allow a municipality to create account for its employees and local officers
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username    
    * [R23] When getting improvements, a municipal employee can access only to data of reports occurred in his/her municipality
    * [R24] The system must be able to retrieve information about accidents from the MAS (municipal accident system)
    * [R25] The system must be able to identify the possible unsafe areas of the municipal employee or local officer’s municipality
    * [R26] The system must be able to suggest possible interventions on a specific unsafe area
* [G7] The system must allow local officer to set the validity of a report sent by the user
    * [D5] The internet connection works properly without failure
    * [D8] Every location has one and only one municipality
    * [D10] Each municipality has its own account, certified and authorized by a state authority
    * [D12] Each local officer receives his/her official credentials from the municipality (different from those used for report violations)
    * [D13] The municipality voids credentials of its employees or local officers at the end of their service
    * [D14] When using the S2B, the authority's device is always connected to internet    
    * [R2] The system must allow a municipality to create account for its employees and local officers
    * [R3] The system must allow only registered users, municipal employee and officers to login with their username and password
    * [R4] A users, municipal employee or local officer must be uniquely identified by his/her username        
    * [R27] A municipal officer must be able to mark a report as valid or not valid
* [G8] The system must ensure that the chain of custody of the information coming from the user to the municipality is never broken, and the information is never altered
    * [D5] The internet connection works properly without failure
       
### 3.2.6. Traceability matrix
The following table keeps track of the relation between Use Cases and Requirements

| Use Cases | Requirements |
| ---- | ---- |
| Sign-Up | [R1] |
|Registered User Log-In|[R4]|
|Add Report |[R5],[R6],[R7],[R8],[R9],[R10],[R11],[R12],[R13],[R14]|
|Get My Reports |[R15]|
|Get Violations Type By Area|[R16],[R17]|
|Authority Log-In|[R2],[R3]|
|Get Improvements|[R23],[R24],[R25],[R26]|
|See Statistics|[R20],[R21],[R22]|
|Mine Reports By Type|[R18],[R19]|
|Mine Reports By Date|[R18],[R19]|
|Mine Reports By Time|[R18],[R19]|
|Mine Reports By Area|[R18],[R19]|
|Validate Reports|[R27]|

## 3.3. Performance requirements
The system does not have any particular performance requirements. Obviously it will have to be able to handle multiple operation from multiple clients (users and authorities) at same time.
## 3.4. Design constraints
### 3.4.1. Standards compliance 
The system adopts the current traffic rules in order to provide all the possible VTs.
### 3.4.2. Hardware limitations
The system presents hardware requirements only on the user's side. As a matter of fact the user is required to have a smartphone with a camera and internet connection (wifi or mobile). Authorities need at least a device capable of connecting to the net.
## 3.5. Software systems attributes
### 3.5.1. Reliability
In order to provide reliability, the system must be resilient to faults. The solution is to replicate the system's server. In particular it will be fault tolerant against Byzantine faults (faults where a disconnected system has unforeseeable behaviours) , so the number of replicas of the system's server must be, at least, _(3*number of failing replicas)+1_ , with the _number of failing replicas_ decided during the design and implementation.
### 3.5.2. Availability
In order to provide availability, as mentioned in the reliability section, the system's server must be replicated. In this way it is possible to obtain a 24/7 service. Obviously little deviations from this requirements will be accepted.
### 3.5.3. Security
In order to provide security, both users and authorities data will be always transferred trough encrypted channels. In particular every report, sent by the user, is provided with a digital signature, in order to maintain the chain of custody from the user up to the authorities.
### 3.5.4. Maintainability
In order to provide maintainability, the development of the system have to be done so that will be easy and cheap to fix and modify it in the future. In order to achieve these properties, appropriate design patterns will be used. More of this in the design document.
### 3.5.5. Portability
In order to provide portability, the system will be available as a downloadable app for the user and as a web service for the authorities.