-------------- SIGNATURE ------------------

sig Position {
	latitude: one Int,
	longitude: one Int,
	municipality: one Municipality
}

sig Municipality	{
	name: one String,
	center: one Position,
	reports: set Report,
	accidents: set Accident,
	tickets: set Ticket
}

sig Picture {}

-- It represents the violation type that can be associated to a report
abstract sig ViolationType {}

-- It represents the set of violation associated to a report 
-- In each report there must be at least one type of violation
sig Violation {
	violations: some ViolationType
}

sig Date {}

sig Time {}

sig Vehicle {
	licensePlate: one String
}

abstract sig RegisteredEntity {
	username: one String,
	password: one String
}

abstract sig Authority extends RegisteredEntity {
	municipality: one Municipality
}

sig User extends RegisteredEntity 
{
	email: one String, 
	reports: set Report
}

sig LocalOfficer extends Authority {}

sig MunicipalEmployee extends Authority {}


abstract sig ReportStatus {}
one sig Valid extends ReportStatus {}
one sig NotValid extends ReportStatus {}
one sig NotVerified extends ReportStatus {}

sig Report {
	vehicle: lone Vehicle,
	segnalatingUser: one User,
	position: one Position,
	picture: one Picture,
	violation: one Violation,
	date: one Date,
	time: one Time,
	status: one ReportStatus
}

abstract sig ImprovementState {}
one sig NotDone extends ImprovementState {}
one sig Done extends ImprovementState {}

abstract sig ImprovementType	{}

sig Improvement {
	type: one ImprovementType,
	position: one Position,
	state: one ImprovementState
}

sig Accident {
	position: one Position,
	date: one Date,
	time: one Time,
	vehicles: some Vehicle
}

abstract sig Gender {}
one sig Male extends Gender {}
one sig Female extends Gender {}

sig Ticket
{
	vehicle: one Vehicle,
	violation: one Violation,
	position: one Position,
	date: one Date,
	time: one Time,
	offenderGender: one Gender,
	offenderAge: one Int,
	report: lone Report
}
{	
	-- Offender must be adult (age >= 18), but here used scaled value for simplicity
	offenderAge >= 3
	-- if a ticket is related to a report, this must be valid
	report.status = Valid	
}

-------------------- FACT -----------------------------

-- Each username is unique
fact UniqueUsername 
{
	no disj u1,u2: RegisteredEntity | u1.username = u2.username
}

-- Each vehicle is unique and is associated to a unique license plate
fact UniqueVehiclePlate
{
	no disj v1,v2: Vehicle |	v1.licensePlate = v2.licensePlate
} 

-- Each municipality name is unique
fact UniqueMunicipalityName 
{
	no disj m1, m2: Municipality | m1.name = m2.name
}

-- Email used for registration must not be associated to multiple users
fact UniqueEmail
{
	no disj u1, u2: User | u1.email = u2.email
}

-- There must not be positions with same coordinates belonging to different municipalities
fact SamePositionSameMunicipality 
{
	no disj p1, p2: Position | 
		p1.latitude = p2.latitude && 
		p1.longitude = p2.longitude &&
		p1.municipality != p1.municipality
}

-- The position associated to a municipality center must belong to such municipality
fact CenterInMunicipality
{
	all m: Municipality	| m.center.municipality = m
}

-- Each picture must belong exactly to one report
fact AllPictureBelongToOneReport
{
	all p: Picture | one r: Report | r.picture = p
}

-- A vehicle can not be reported simultaneously in different reports with different positions,
-- but it can be reported in the same position, for example from different users
fact NoVehicleUbiquityInReport
{
	no disj r1, r2: Report	|
		r1.date = r2.date &&
		r1.time = r2.time &&
		r1.vehicle = r2.vehicle &&
		r1.position != r2.position
}

-- A user can not make different reports simultaneously
fact OneReportPerTimeForUser
{
	no disj r1, r2: Report |
		r1.segnalatingUser = r2.segnalatingUser &&
		r1.date = r2.date &&
		r1.time = r2.time
}

-- A vehicle can not be involved in an accident and simultaneously be reported in a different position
fact NoVehicleUbiquityBetweenReportAccident
{	
	no r: Report, a: Accident |
		r.vehicle in a.vehicles &&
		r.date = a.date &&
		r.time = a.time &&
		r.position != a.position
}

-- A vehicle can be involved in at most one accident per time
fact NoVehicleUbiquityInAccident
{
	no disj a1, a2: Accident	|
		a1.date = a2.date &&
		a1.time = a2.time &&
		a1.position != a2.position &&
		a1.vehicles & a2.vehicles != none
}

-- There must not be multiple accidents involving the same vehicles (or a part of them) 
-- in the same position and at the same time and date
fact UniqueAccident
{
	no disj a1, a2: Accident	|
		a1.date = a2.date &&
		a1.time = a2.time &&
	--	a1.position = a2.position &&
		(a1.vehicles = a2.vehicles || a1.vehicles & a2.vehicles != none)
}

-- There must not be duplicated suggestion for improvements on same position
fact UniqueImprovementForEachPosition
{
	no disj i1, i2: Improvement |
		i1.position = i2.position &&
		i1.type = i2.type
}

-- A suggested improvement for a position must be generated only if there occurred an accident or a valid report
fact NoImprovementWithoutProblem
{
	no i: Improvement |
	((no a: Accident | i.position = a.position) &&
		(no r: Report | r.position = i.position && r.status = Valid))
}	

-- If on one position there occurred at least a minimum number of accidents or valid reports, 
-- there must be a suggested improvement for that position
-- For simplicity, the minimum number of "problems" occurred on a position in order to have a suggested improvement is set to one
fact NoProblematicPositionWithoutImprovement
{
	no p: Position | 
		(((some a: Accident | a.position = p) ||
		(some r: Report | r.position = p && r.status = Valid)) && 
		no i: Improvement | i.position = p)
}

-- If the OCRs did not recognize a valid license plate, the report is not valid but is still stored
-- Some "Not Valid" reports can be associated to a vehicle: it might happen that a local officer 
-- marked them as "Not Valid" but the vehicle's license plate had been recognized by the OCRs
fact NotValidReportsStored
{
	all r: Report |
		 r.vehicle = none implies r.status = NotValid 
}

--If the OCRs recognized a valid license plate, the related vehicle must be associated to the report
fact ValidReportsRelatedToAVehicle
{
	all r: Report |
		r.status != NotValid implies r.vehicle != none
}

-- All strings must be associated to a username, to a municipality name or to a license plate
fact NoRandomString
{
	all s: String |
	((one e: RegisteredEntity | e.username = s) ||
	 (one m: Municipality | m.name = s) ||
	 (one v: Vehicle | v.licensePlate = s))
}

-- If a ticket is related to a valid report, they must be consistent
fact TicketReportConsistency
{
	all t: Ticket |
	(t.report != none implies 
		(t.position = t.report.position &&
			t.vehicle = t.report.vehicle &&
			t.date = t.report.date &&
			t.time = t.report.time &&
			t.violation.violations & t.report.violation.violations != none))
}

-- There must be a unique issued ticket for a vehicle on a specific date and time
fact UniqueTicket
{
	no disj t1, t2: Ticket |
		t1.vehicle = t2.vehicle &&
		t1.date = t2.date &&
		t1.time = t2.time
}

-- A vehicle can not be issued in a ticket and simultaneously be reported in a different position
fact NoVehicleUbiquityBetweenReportTicket
{	
	no r: Report, t: Ticket |
		r.vehicle in t.vehicle &&
		r.date = t.date &&
		r.time = t.time &&
		r.position != t.position
}

-- A vehicle can not be involved in an accident and simultaneously be issued in a different position
fact NoVehicleUbiquityBetweenTicketAccident
{	
	no t: Ticket, a: Accident |
		t.vehicle in a.vehicles &&
		t.date = a.date &&
		t.time = a.time &&
		t.position != a.position
}

-- Each municipality must have only reports occurred in a position belonging to that municipality
fact MunicipalityOwnsOnlyItsReports
{
	all m: Municipality |
	(m.reports != none implies
		(all r: m.reports | r.position.municipality = m))
}

-- All reports must be associated to a municipality
fact AllReportsRelatedToMunicipality
{
	all r: Report |
		(one m: Municipality | r in m.reports)
}

-- Each user must have only his/her reports
fact UserOwnsOnlyItsReports
{
	all u: User |
	(u.reports != none implies
		(all r: u.reports | r.segnalatingUser = u))
}

-- All reports must be associated to a the segnalating user
fact AllReportsRelatedToUser
{
	all r: Report |
		(one u: User | r in u.reports)
}
	
-- Each municipality must have only accidents occurred in a position belonging to that municipality
fact MunicipalityOwnsOnlyItsAccidents
{
	all m: Municipality |
	(m.accidents != none implies
		(all a: m.accidents | a.position.municipality = m))
}

-- All accidents must be associated to a municipality
fact AllAccidentsRelatedToMunicipality
{
	all a: Accident |
		(one m: Municipality | a in m.accidents)
}

-- Each municipality must have only accidents occurred in a position belonging to that municipality
fact MunicipalityOwnsOnlyItsTickets
{
	all m: Municipality |
	(m.tickets != none implies
		(all t: m.tickets | t.position.municipality = m))
}

-- All tickets must be associated to a municipality
fact AllAccidentsRelatedToMunicipality
{
	all t: Ticket |
		(one m: Municipality | t in m.tickets)
}	
----------------------- ASSERTION ------------------------------

-- There are no municipalities with centers in the same position
assert NoOverlapMunicipalityCenter
{
	no disj m1, m2: Municipality | m1.center = m2.center
}

check NoOverlapMunicipalityCenter

---------------------- PREDICATE --------------------------------

pred addReport [m, m': Municipality, u, u': User, r: Report]
{
	//precondition
	r.segnalatingUser = u
	r.position.municipality = m
	//postcondition
	u'.reports = u.reports + r
	m'.reports = m.reports + r
}

-- Generic world
pred GenericWorld
{}



-- World to highlight municipality
pred MunicipalWorld
{
	#Municipality = 3
}



-- World to highlight reports 
pred UserWorld
{
	#User = 4
	#Report = 5
	#Position = 3
	one r: Report | r.status = Valid
	one r: Report | r.status = NotValid 
}


run GenericWorld for 3 but exactly 3 String
run MunicipalWorld for 5 but exactly 9 String, 3 Municipality
run UserWorld for 6 but exactly 10 String, 0 Accident
run addReport for 3 but exactly 5 String


