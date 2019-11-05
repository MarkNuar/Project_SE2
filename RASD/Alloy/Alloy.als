sig Position {
	latitude: one String,
	longitude: one String,
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
	licensePlate: one String,
	model: String,
	color: String
}


abstract sig RegisteredEntity {
	username: one String,
	password: one String,
	type: one UserType
}

abstract sig UserType{}
one sig USER, LO, ME extends UserType {}

abstract sig Authority extends RegisteredEntity {
	municipality: one Municipality
}
{ type in LO || type in ME	 }

sig User extends RegisteredEntity {
	pastReports: set Report
}
{	type in USER	}

sig LocalOfficer extends Authority {}
{	type in LO	}

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

fact CenterInMunicipality
{
	all m: Municipality	| m.center.municipality = m
}

fact SamePositionSameMunicipality {
	no disj p1, p2: Position | 
		p1.latitude = p2.latitude && 
		p1.longitude = p2.longitude &&
		p1.municipality != p1.municipality
}

