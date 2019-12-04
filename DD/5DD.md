#Implementation, Integration and Test Plan
The system is composed by various subsystems, some of which need to be implemented and tested. 
Below we list them.
* To be implemented and tested:
    * UserMobileApp
    * LocalOfficerWebApp
    * MunicipalEmployeeWebApp
    * WebServer
    * ApplicationServer
* Already implemented and tested:
    * DBMS
    * OCRS
    * MS
    * TS
    * MAS
    
The approach followed is a "bottom-up" one, where all the interfaces are defined a priori, in order to 
develop and test non-implemented components in parallel. Moreover, implementation and integration follow the same order, 
such a way that the system will be ready and functional as soon as possible. 
It is worth noting that external components already implemented do not need to be tested. 

Beneath we present a table that specify the main features of the system, their importance for the customer and their 
difficulty of implementation. 
   

| Feature | Importance for the customer | Difficulty of implementation |
| ---- | ---- | ---- |
| SignUp and Login | Low | Low |
| Add a report for RU | High | Medium |
| Retrieve reports for RU | High | Low |
| Get unsafe areas for RU | Medium | Low |
| Mine reports for ME/LO | High | Medium |
| See statistics for ME/LO | Medium | Medium |
| Download statistics for ME/LO | Medium | Low |
| Validate reports for LO | High | Low |
| Get improvements for ME | High | High |
| Functional mobile app for RU | High | Medium 
| Functional web app for LO | High | Medium | 
| Functional web app for ME | High | Medium | 

The order of implementation and testing of missing components is based on the previous table, starting from components
associated to more difficult and crucial features. 
The following table specify the order of implementation and testing, associating components to relative features. 
It is important to note that, components enlisted in the same "Phase of I&T" (where I&T stands for "implementation and testing)
have to be developed in parallel. 

| Phase of I&T | Component | Features |
| ---- | ---- | ---- |
| 1 | ReportReceiver | Add a Report for RU |
| 1 | ReportMiner | Retrieve Reports for RU, Mine Reports for ME/LO, Get unsafe areas for RU |
| 2 | ReportValidator | Validate reports for LO |
| 2 | ImprovementsManager | Get improvements for ME |
| 2 | StatisticsComputationManager | See statistics for ME/LO |
| 3 | StatisticsDownloadManager | Download statistics for ME/LO |
| 4 | Router | No specific user feature | 
| 4 | SignUpManager, LoginManager | SignUp and Login |
| 5 | WebServer | No specific user feature | 
| 5 | UserMobileApp | Functional mobile app for RU |
| 5 | LocalOfficerWebApp | Functional web app for LO | 
| 5 | MunicipalEmployeeWebApp | Functional web app for ME|

