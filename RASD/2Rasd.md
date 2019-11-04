# 2. Overall Description
## 2.1. Product perspective
The product will be organized in two different entities, one dedicated to the normal user, the other dedicated to the authority.
The two parts are differentiated to satisfy the different needs of all parties that will employ SafeStreets

//class diagram

//state diagram


## 2.2. Product functions
In this section the most important functions of the system are reported.
###2.2.1 Add Report
//
###2.2.2 Get Violations
//
###2.2.3 Mine Reports
//
###2.2.4 See Statistics
//
###2.2.5 Get Improvements
//
## 2.3. User characteristics
There are three kind of users that will employ this product:
1. User: the normal, every day citizen that has subscribed to SafeStreets and recognized as RU. The RU is able to compile and send reports, see the chronology of his reports and search for violations in a selected area.
   Other functions will not be accessible by the user to protect privacy of other people, not necessary others RU, and to avoid providing excessive useless data to RU.   
    
2. Municipal Employee: the ME is someone hired from the municipality to which the task of accessing informations, on behalf of the authorities, will be given. To such kind of individuals, a unique username and password will be provided, already linked to an account able to utilize these functions:
    
    
3. Local Officer: The LO is part of the law enforcement of the municipality. As the ME, the LO receives his own account informations from the municipality that will permit him/her to utilize
   
## 2.4. Assumptions, dependencies and constraints
To assure the correct formulations of the requirements, and avoid unforeseen events, a certain amount of the world phenomena is considered as fixed. These constraints are as follows.
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

//Maybe something to add



//

//

//

//




 * AddReport: when the users finds a vehicle which is commiting some kind of violation, he/she can take a picture and send a report to SafeStreets. The report will be made accessible to the authorities.
    * GetMyReports: if there are any, the user will be able to see the chronology of his reports.
   * GetViolationTypesByArea: the user can search for recurrent violations in an area, receiving only the type of violations committed. Other data on the violations, such as the photo of the car, will be omitted.
   
   *   SeeStatistics: is possible to the ME 
        * GetImprovements: the ME is able to retrieve a list of possible improvements to apply on the street to achieve a safer environment for all the road users. All recommended improvements are applicable and have not been made yet.  
       * NotifyImprovements: the ME is able to modify the state of the improvement from "not completed" to "completed". A completed improvement will never be shown again with the GetImprovement function.
 * SeeStatistics:
           * ValidateReports:
           * MineReports: