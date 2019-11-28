#Architectural Description

##Overview
The application is a distributed application based on the three logic layers of Presentation, that manages the user's interaction with the system, Application, which handles the logic of the system and Data, which manages the information. 

Those three layers are divided onto four different physical tiers. As shown by the following image, Presentation and Data levels reside on a single tier, while Application level is split into two tiers. The first one is the Web Server, 
responsible for the forwarding of requests from the clients and for the caching of static contents, while the second one is the Application Server, which contains the logic of the system. 

![SimplfiedDeploymentView](./images/exported/SimplifiedDeploymentView.svg) 

In order to maximize the scalability of our system, both the Web and Application server follow a scale-out approach: performances improvement is obtained through nodes replication. 
Because of this approach, load-balancing system are used in order to distribute the working load among the various nodes. 
All the nodes of the Application Server use a "share everything" configuration, because there is only one, shared database with one point of access. 
Moreover, the Data layer is accomplished by exploiting and external DBMS service already available on the market. In this way we avoid devoting time on difficult
problems about data replication and consistency, which are already solved by the existing well tested database systems. 

Every communication channel is secured by using firewalls. In this way, the entire Application layer is secured in a DMZ. In this way attacks and intrusions from malicious 
clients are prevented. It is important to note that, because the DBMS is located on a different tier with respect to the Application Server, a firewall between them 
can improve the security of the system against malicious attacks coming from the data base, especially in our case of an external bought DBMS. 
Finally, also communication channels between the Application server and other services, like the Ticket service, Municipal Accident service and Map service, are secured for the 
same reasons explained above.


##Component view
-- image of the component view
Only component in the application server.
* **Router**: receives HTTP requests and forward them to the internal components of the application server (maybe add AP for application server). Then forwards the reply
back to the clients. Token used for granting the right function and providing context. 
* **UserManager**: this component is responsible for managing the users and is composed by two sub-components: 
    * **LoginManager**: this component is responsible for granting access to registered users. In particular, the component receives the access credentials and returns an unique token used for further communication
    by the user.
    * **SignUpManager**: this component is responsible for the registration of unregistered users. In particular is receives the new access credentials and save them in the system's database. 
    
##Deployment view

##Runtime view

##Component interfaces

##Selected architectural styles and patterns

##Other desing decisions