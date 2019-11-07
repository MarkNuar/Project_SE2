# 1. Introduction 
## 1.1. Purpose
SafeStreets is a crowd-sourced application that wants to provide users with the possibility to notify authorities when parking violations occurs. The application will allow users to send pictures of violations, including their date, time, and position. Then authorities will be able to check, validate and eventually use those data for issuing tickets. 

In particular, these are the goals of the S2B:
* [G1] The system must allow logged-in users to send a report of the violation
* [G2] The System must allow logged-in users to see their past reports
* [G3] The system must allow logged-in users to retrieve information about the position and types of valid reports
* [G4] The system must allow verified authorities to mine information about date, time, position and type of valid reports
* [G5] The system must allow verified authorities to retrieve statistics about valid reports
* [G6] The system must be able to cross the data retrieved from the municipality with its own, in order to identify unsafe areas and suggest possible interventions and suggest them to municipal employee
* [G7] The system must allow local officer to set the validity of a report sent by the user
* [G8] The system must ensure that the chain of custody of the information coming from the user to the municipality is never broken, and the information is never altered

## 1.2. Scope
This service is born from the idea that social responsibility on the street can be achieved with the help of everyday citizens. 
Such objective is achievable by giving good-willed people the possibility to record parking violations that they spot on the street, and making them visible to the authorities later.
This kind of people will be able to compile and send reports of the parking violations, and search for violations in a selected area. They will also be able
to see their past reports that, if the authority has already judged them as genuine, will be recognized as valid.
The authorities will be embodied by the municipal employees and local officers. Both of them will be able to extract the reports sent by the users, choosing time, date, area or type of violation. 
Furthermore they will be able to retrieve statistics derived from the collected data. Moreover the municipal employee is able to change the status of an improvement from "not done" to "done". The local officer is able to check the validity of a report and eventually utilize the stored data to write tickets for the cars that committed a violation.
 
## 1.3. Definitions, Acronyms, Abbreviations
### 1.3.1 Definitions
* Report = Collection of Data that represents a Violation, in particular:
    * Picture
    * Date
    * Time
    * Position
### 1.3.2 Acronyms 
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
### 1.3.3 Abbreviations
* [Gn] : n-goal.  
* [Dn] : n-domain assumption. 
* [Rn] : n-functional requirement. 
## 1.4. Revision history
* Version 1.0: 
    * Initial release
## 1.5. Reference Documents
* Specification document: “Mandatory Project Assignment AY 2019‐2020”
## 1.6. Document Structure
The RASD document is composed by six chapters, as outlined below: 
* **Chapter 1** describes the purpose of the system informally and the list of goals which the application has to reach. Moreover, it defines the scope, where the aim of the project is defined and the application domain with the shared phenomena are shown. 
* **Chapter 2** offers an overall description of the project. Here the actors involved in the application’s usage lifecycle are identified and the boundaries of the project are defined, listing all the necessary assumptions. Furthermore, a class diagram is provided, aid to better understanding the general structure of the project, with all the related entities. Then some state diagrams are listed to make9the evolution of the crucial objects clear. Finally, the functions offered by the system are here more clearly specified, with respect to the previously listed goals. 
* **Chapter 3** represents the body of the document. It contains the interface requirements, which are: user interfaces, hardware interfaces and software interfaces. It then lists some scenarios to show how the system acts in real world situations, followed by the description of the functional requirements, using use cases and sequence diagrams. All the requirements necessary in order to reach the goals are given, linked with the related domain assumptions. Lastly, the non-­‐functional requirements are defined through performance requirements, design constraints and software system attributes. 
* **Chapter 4** contains the Alloy model of some critical aspects with all the related comments and documentation in order to show how the project has been modeled and represented through the language. 
* **Chapter 5** shows the effort which each member of the group spent working on the project.
* **Chapter 6** contains eventual new 
