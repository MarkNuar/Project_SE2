# Introduction 
## Purpose
### General purpose
SafeStreets is a crowd-sourced application that wants to provide users with the possibility to notify authorities when parking violations occurs. 
The application will allow users to send pictures of violations, including their date, time, and position. Then authorities will be able to check, 
validate and eventually use those data for issuing tickets. 
To achieve this objective a number of goals have been identified, this vital aims will have to be met before the release of the product. 

In short the S2B will satisfy the following goals:

* [G1] The system must allow logged-in users to send a report of the violation
* [G2] The System must allow logged-in users to see their past reports
* [G3] The system must allow logged-in users to retrieve information about the position and types of valid reports
* [G4] The system must allow verified authorities to mine information about date, time, position and type of valid reports
* [G5] The system must allow verified authorities to retrieve statistics about valid reports
* [G6] The system must be able to cross the data retrieved from the municipality with its own, in order to identify unsafe areas and suggest possible interventions to the municipal employee
* [G7] The system must allow local officer to set the validity of a report sent by the user
* [G8] The system must ensure that the chain of custody of the information coming from the user to the municipality is never broken, and the information is never altered

W.r.t. [G6] an area is considered "unsafe" if and only if a minimum number of possible interventions proposed is met. 

### Document purpose

This document represents the Requirement Analysis and Specification Document (RASD). The aim of this document is to completely describe the system in terms of functional and non-functional requirements, 
analyze the real needs of the users in order to model the system, show the constraints and the limit of the software 
and indicate the typical use cases that will occur after the release. This document is addressed to the developers who 
have to implement the requirements and could be used as a contractual basis.

## Scope
This service is born from the idea that social responsibility on the street can be achieved with the help of everyday citizens.
Such objective is achievable by giving good-willed people the possibility to record parking violations that they spot on the street, and making them visible to the authorities later.
To this kind of people, regarded as unregistered users before their subscription to the service, the choice of signing up is given. 

When an unregistered user signs up, he/she will become a 
registered user, able to login whenever desired. A logged in registered user, to employ the functionalities of the system, must have at least a mobile phone with camera and a GPS localization system, otherwise the product won't be available for use.
With the minimum requirements satisfied the user will be able to compile and send reports of the parking violations and, if interested, search in a selected area for violations that will be showed as dots on an interactive map provided by the map service.
Each report will be composed by the type of the violation, i.e. "vehicle parked in a forbidden area", by a picture of the vehicle with its license plate highlighted, that will be later recognized and added to the report with an OCR service, by the date, hour and position where the picture has been taken. 
Registered users will also be able to see their past reports that, if the authority has already judged them as genuine, will be recognized as valid and highlighted with a green check. Invalid reports will be recognizable by a red cross and reports which evaluation is still pending will be represented by a yellow clock.

The authorities, embodied by the municipal employees and local officers, will be able to retrieve data from the system using any available device capable of connecting to the internet and running a browser.
In particular both the municipal employees and the local officers will be able to extract the reports sent by the users as one or more reports, choosing time, date, area or type of violation. If a group of reports has been chosen they will be showed in the same kind of way as a user, as dots on a map, but a higher number of information will be made available.
Furthermore both the municipal employees and the local officers will be able to retrieve statistics, derived from data collected by the system. The system data is collected with the registered users's reports, along the ticket and accident information possessed by the municipality. 
If the authority possesses such data, it will be retrieved via a ticket service, that will fetch date, time, position and violation type of the vehicle found committing the infraction, and a municipal accident service, that will recover information about road accidents, such as the date, time and the vehicles involved in the accident. 
Moreover the municipal employee, by selecting a position, will be able to search for possible improvements on such position, to see what kind of interventions should be made, and, if some of them have already been completed, he/she can change their status from "not done" to "done", a "done" improvement won't be shown again. 

The last functionality is dedicated to the local officers: after having withdrawn a report, the local officer is able to check the its validity, and eventually utilize its data to fine the vehicle that committed the violation.

## Definitions, Acronyms, Abbreviations
### Definitions
* Report = Collection of Data that represents a Violation, in particular:
    * Picture, a photo of the car that has been found committing a violation. 
    * Date, the date when the picture has been taken.
    * Time, the hour when the picture has been taken.
    * Position, the place, formatted using GPS location, of the vehicle that has been found committing a violation.
* Improvement = a possible road intervention finalized to the development of the road and to achieve a safer environment. 
### Acronyms 
* UU = Unregistered User;
* RU = Registered User;
* ME = Municipal Employee;
* LO = Local Officer;
* S2B = Software to Be;
* TS = Ticket Service;
* MS = Map Service;
* MAS = Municipal Accident Service;
* OCRS = OCR Service;
* VT = Violation type;

For a precise description of RU, ME and LO see paragraph 2.3.
<br />
<br />
<br />
<br />
### Abbreviations
* [Gn] : n-th goal.  
* [Dn] : n-th domain assumption. 
* [Rn] : n-th functional requirement. 
## Revision history
* Version 1.0: 
    * Initial release
* Version 1.1:
    * Partial revision of the domain assumptions and requirements w.r.t. the authorities' credentials
    * Expansion of the security performance chapter
    * Correction of loops in sequence diagrams
    * Correction of typos in G6
    * Correction of use case and sequence diagram for "GetImprovements"
    * Correction of useless requirements about issued tickets (old R20)
## Reference documents
* Specification document: “Mandatory Project Assignment AY 2019‐2020”
## Document structure
The RASD document is composed by six chapters, as outlined below:
 
* **Chapter 1** describes the purpose of the system and the list of goals which the application has to reach. Moreover, it defines the scope, where the aim of the project is defined and the application domain with the shared phenomena are shown. 
* **Chapter 2** offers an overall description of the project. Here the actors, involved in the application’s usage, are identified and the boundaries of the project are defined, listing all the necessary assumptions. Moreover, a class diagram is provided, in order to better understand the general structure of the project. Then some state diagrams are listed to make the evolution of the crucial objects and actors clear. Finally, the functions offered by the system are here more clearly specified, with respect to the previously listed goals. 
* **Chapter 3** represents the body of the document. It contains the interface requirements, which are: user interfaces, hardware interfaces and software interfaces. It then lists some scenarios to show how the system acts in real world situations, followed by the description of the functional requirements, using use cases and sequence diagrams. All the requirements necessary in order to reach the goals are given, linked with the related domain assumptions. Lastly, the non-functional requirements are defined through performance requirements, design constraints and software system attributes. 
* **Chapter 4** contains the Alloy model of some primary aspects with all the related comments and documentation in order to show how the project has been modeled and represented through the language. 
* **Chapter 5** shows the effort which each member of the group has spent working on the project.
* **Chapter 6** contains eventual references used during the writing of the document.