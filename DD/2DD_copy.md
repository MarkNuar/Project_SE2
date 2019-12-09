**GET**   &nbsp;&nbsp;&nbsp;&nbsp;/reports/default/unsafearea

This request retrieves the type of violations in certain area.

**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
 position & Object & The position, expressed in DMS, of the center of the area which the RU wants to know about \\
\hspace{2.5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{2.5mm}longitude & String & The longitude where the vehicle was recorded to be \\

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
 pseudoReport & Object[] & The list of partial reports that can be seen bya a RU \\
\hspace{2.5mm}position & Object & The position, expressed in DMS, of the vehicle when the report was submitted  \\
\hspace{5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{5mm}longitude & String & The longitude where the vehicle was recorded to be \\
\hspace{2.5mm}violation & Object[] & An array of the type of violation \\
\hspace{5mm}violationType & String & The type of violation \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
 NoReportError & The requested resource caused an error on the database, this could both mean that the resource was not found on the database or that the database had internal error or an error on the connection \\ 


------------------------------------------------------------------------------------------------------------------------------------


**GET**   &nbsp;&nbsp;&nbsp;&nbsp;/reports/notverified/?id={id}

This request retrieves the reports that are waiting for validation in a certain municipality.

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
 reports & Object[] & A list of the valid reports of a certain municipality \\
\hspace{2.5mm}reportId & String & The string that uniquely identifies a report \\
\hspace{2.5mm}vehicle & Object & The vehicle information \\
\hspace{5mm}licensePlate & String & The license plate of the vehicle \\
\hspace{2.5mm}position & Object & The position, expressed in DMS, of the vehicle when the report was submitted  \\
\hspace{5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{5mm}longitude & String & The longitude where the vehicle was recorded to be \\
\hspace{2.5mm}picture & Object & Representation of the image of the vehicle \\
\hspace{2.5mm}violation & Object[] & An array of the type of violation \\
\hspace{5mm}violationType & String & The type of violation \\
\hspace{2.5mm}date & String & The datetime in <span style="color:blue">dd-MM-yyyyThh:mm:ss</span> format \\

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
 NoReportError & The requested resource caused an error on the database, this could both mean that the resource was not found on the database or that the database had internal error or an error on the connection \\ 

--------------------------------------------------------------------------------------------------------------------------------------

**PUT**   &nbsp;&nbsp;&nbsp;&nbsp;/reports/notverified/?id={id}

This request modifies the status of a report. 

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id of the report \\
 newStatus & String & The result of the validation performed by the LO \\



**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested \\


----------------------------------------------------------------------------------------------------------------------------------------
**GET**   &nbsp;&nbsp;&nbsp;&nbsp;/reports/valid/?id={id}

This request gets all the valid reports in a certain municipality.

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
 requestType & String & The type of request issued (i.e. "by area") \\
 requestField & String & The field that contains precise information on the request \\

**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
 reports & Object[] & A list of the valid reports of a certain municipality \\
\hspace{2.5mm}reportId & String & The string that uniquely identifies a report \\
\hspace{2.5mm}vehicle & Object & The vehicle information \\
\hspace{5mm}licensePlate & String & The license plate of the vehicle \\
\hspace{2.5mm}position & Object & The position, expressed in DMS, of the vehicle when the report was submitted  \\
\hspace{5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{5mm}longitude & String & The longitude where the vehicle was recorded to be \\
\hspace{2.5mm}picture & Object & Representation of the image of the vehicle \\
\hspace{2.5mm}violation & Object[] & An array of the type of violation \\
\hspace{5mm}violationType & String & The type of violation \\
\hspace{2.5mm}date & String & The datetime in <span style="color:blue">dd-MM-yyyyThh:mm:ss</span> format \\

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's  municipality was not the one of the reports requested  \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
 NoReportError & The requested resource caused an error on the database, this could both mean that the resource was not found on the database or that the database had internal error or an error on the connection \\ 


----------------------------------------------------------------------------------------------------------------------------------------

**GET**   &nbsp;&nbsp;&nbsp;&nbsp;/improvements/?id={id}

This request retrieves all the suggested improvements in a certain municipality.

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the ME works for \\


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
 improvements & Object[] & The list of suggested improvements \\
\hspace{2.5mm}type & String & The of the improvement, i.e. "add a cycling lane" \\
\hspace{2.5mm}position & Object & The position of the improvement expresses in DMS \\
\hspace{5mm}latitude & String & The latitude where the suggested improvement will be expected to be \\
\hspace{5mm}longitude & String & The longitude where the suggested improvement will be expected to be  \\
\hspace{2.5mm}state & String & The status of the improvement, it could be "DONE" or "NOT DONE" \\
\hspace{2.5mm}improvementId & String & The id that uniquely identifies the improvement on the database \\

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
 NotEnoughReportError & The requested improvements could not be found on the database and the available information on the Municipality is not enough to compute correct suggestions \\ 

----------------------------------------------------------------------------------------------------------------------------------------

**PUT**   &nbsp;&nbsp;&nbsp;&nbsp;/improvements/?id={id}

This request modifies the status of an improvement from "not done" to "done".

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Fields**

| Field | Type | Description |
| ---- | ---- | ---- |
 improvementId & String & The id that uniquely identifies the improvement on the database \\


**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's municipality was not the one of the reports requested \\


----------------------------------------------------------------------------------------------------------------------------------------

**GET**  &nbsp;&nbsp;&nbsp;&nbsp; /statistics/visualize/?id={id}

This request gets the available statistics on a certain municipality and lets the ME visualize them.

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
 statistics & Object[] & The various statistics \\
\hspace{2.5mm}firstFieldName & String & The name of the first field of the graph \\
\hspace{2.5mm}secondFieldName & String & The name of the second field of the graph \\
\hspace{2.5mm}firstFieldValues & Number[] & The values of the first field \\
\hspace{2.5mm}secondFieldValues & Number[] & The value of the second field \\


**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
 UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
 NotEnoughReportError & The requested statistics could not be found on the database and the available information on the Municipality is not enough to compute accurate statistics \\ 

-----------------------------------------------------------------------------------------------------

**GET**  &nbsp;&nbsp;&nbsp;&nbsp; /statistics/download/?id={id}

This request gets the url of the pdf file where the visualized statistics are written.

**Parameters**

| Field | Type | Description |
| ---- | ---- | ---- |
 id & String & The id that uniquely identifies the municipality which the LO works for \\


**Success 200** (request OK)

| Field | Type | Description |
| ---- | ---- | ---- |
url & String & The url where the ME can download the pdf file \\

**Error 403** (forbidden)

| Field | Description |
| ---- | ---- |
UserNotAuthorized & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested \\

**Error 404** (resource not found)

| Field | Description |
| --- | --- |
NotEnoughReportError & The requested statistics could not be found on the database and the available information on the Municipality is not enough to compute accurate statistics \\



### TS interface and MAS interface

Since both the TS and the MAS are optional external services which are not completely specified it will be assumed that their communication interfaces will be provided trough RESTful api
given the fact that a stateless communication will ease the load on both our system and the Municipality's system. There will be assumptions only on the expected response for the GET requests and for the POST only the field of the message will be described.
Both the URIs, controls on accesses and security will be overlooked. 


#### Request of data about accidents from the MAS

This request will be structured as a GET and the expected success message will be structured as follows. 

| Field | Type | Description |
| ---- | ---- | ---- |
accidents & Object[] & The list of accidents that a Municipality can provide \\
\hspace{2.5mm}date & String & The datetime in <span style="color:lightgreen">dd-MM-yyyyThh:mm:ss</span> format \\
\hspace{2.5mm}position & Object & The position, expressed in DMS, where the accident happened \\
\hspace{5mm}latitude & String & The latitude where the accident was recorded to have happened \\
\hspace{5mm}longitude & String & The longitude where the vehicle was recorded to have happened \\
\hspace{2.5mm}vehicles & Object[] & The vehicles that were involved in the accident \\
\hspace{5mm}licensePlate & String & The license plate of the vehicle \\

#### Request of data about tickets from the TS

This request will be structured as a GET, the expected success message will be structured as follows.

| Field | Type | Description |
| ---- | ---- | ---- |
tickets & Object[] & The tickets issued in a certain Municipality \\
\hspace{2.5mm}vehicle & Object & The vehicle information \\
\hspace{5mm}licensePlate & String & The license plate of the vehicle \\
\hspace{2.5mm}position & Object & The position, expressed in DMS, of the vehicle when the ticket was issued  \\
\hspace{5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{5mm}longitude & String & The longitude where the vehicle was recorded to be \\
\hspace{2.5mm}violation & Object[] & An array of the type of violation \\
\hspace{5mm}violationType & String & The type of violation \\
\hspace{2.5mm}date & String & The datetime in <span style="color:lightgreen">dd-MM-yyyyThh:mm:ss</span> format \\

#### Forwarding of data about valid reports to the TS

The request will structured as a POST, the content of the sent message will be as follows.

| Field | Type | Description |
| ---- | ---- | ---- |
vehicle & Object & The vehicle information \\
\hspace{2.5mm}licensePlate & String & The license plate of the vehicle \\
position & Object & The position, expressed in DMS, of the vehicle when the ticket was issued  \\
\hspace{2.5mm}latitude & String & The latitude where the vehicle was recorded to be \\
\hspace{2.5mm}longitude & String & The longitude where the vehicle was recorded to be \\
violation & Object[] & An array of the type of violation \\
\hspace{2.5mm}violationType & String & The type of violation \\
date & String & The datetime in <span style="color:lightgreen">dd-MM-yyyyThh:mm:ss</span> format \\

### DBMS interface

The communication between the database and our system will be handled by a set of interfaces, implemented by the components, organized in two families characterized by the table that they manage. 
In the database there will be four different tables: the table of the reports, the table of the users, the table of the authorities and the table of the improvements which will be respectively handled
with the interfaces PostgreSQLReportHandler, PostgreSQLUsersHandler, PostgreSQLAuthorityHandler and PostgreSQLImprovementsHandler.

#### PostgreSQLReportHandler 
This interface will expose six methods that will all establish a connection with the server where the database is hosted. The parameters for the connection (URL of the server, user and password) will be available in a class called 
PostgreSQLUtilities. The methods will then try to send a query to the database, in case of success the connection will be closed and the method will return, otherwise the exception launched by the connection will be handled 
launching an exception on the upper level.

The methods are:

**createTable**

This method will create a new report table on the database, if one is already existing this function won't have any effect.

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\

--------------------------------------------------------------------------------------------

**insertNewReport**

This method will add a new report on the database.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
report & Report & The report that will have to be uploaded to the database \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\

-------------------------------------------------------------------------------------------

**retrieveReport**

This method will get a report from the database.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
reportId & String & The id of the report that will be retrieved from the database \\

**Return**

| Type | Description |
| --- | --- |
Report & The report taken from the database \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\ 

---------------------------------------------------------------------------------------------

**retrieveNotVerifiedReports**

This method will get all the reports which state is set as "NOTVERIFIED" and the id of the municipality where the report has been composed is equal to the one in the parameters.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
municipalityId & String & The id of the municipality in charge of the report \\

**Return**

| Type | Description |
| --- | --- |
List<Report> & The list of reports taken from the database which satisfy the query \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\

-------------------------------------------------------------------------------------------------
**updateReportStatus**

This method will update, changing the status of the report to the one in the parameters, the tuple where the reportId is the same as the one in the parameters.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
reportId & String & The id of report that will have its status changed \\
newReportStatus & ReportStatus & The new status that the report will have \\


**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\


-------------------------------------------------------------------------------------------------

**retrieveValidReports**

This method will get all the reports which state is set as "VALID" and where the id in the parameters is equal to the one of the municipality where the report has been composed .
There will be a different query for each type of RequestType and requestField will contain the requirements of the search. 

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
municipalityId & String & The id of the municipality in charge of the report \\
requestType & RequestType & The type of request, it may be "ALL", "TYPE", "AREA", "DATE" and "TIME" \\
requestField & String & The requirements of the research, i.e. requestType = TYPE && requestField = "parkingOnCrosswalk" \\

**Return**

| Type | Description |
| --- | --- |
List<Report> & The list of reports which satisfy the condition of the query \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\


#### PostgreSQLUsersHandler
This interface will expose three methods dedicated to the management of the users's data. These methods will try to establish the connection to the database with the same procedure as the methods of PostgreSQLReportHandler, the handling of the exceptions will also be the same.

The methods are:

**createUserTable**

This method will create a new table of the users on the database, if one is already existing this function won't have any effect.


**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\

----------------------------------------------------------------------------------------------
**addUserData**

This method will register on the database the data of a new user.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
username & String & The username of the new user \\
password & String & The password of the new user \\


**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\

----------------------------------------------------------------------------------------------
**retrieveUserData**

This method will be used during the login phase. The username, that i assured to be unique, will be used to search for the password of the user.


**Parameters**

| Name | Type | Description |
| --- | --- | --- |
username & String & The username of the user that is trying to login \\

**Return**

| Type | Description |
| --- | --- |
String & The password of the user \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\

#### PostgreSQLAuthorityHandler

This interface will expose (?????) two methods dedicated to the management of the authorities' data. These methods will try to establish the connection to the database with the same procedure as the methods of PostgreSQLReportHandler, the handling of the exceptions will also be the same.

The methods are:

**createAuthorityTable**

This method will create a new table of the authorities on the database, if one is already existing this function won't have any effect.

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the database \\

----------------------------------------------------------------------------------------------------------------------

**retrieveAuthorityData** 

This methods works in the same way as retrieveUsersData, sending a username and receiving the password and workRole of the associated authority. 

**Parameters**
 
 | Name | Type | Description |
 | --- | --- | --- |
 username & String & The username of the user that is trying to login \\
 
 **Return**
 
 | Type | Description |
 | --- | --- |
 String & The password of the authority \\
 String & The workRole of the authority \\
 
 **Exceptions**
 
 | Name | Description |
 | --- | --- |
DataBaseErrorException & An error has occurred in the  database \\



#### PostgreSQLImprovementHandler

This interface will expose four methods dedicated to the retrieval and insertion of improvements into the database. These methods will try to establish the connection to the database with the same procedure as the methods of PostgreSQLReportHandler, the handling of the exceptions will also be the same.

The methods are:

**createImprovementTable**   

This method will create a new table of the authorities on the database, if one is already existing this function won't have any effect.

**Exceptions**
 
 | Name | Description |
 | --- | --- |
 DataBaseErrorException & An error has occurred in the  database \\

------------------------------------------------------------------------------------------------------------------------------------------------

**addNewImprovement**

This method will add a new improvement to the database.

**Parameters**
 
| Name | Type | Description |
| --- | --- | --- |
improvement & Improvement & The new improvement that has been calculated and was not already on the database \\

 
 **Exceptions**
 
| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in the  database \\

--------------------------------------------------------------------------------------------------------------------------------------------------

**retrieveImprovements**

This methods retrieves the list of improvements that are suggested for a municipality which id is the same of the one in the parameters  and the state is set as "NOTDONE".

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
municipalityId & String & The id of the municipality in charge of the report \\

**Return**

| Type | Description |
| --- | --- |
List<Improvements> & The list of improvements that are suggested for a municipality \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\

------------------------------------------------------------------------------------------------------------------------------------------

**updateImprovementStatus**

This method will update to "DONE" the state of the improvement that has its id equal to the one in the parameter.

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
improvementId & String & The id of the improvement which completion state has been set to "DONE" \\

**Exceptions**

| Name | Description |
| --- | --- |
DataBaseErrorException & An error has occurred in database \\


### Map interface 

The map service that will be adopted is the one provided by Google, in particular the Geocoding api and the SDK maps api will be used. The interface will possess methods for both apis. 

**getGeocodedLocation**

This method converts the address given from the user, this happens in case the ME wants to mine reports inserting the address where to execute the search. 

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
address & String & The address inserted by the ME \\

**Return**

| Type | Description |
| --- | --- |
Position & The corresponding position to the address in the parameters \\


**getMunicipalityFromCoordinates**

**Parameters**

| Name | Type | Description |
| --- | --- | --- |
latitude & String & The latitude of the position which the belonging municipality is needed \\
longitude & String & The longitude of the position which the belonging municipality is needed \\

**Return**

| Type | Description |
| --- | --- |
String & The municipalityId of the municipality which the position belongs to \\



### OCRS interface

The OCRS is a bought component imported in our system. It exposes only one method, used for recognizing car plates from an image and an highlighted area on it, added by the user. 

####OCRS interface
   
**recognizePlate**

This method is used for recognizing a car's plate given its picture and an highlighted area on it. 
The highlighted area is defined by a rectangle, which is represented by its vertexes' coordinates. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
picture & Object & Representation of the image of the vehicle \\
highlightVertexes & Object & The coordinates on the picture of where the license plate is located \\
\hspace{2.5mm}vertexOne & Number[] & The coordinates of the first vertex \\
\hspace{2.5mm}vertexTwo & Number[] & The coordinates of the second vertex \\
\hspace{2.5mm}vertexThree & Number[] & The coordinates of the third vertex \\
\hspace{2.5mm}vertexFour & Number[] & The coordinates of the fourth vertex \\


**Return** 

| Type | Description |
| ---- | ---- |
String & The string containing the car's plate \\

**Exceptions** 

| Field |  Description |
| ---- |  ---- |
PlateNotRecognizedException & This exception is thrown when the plate is not recognizable from the given picture \\

---------------------------------------------------------------------------------------------------------------------------------------




### Web and Application server interfaces

The Web server has one interface, responsible for receiving REST requests and handle them by responding directly, if the request comes from a WebApplication and the response is cached, otherwise
by forwarding to the router through the RouterInterface.
The Application server has one external interface, the RouterInterface, and has more internal interface, for each one of its components, as described below.

#### WebServerInterface

**handleRequest**

This method is used for handling the REST requests coming from the clients. 
In particular, if the WebServer has the response, returns directly it, 
otherwise forward the request to the RouterInterface.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
xmlFile & XmlFile & The xml file containing the data of the request \\

**Return** 

| Type | Description |
| ---- | ---- |
XmlFile & The xml file containing the response of the request \\

**Exceptions** 

| Field |  Description |
| ---- |  ---- |
Exception & When an error occurs on Server's side, an xml file containing the description of the exception is returned \\

---------------------------------------------------------------------------------------------------------------------------------------

#### RouterInterface

**forwardRequest**

This method is used for handling the REST requests coming from the WebServer. 
In particular it forward the requests to the correct component.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
xmlFile & XmlFile & The xml file containing the data of the request  \\

**Return** 

| Type | Description |
| ---- | ---- |
XmlFile & The xml file containing the response of the request \\

**Exceptions** 

| Field |  Description |
| ---- |  ---- |
Exception & When an error occurs on Server's side, an xml file containing the description of the exception is returned \\

---------------------------------------------------------------------------------------------------------------------------------------

####ManageAccess

**signUpUser**

This method is used for registering a user in the system. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
username & String & The user's username \\
email & String & The user's email \\
password1 & String & The first password typed by the user \\
password2 & String & The second password typed by the user \\

**Return** 

| Type | Description |
| ---- | ---- |
Boolean & A boolean value which is true when the signUp goes well \\

**Exceptions** 

| Field |  Description |
| ---- |  ---- |
ExistingUsernameException & Someone with the same username is already registered \\
DifferentPasswordException & The second password is different from the first one \\
ExistingMailException & This email is already associated with another account \\

------------------------------------------------------------------------------------------------------------------------------------

**loginUser**

This method is used for logging a user in the system, by providing it a token used for further validation.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
loginInfo & String & The user's username or email \\
password & String & The user's password \\

**Return** 

| Type | Description |
| ---- | ---- |
Token & The token that identify the user in the system \\

**Exceptions** 

| Field |  Description |
| ---- |  ---- |
WrongUsernameOrPasswordException & The written username and password does not correspond to any existing user \\

------------------------------------------------------------------------------------------------------------------------------------

**loginAuthority**

This method is used for logging an authority in the system, by providing it a token used for further validation.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
loginInfo & String & The authority's username \\
password & String & The authority's password \\
workRole & WorkRole & The authority's work role ("ME" or "LO") \\

**Return** 

| Type | Description |
| ---- | ---- |
Token & The token that identify the authority in the system \\


**Exceptions** 

| Field |  Description |
| ---- |  ---- |
WrongUsernameOrPasswordException & The written username and password does not correspond to any existing user \\
NotCorrespondingRoleException & The selected work role does not correspond to the user which given login and password corresponds to \\

---------------------------------------------------------------------------------------------------------------------------------------

####ManageReport

**addReport**

This method is used for adding a new Report. In particular it tries to recognize the 
plate with the help of the OCRS and, if the plate is not recognized, the status of the report is set to "NOTVALID", otherwise is set to "NOTVERIFIED". Then saves the report in the database. 
The returned string is the identifier of the report, used for further requests made by the user. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
report & Report & The report received from the user \\
token & Token & The token that identifies the user in the system \\

**Return** 

| Type | Description |
| ---- | ---- |
String & The ID of the report added by the user \\

------------------------------------------------------------------------------------------------------------------------------------

**getNotVerifiedReports**

This method is used for fetching all the reports in the
database, issued in the municipality specified by the municipalityID, which have still to be verified.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\

**Return**

| Type | Description |
| ---- | ---- |
List<Report> & The list containing the reports still to be verified \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested \\

--------------------------------------------------------------------------------------------------------------------------------------

**setReportStatus**

This method is used in order to set the status of a report, given its ID, to "VALID" or "NOTVALID".

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\
reportID & String & The ID of the report of which the state is changed \\
newStatus & ReportStatus & The new status of the report ("VALID" or "NOTVALID") \\

**Return**

| Type | Description |
| ---- | ---- |
List<Report> & The list containing the reports still to be verified \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's municipality was not the one of the reports requested \\

---------------------------------------------------------------------------------------------------------------------------------------

#### ManageReportMining 

**getUserReport**

This method is used for fetching, from the database, the report with the given 
reportID, issued by the requesting user. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the user in the system \\
reportID & String & The ID of the report which has to be retrieved \\

**Return**

| Type | Description |
| ---- | ---- |
Report & The report the user has required \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the report and the token of the user have been analyzed. It was found that the user was not the one who submitted the report and as such the RU was not permitted to see the report  \\

---------------------------------------------------------------------------------------------------------------------------------------

**getUnsafeAreas**

This method is used for fetching from the database all the pseudoreports issued within 300 meters from the 
given position. A pseudoreport is like a report, but containing only info about violation's type, date and time of issuing. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
position & Position & The position indicated by the user from which find violations \\
token & Token & The token that identifies the user in the system \\

**Return** 
| Type | Description |
| ---- | ---- |
List<PseudoReport> & The list containing the violations occurred within 300 meters from the given position, with their date and time \\

------------------------------------------------------------------------------------------------------------------------------------

**getReports**

This method is used for retrieving all valid reports issued in the municipality specified by the municipalityID.  
Eventually some condition of mining can be applied. In particular is possible to mine a subset of the previous reports, by defining one of the
following property:
* AREA: only the reports within a given radius from a given position are fetched.
* VIOLATION: only the reports with the given violation are fetched
* DATE: only the reports issued in the specified date are fetched
* TIME: only the reports issued in the specified time are fetched

The necessary parameters are contained in the "requestField" field. 

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
requestType & RequestType & The type of mining, can be "ALL", "AREA", "VIOLATION", "DATE", "TIME" \\
requestField & String & The necessary parameters for the request \\
token & Token & The token that identifies the authority in the system \\

**Return** 

| Type | Description |
| ---- | ---- |
List<Report> & List of valid reports retrieved from the database \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's  municipality was not the one of the reports requested  \\

----------------------------------------------------------------------------------------------------------------------------------------

#### ManageImprovements 

**getNotDoneImprovements**

This method is used for retrieving all the improvements with the status set to "NOTDONE" from the database.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\


**Return** 

| Type | Description |
| ---- | ---- |
List<Improvement> & List of not done improvements \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an LO or the LO's  municipality was not the one of the reports requested  \\

----------------------------------------------------------------------------------------------------------------------------------------

**updateImprovements**

This method is used for updating the improvements saved in the database. 
In particular data coming from the MAS and the reports fetched via the ReportMiner are used.
Every new improvement found has the status set to "NOTDONE" by default and is saved in the database.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\

----------------------------------------------------------------------------------------------------------------------------------------

**setImprovementStatus**

This method is used for setting the status of an improvement, given its ID, from 
"NOTDONE" to "DONE".

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\
improvementID & String & The ID of the improvement which status has to be changed to done \\

**Return** 

| Type | Description |
| ---- | ---- |
Boolean & A boolean which is true if the operation of changing status goes correctly \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's municipality was not the one of the reports requested \\

----------------------------------------------------------------------------------------------------------------------------------------

#### ManageStatisticsComputation

**getStatistics**

This method is used for calculating the current statistics, based on the data coming the TS and the reports fetched via the ReportMiner.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
token & Token & The token that identifies the authority in the system \\
municipalityID & String & The municipality of the requesting local officer \\

**Return** 

| Type | Description |
| ---- | ---- |
 Statistic & A statistic object containing the new statistics created \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  \\

----------------------------------------------------------------------------------------------------------------------------------------

#### ManageStatisticsDownload

**getStatisticsFile**

This method is used for getting a file (for example .pdf) containing the current statistics, based on the data coming the TS and the reports fetched via the ReportMiner.

**Parameters**

| Name | Type | Description |
| ---- | ---- | ---- |
| token | Token | The token that identifies the authority in the system |
 municipalityID & String & The municipality of the requesting local officer \\

**Return** 

| Type | Description |
| ---- | ---- |
Object & An object containing the new file containing the statistics created \\

**Exceptions**

| Field | Description |
| ---- | ---- |
UserNotAuthorizedException & The id of the municipality and the token of the user have been analyzed. It was found that the user was not an ME or the ME's  municipality was not the one of the reports requested  \\







## Selected architectural styles and patterns

To build the system a number of different architectural style choices have been made. Between all possible alternatives the following are the one that was decided to use:

* **Client-Server** : The client server style will be the one chosen in the system for the interaction between the user and the server components. This architectural style supports the request-response pattern, that is the one that mostly fits the way actors interact with the system: they make requests invoking some services provided by the server, and the server provides a response according to the received request.  

* **Four tier architecture**: The architecture of the whole system has been organized in four tiers such as Presentation, Application 1, Application 2 and Data access. In the first tier, the presentation one, there will be both the user's app and the authority's web app. The presentation tier won't be responsible for almost any computations (only the logic behind the request and the display of the UI will be handled) forwarding all data request onto the two following tiers.
The first application tier, Application 1, will be responsible of receiving the request from all users (RU, ME and LO) and will eventually forward the requests to the Application 2 layer which will be the one really in charge of computation. The Application 1 tier will also protect the following layer from malicious attacks limiting the requests that
really reach Application 2, in fact Application 1 will also work as a proxy, directly answering the clients request if it already possess all necessary data in its cache. The Data access tier will be the one responsible to hold all information, its role it's a vital one since it will allow to reach a stateless architecture.  

* **RESTful APIs**: Both the communication form and to both users, authorities and municipal services will be numerous and will need immediate response. For that purpose REST was adopted to work as the mean to communicate between parties. 
The RESTful APIs will be implemented over the HTTPS protocol, both because its use is standard in these cases, for its ease of understanding and maintenance, and because it will grant added security onto the data transfer.
The content of the messages will be formatted using XML, this format was preferred because of its ease of use when transmitting images. The choice of REST over SOAP was done to fully utilize the database to create a stateless architecture, its advantages can be seen in the reduction of workload on 
the server will permit to handle multiple simultaneous communication sessions with both users and services with a little number of threads. This way the cost of the server will remain contained while ensuring good performances.

## Other design decisions

### Framework selection
Java Enterprise Edition was selected for the implementation of the server components, because it can be used to build reliable and scalable application, modeling the components as Enterprise Java Beans, and using Java Server Pages
for building dynamical user interfaces. Moreover, Java Persistence APIs can be used for the interaction with the DBMS. (alberto non sapevo che scrivere)


### DBMS selection

PostgreSQL

### Security
Some security measures have been taken to guarantee legitimacy of data and requests:
* Passwords, personal email addresses and username sent to and from the server won't be in plain text. Such information will be hashed and salted with strong cryptographic functions.
* The mechanism of the token used during communication between client and server will guarantee secrecy over the identity of the user who's making a request, it won't be possible to extract any information from it. (BHO NON LO SO) 

### Service providers
For the MS, Google Maps has been chosen. This was decided thanks to its reliability and ease of use ( XD non è vero ) .


