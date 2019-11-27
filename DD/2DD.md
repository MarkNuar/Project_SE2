#Architectural Description

##Overview
The application is a distributed application based on the three logic layers of Presentation, that manages the user's interaction with the system, Application, which 
 handles the logic of the system and Data, which manages the information. Those three layers are divided onto four different physical tiers. 
As shown by the following image, Presentation and Data levels reside on a single tier, while Application level is split into two tiers. The first tier is the Web Server, 
responsible for the forwarding of requests from the clients and for the caching of static contents, while the second is the Application Server, 
which contains the logic of the system. 

##Component view

##Deployment view

##Runtime view

##Component interfaces

##Selected architectural styles and patterns

##Other desing decisions