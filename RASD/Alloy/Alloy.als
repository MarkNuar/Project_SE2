sig Position {
	latitude: one Int,
	longitude: one Int,
	municipality: one Municipality
}

sig Municipality	{
	name: one String,
	center: one Position
}

sig Picture {}

abstract sig ViolationType {}

sig Violation {
	violations: some ViolationType
}

sig Date {}

sig Time {}

sig Vehicle {
	licensePlate: one String
}

abstract sig RegisteredEntity {
	username: one String
}


abstract sig Authority extends RegisteredEntity {
	municipality: one Municipality
}

sig User extends RegisteredEntity {}

sig LocalOfficer extends Authority {}

sig MunicipalEmployee extends Authority {}


abstract sig ReportStatus {}
one sig Valid, NotValid, NotVerified extends ReportStatus {}

sig Report {
	vehicle: one Vehicle,
	segnalatingUser: one User,
	position: one Position,
	picture: one Picture,
	violation: one Violation,
	date: one Date,
	time: one Time,
	status: one ReportStatus
}

abstract sig ImprovementState {}
one sig NotDone, Done extends ImprovementState {}

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
----------------------------------------------------------------
fact UniqueUsername {
	no disj u1,u2: RegisteredEntity | u1.username = u2.username
}

fact UniqueVehiclePlate {
	no disj v1,v2: Vehicle |	v1.licensePlate = v2.licensePlate
} 

fact UniqueMunicipalityName {
	no disj m1, m2: Municipality | m1.name = m2.name
}

fact SamePositionSameMunicipality {
	no disj p1, p2: Position | 
		p1.latitude = p2.latitude && 
		p1.longitude = p2.longitude &&
		p1.municipality != p1.municipality
}

fact CenterInMunicipality
{
	all m: Municipality	| m.center.municipality = m
}

fact PictureBelongsToOnlyOneReport
{
	no disj r1, r2: Report | r1.picture = r2.picture
}

fact NoVehicleUbiquityInReport
{
	no disj r1, r2: Report	|
		r1.date = r2.date &&
		r1.time = r2.time &&
		r1.vehicle = r2.vehicle &&
		r1.position != r2.position
}

fact NoUserUbiquity
{
	no disj r1, r2: Report |
		r1.date = r2.date &&
		r1.time = r2.time &&
		r1.segnalatingUser = r2.segnalatingUser &&
		r1.position != r2.position
}

fact OneReportPerTimeForUser
{
	no disj r1, r2: Report |
		r1.segnalatingUser = r2.segnalatingUser &&
		r1.date = r2.date &&
		r1.time = r2.time
}

fact NoUbiquityReportAccident
{	
	no r: Report, a: Accident |
		r.vehicle in a.vehicles &&
		r.date = a.date &&
		r.time = a.time &&
		r.position != a.position
}

fact NoVehicleUbiquityInAccident
{
	no disj a1, a2: Accident	|
		a1.date = a2.date &&
		a1.time = a2.time &&
		a1.position != a2.position &&
		a1.vehicles & a2.vehicles != none
}

fact NoDuplicatedAccident
{
	no disj a1, a2: Accident	|
		a1.date = a2.date &&
		a1.time = a2.time &&
		a1.position = a2.position &&
		(a1.vehicles = a2.vehicles || a1.vehicles & a2.vehicles != none)
}

fact NoDuplicatedImprovement
{
	no disj i1, i2: Improvement |
		i1.position = i2.position &&
		i1.type = i2.type
}

fact NoImprovementWithoutProblem
{
	no i: Improvement |
	((no a: Accident | i.position = a.position) &&
		(no r: Report | r.position = i.position && r.status = Valid))
}	

fact NoProblematicPositionWithoutImprovement
{
	no p: Position | 
		(((some a: Accident | a.position = p) ||
		(some r: Report | r.position = p && r.status = Valid)) && 
		no i: Improvement | i.position = p)
}

-----------------------------------------------------

assert NoOverlapMunicipality
{
	no disj m1, m2: Municipality | m1.center = m2.center
}

check NoOverlapMunicipality

pred show{
}
run show for 3 but exactly 6 String, exactly 7 Position

