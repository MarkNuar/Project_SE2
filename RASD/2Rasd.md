# 2. Overall Description
## 2.1. Product perspective
The product will be developed from scratch and will be organized in two different macro-entities, one dedicated to the normal user, the other dedicated to the authorities, that may be MEs or LOs (for more information on the users see section 2.3). 
The two parts will be differentiated to satisfy different needs of different parties that will employ SafeStreets. Their form, along with the one of some other parts of the system, is represented with the following high level class diagram. 

Class diagram


![Class diagram](./images/Class_diagram/SafeStreetsUML.svg)




State diagrams

Some of the entities of the class diagram can be found assuming different states. The following diagrams show those states that will be found.

User state diagram, assumed by all users (authorities and normal users) 
![Class diagram](./images/State_diagrams/UserStateDiagram.svg)

Report construction state diagram
![Class diagram](./images/State_diagrams/ReportCreationToolStateDiagram.svg)

Report state diagram (also see section 2.2.1)
![Class diagram](./images/State_diagrams/ReportStateDiagram.svg)


Improvement state diagram (also see section 2.2.2)
![Class diagram](./images/State_diagrams/ImprovementStateDiagram.svg)





## 2.2. Product functions
In this section the most important functions of the system are reported.
### 2.2.1 Report
The core of the system revolves around the management of the reports. Reports, that are structures that contains information about a violation, are created and then saved in the system with an "add" function. 
The "add" function builds the report, assembling the picture of the car that has committed a violation, with its license plate, date and time, GPS location, and violation type, sending it to SafeStreets at the end of the procedure.
When a report is received, the system checks if the license plate is readable, if not the report is discarded as "not valid", otherwise a set of possible operations becomes available. These operations are the "validate" and "mine"  functions.
The "validate" function shows every stored report, which status is set as "to be verified", with all the information listed above, and permits to change their status to "valid", if the report is considered legit, or "not valid", in the opposite case.
The "mine" functions finds the report type, of existing valid reports, searching in the system using type, date, time or area as parameters for the query. 

###2.2.2 Improvement
Using both data provided by the authorities and the data owned by SafeStreet is possible to identify the unsafe areas of a Municipality. 
Using the improvement function makes it possible to determine feasible solutions that can be used to improve the safety of such areas, i.e. add a barrier	
between	the bike lane and the part of the road for motorized vehicles to prevent unsafe parking.

###2.2.3 Statistics
With the information, about issued tickets and accidents that happened on the street, retrievable from the Authorities, and SafeStreets' own data, is possible to build statistic about the violations and the perpetrators who cause them.
Some examples of these statistics can be seen in section 3.3.1 in the Local Officer paragraph. 
## 2.3. User characteristics
There are three kind of users that will employ this product:
1. User: the normal, every day citizen that has subscribed to SafeStreets and recognized as RU. The RU is able to compile and send reports, see the chronology of his reports and search for violations in a selected area.
   Other functions will not be accessible by the user to protect privacy of other people, not necessary others RU, and to avoid providing excessive useless data to RU.   
    
2. Municipal Employee: the ME is someone hired from the municipality to which the task of accessing information,on behalf of the authorities, will be given. To such kind of individuals, a unique username and password will be provided, already linked to an account able to utilize all functions dedicated to the retrieval of data.
A ME is unable to add or modify the status of any reports, but is able to change the status of an improvement from "not done" to "done". 
    
3. Local Officer: The LO is part of the law enforcement of the municipality. As the ME, the LO receives his own account information from the municipality that will permit him/her to utilize all the functions to retrieve data.
    Unlike the ME, the LO is able to modify the state of a report but is unable to do so with an improvement. An LO may, or may not, utilize the data stored by SafeStreet to write tickets for the cars that committed a violation
   
## 2.4. Assumptions, dependencies and constraints
To assure the correct formulations of the requirements, and avoid unforeseen events, a certain amount of the world phenomena is considered as follows.
* [D1] The number of possible violations is finite and is aligned to the current traffic rules
* [D2] The number of possible interventions is finite and there exists an already established correlation between violations and possible interventions
* [D3] When using the S2B, the user’s device is always connected to internet 
* [D4] When using the S2B, the user’s device has a valid GPS signal
* [D5] The internet connection works properly without failure
* [D6] The user device has a camera and is able to take pictures 
* [D7] The user does not fake his position 
* [D8] Every location has one and only one municipality
* [D9] Car plates are unique
* [D10] Each municipality has its own account, certified and authorized by a state authority
* [D11] Each municipal employee receives his official credentials from the municipality (different from those used for report violations)
* [D12] Each local officer receives his official credentials from the municipality (different from those used for report violations)
* [D13] The municipality voids credentials of its employees or local officers at the end of their service
* [D14] When using the S2B, the authority's device is always connected to internet
