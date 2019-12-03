# Introduction

## Purpose
This document is the Design Document (DD) of the SafeStreets system. Its purpose is to completely describe the logical and physical architecture of the system. It's written for project managers, developers, testers and Quality Assurance people.
This document describes	the	components forming part of the	system with the related run-time processes. All the	design choices are listed and motivated.	
In particular, this document contains:
* High-level architecture
* Main	components, their interfaces and deployment
* Runtime behavior
* Chosen design	patterns
* Details about	the	user interface and its flow
* Mapping of the requirements on the architecture’s	components
* Implementation, integration and testing plan

## Scope
SafeStreets is a crowd-­sourced application that intends to provide users with the possibility to notify authorities when traffic violations occur, and in particular parking violations.

The system addresses to:
* Generic people (Registered and Unregistered User)
* Authorities (Local Officer and Municipal Employee)

An unregistered user must be able to register to the service, becoming a registered user.

A registered user must be able to send reports about parking violation (which include date, time, position, type of violations and a picture of the vehicle), to see his/her past reports and to see valid violations occurred in a certain area (unsafe area).

An authority must be able to mine reports concerning his/her municipality and retrieve statistics about reports and issued tickets. In particular, a municipal employee must also be able to get informations about possible improvements to be realized on the municipal territory (starting from reports and accidents occurred) and to eventually set them or some of them as "done", while a local officer must be able also to validate reports.

SafeStreets data about valid reports are shared with the municipal ticket service in order to issue tickets, so the system must guarantee that the chain of custody of the information coming from the users is never broken.

## Definitions, Acronyms, Abbreviations
### Definitions
* Report = collection of data that represents a violation, in paticular:
    * Picture: a photo of the vehicle that has been found committing a violation
    * Date: the date when the picture has been taken
    * Time: the hour when the picture has been taken
    * Position, the place, formatted using GPS location, of the vehicle that has been found committing a violation.
* Improvement = a possible road intervention finalized to the development of the road and to achieve a safer
environment.
* Token = string provided to the client as an answer to the login request, which contains information about the user and will always be part of the following requests

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
* DMZ = demilitarized zone
* DBMS = database management system

### Abbreviation

[Gn] : n-th goal
[Dn] : n-th domain assumption
[Rn] : n-th functional requirement (referring to RASD)

## Revision history
* Version 1.0:
    * Initial release

## Reference documents

* Specification document: "Mandatory Project Assignment AY 2019‐2020"

## Document structure

The DD document is composed by seven chapters:

* **Chapter 1** is an introduction and describes the purpose of the document and defines the scope of the system. It also contains the description of definitions, acronyms and abbreviations used inside the document.
* **Chapter 2** describes the architectural design of the system. It's the core section of the document and contains a description of the high-level components and their interactions, the deployment of the system along with some dynamical views of the components, the selected design patterns and architectural styles and other design decisions.
* **Chapter 3** describes a UX model for the user interface (presented in RASD) for normal users and authorities
* **Chapter 4** provides the requirements traceability, specifying how the requirements identified in the RASD are linked to the design elements (components and architectural decisions) defined in this document
* **Chapter 5** includes the description of the implementation plan, the integration plan and the testing	plan, specifying how all these phases are thought to be executed
* **Chapter 6** shows the effort which each member of the group has spent working on the project
* **Chapter 7** contains eventual references used during the writing of the document