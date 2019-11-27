#Architectural Description

##Overview
The application is a distributed application based on the three logic layers of Presentation, that manages the user's interaction with the system, Application, which handles the logic of the system and Data, which manages the information. 

Those three layers are divided onto four different physical tiers. As shown by the following image, Presentation and Data levels reside on a single tier, while Application level is split into two tiers. The first tier is the Web Server, 
responsible for the forwarding of requests from the clients and for the caching of static contents, while the second is the Application Server, 
which contains the logic of the system. 
<br/>
<br/>
![SimplfiedDeploymentView](./images/exported/SimplifiedDeploymentView.svg) 

- replication -> fault tolerance
- firewall -> DMZ 

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