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
![ComponentDiagram](./images/exported/ComponentDiagram.svg) 
The Component view diagrams represents, explicitly, only the components of the Application server, as they depict the main section of the system. 
Below we describe in depth the function of every internal server component made ad-hoc for the system (the ones in green).
* **Router**: receives HTTP over SSL/TLS requests following the Rest paradigm (see below in the "Component interface" section for further details) and forward them to the others internal components of the Application server. Then forwards the replies
back to the clients. It is relevant to note that temporary tokens are adopted, in order to define which functionalities are accessible for each client. Every client receives its personal token after the login procedure. 
* **UserManager**:
    * **LoginManager**: this component is responsible for granting access to registered users. In particular, the component receives the access credentials and returns an unique token used for further communication
    by the user.
    * **SignUpManager**: this component is responsible for the registration of unregistered users. In particular is receives the new access credentials and save them in the system's database. 
* **ReportManager**:
    * **ReportReceiver**: this component is responsible for receiving the data of a new report and storing them in the database. In particular it takes care of the following tasks:
        * retrieving of the municipality where the report has been created, by employing the MS apis.
        * recognizing the car's plate in the picture, by employing the OCRS apis. In case of an unrecognizable plate, the report status is set to "NOTVALID" by default, otherwise is set to "NOTVERIFIED" by default(which means that a local officer has still to prove its validity).
        * saving the report in the system's database.
    * **ReportValidator**: this component is responsible for the modification of status of a report, by changing if from "NOTVERIFIED" to "VALID" or "NOTVALID" according to the request sent by the local officer. 
* **ReportMiner**: this component is responsible for obtaining reports by querying the database. It is crucial to note that the request of the authority can come from directly from the Router of from other components like the ImprovementsManager and StatisticsComputationManager. In both cases, authority's municipality is used for filtering reports. Various form of mining can be performed, in particular it's is possible to mine:
    * All: all the reports produced in the same municipality of the authority, who has issued the request, are returned.
    * By Type: between all the reports produced in the same municipality of the authority, who has issued the request, only those which have the given violation's type are returned.
    * By Date: between all the reports produced in the same municipality of the authority, who has issued the request, only those which were composed in the given date are returned.
    * By Time: between all the reports produced in the same municipality of the authority, who has issued the request, only those which were composed in the given time, regardless the date, are returned.
    * By Area: between all the reports produced in the same municipality of the authority, who has issued the request, only those which were composed in the given area, defined by a center and a radius, are returned.
* **ImprovementManager**: this component is responsible for getting the possible improvements belonging to the requesting authority's municipality and for setting their status. In order to determine the possible improvements, it crosses the data
coming from the external MAS and from the MineReports component. When a new improvement is determined, it's status is set by default to "NOTDONE" and it is saved in the database. When no further improvements can be discovered, all those which have the status set to "NOTDONE" 
are returned to the requester. Moreover, through this component, an authority can set the status of a specific improvement to "DONE", after fetching all the possible one as described before.  
* **StatisticsComputationManager**: this component is responsible for building statistics, belonging to the requesting authority's municipality, about the violations and the 
perpetrators who cause them by crossing the information coming from reports received by the ReportMiner and from issued tickets coming from the TS. 
It is important to note that statistics are always crunched on request and never saved on the server, because they can change at any time. 
* **StatisticsDownloadManager**: this component is responsible for creating a non materialized document (which means it is not saved on server side, but only generated
and sent) about the statistics, belonging to the requesting authority's municipality, 
by fetching them from the StatisticsComputationManager. The resulting document is returned to the caller.
##Deployment view
![DeploymentView](./images/exported/DeploymentView.svg) 

//TODO 
This picture shows how the system should be deployed. 
The Database server and the Application server are deployed on two different physical nodes, 
in order to have more security for data and to achieve a decoupled architecture. 
The Web server, deployed on its physical node, has the purpose of caching static contents (which are, for example, .html and .css files) for the Web application. 
Every other request received from the clients (both the Web and Mobile application) is automatically forwarded to the Application server. 

##Runtime view

##Component interfaces

###REST table of resources

| URI | POST | GET | PUT | DELETE |
| ---- | ---- | ---- | ---- | ---- |
| /reports/default | X | - | - | - |
| /reports/default/?id=xxx| - | X | - | - |
| /reports/default/unsafearea | - | X | - | - |
| /reports/notverified/?id=xxx | - | X | X | - |
| /reports/valid/?id=xxx | - | X | - | - |
| /users/login/?id=xxx | - | X | - | - |
| /users/authorities/login/?id=xxx| - | X | - | - |
| /users/registration/?id=xxx| X | - | - | 
| /improvements/?id=xxx | - | X | X | - |
| /statistics/?id=xxx | - | X | - | - |
 //in report not valid non mi serve niente in realtà


"X" : the operation is applicable on the resource
 
"-" : the resource is inapplicable on the resource

"?" : the resource is applicable only on specific conditions that will be explained in the following pages 

The data that will be transmitted will be composed of XML files.

To recognize the user who sent a request to the server, the system will employ tokens. A token is a cripted String that is given after the login and contains a precise set of information:
* User type information: this
* User identifier:
* Creation time: 

------------------------------------------------------------------------------------------------------------------------------------

**POST** /users/registration/?id={id}

**Parameters**
| Field | Type | Description |
| ---- | ---- | ---- |
|  id | String | The username of the user who is trying to register |

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| email | String | The email of the user |
| passwordFirst | String | The password of the user |
| passwordSecond | String | The same password as before |

**Error 401** (Unauthorized)

| Field |  Description |
| ---- |  ---- |
| ExistingUsername | Someone with the same username is already registered | 
| DifferentPassword | The second password is different from the first one |
| WEREALYNEED?ExistingMail | This email is already associated with another account |


------------------------------------------------------------------------------------------------------------------------------------

**GET** /users/login/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
|  id | String | The username of the user who is trying to login |

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| loginInformation | String | The email or username of the user |
| password | String | The password of the user |


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| token | String | A token that represents the user |


**Error 401** (Unauthorized)

| Field |  Description |
| ---- |  ---- |
| WrongUsernameOrPassword | The written username and password does not correspond to any existing user | 

------------------------------------------------------------------------------------------------------------------------------------

**GET** /users/authorities/login/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
|  id | String | The username of the user who is trying to login |

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| loginInformation | String | The username of the user |
| password | String | The password of the user |
| workRole | String | This will be 'ME' or 'LO' |


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| token | String | A token that represents the user and the municipality he/she works in|
| municipalityID| String | The id of the municipality where the ME or LO works |


**Error 401** (Unauthorized)

| Field |  Description |
| ---- |  ---- |
| WrongUsernameOrPassword | The written username and password does not correspond to any existing user | 
| NotCorrespondingRole | The selected work role does not correspond to the user which given login and password corresponds to | 


------------------------------------------------------------------------------------------------------------------------------------

**POST** /reports/default


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| vehicle | Object | The vehicle information |
| &nbsp;&nbsp;&nbsp;&nbsp;licensePlate | String | The license plate of the vehicle |
| position | Object | The  |
| &nbsp;&nbsp;&nbsp;&nbsp;latitude | String | The license plate of the vehicle |
| &nbsp;&nbsp;&nbsp;&nbsp;longitude | String | The license plate of the vehicle |
| picture | Object | Representation of the image of the vehicle |
| violation | Object[] | An array of the type of violation |
| &nbsp;&nbsp;&nbsp;&nbsp;violationType | String | The type of violation |
| date | String | The datetime in <span style="color:blue">dd-MM-yyyyThh:mm:ss</span> format |

**Success 201** (resource created)

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that the system has assigned to the sent report, this id will uniquely identify the report and will also contain information about the user which sent it |

------------------------------------------------------------------------------------------------------------------------------------

**GET** /reports/default/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the report that the user wants to see|

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| vehicle | Object | The vehicle information |
| &nbsp;&nbsp;&nbsp;&nbsp;licensePlate | String | The license plate of the vehicle |
| position | Object | The  |
| &nbsp;&nbsp;&nbsp;&nbsp;latitude | String | The license plate of the vehicle |
| &nbsp;&nbsp;&nbsp;&nbsp;longitude | String | The license plate of the vehicle |
| picture | Object | Representation of the image of the vehicle |
| violation | Object[] | An array of the type of violation |
| &nbsp;&nbsp;&nbsp;&nbsp;violationType | String | The type of violation |
| date | String | The datetime in <span style="color:blue">dd-MM-yyyyThh:mm:ss</span> format |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the report and the token of the user have been analyzed. It was found that the user was not the one who submitted the report and as such he/she was not permitted to see report  |



------------------------------------------------------------------------------------------------------------------------------------

**GET** /reports/default/unsafearea

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id of the report |
| ? | ? | ? |

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested|


------------------------------------------------------------------------------------------------------------------------------------


**GET** /reports/notverified/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the LO works for |


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id of the report |
| ? | ? | ? |


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested|


--------------------------------------------------------------------------------------------------------------------------------------

**PUT** /reports/notverified/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the LO works for |


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id of the report |
| newStatus | String | The result of the validation performed by the LO |



**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested |


----------------------------------------------------------------------------------------------------------------------------------------


**GET** /reports/valid/?id={id}

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the LO works for |


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id of the report |
| ? | ? | ? |

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's  municipality was not the one of the reports requested  |


----------------------------------------------------------------------------------------------------------------------------------------

**GET** /improvements/?id={id}


**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the ME works for |


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  |


----------------------------------------------------------------------------------------------------------------------------------------

**PUT** /improvements/?id={id}


**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the LO works for |

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id of the improvement |


**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's municipality was not the one of the reports requested |


----------------------------------------------------------------------------------------------------------------------------------------

**GET** /statistics/?id={id}


**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
| id | String | The id that uniquely identifies the municipality which the LO works for |


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
| ? | ? | ? |

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
| UserNotAuthorized | The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  |







##Selected architectural styles and patterns

##Other design decisions