/********************************************************/
/* 				MSIS 618 Final Project                  */
/*           Citizen for Animal Protection (CAP)        */
/*				Archana Shinde							*/
/********************************************************/

/*
Scenario 1: A normal user would like to see list of Animals who are not yet adopted and their contact details 
*/
select 
ad.Type as Animal, 
ad.Breed, 
ad.Howold as Age, 
ad.Gender, 
ad.Spayed, 
ad.Personality,
au.FirstName as Contact_FirstName,
au.lastName as Contact_LastName,
au.phone,
au.email
from animal_details ad left outer join admin_user au
on ad.AdminID= au.AdminID
where  ad.UserID is null and ad.ShelterID is null;
#----------------------------------------

/*
Scenario 2: Admin User wants to see list of approved and rejected requests
 and the reason behind their approval.
*/
select 
r.requestorname As Requestor_Name,
r.requestdesc as Description,
r.animaldesc as Animal_details, 
h.requestdate as Request_date,
h.status as Request_status, 
h.comments
 from history h left outer join request r
on h.requestid= r.requestid
where h.status in ('Approved','Rejected');
#----------------------------------------
/*
Scenario 3: Admin User wants to see the facility details for cheapest food option.. 
*/
select 
Facilitydesc As Facility,
facilityprovider as ProviderORDonar,
address as Location,
min(expenses)  as CostinINR
from OTHER_FACILITIES
where facilitydesc like 'Food%';
#----------------------------------------

/*
Scenario 4: To display list of animals who got vaccinated in last one year.
*/
select 
mr.TreatmentDesc AS Treatment,
mr.TreatmentDate as Vaccination_Date, 
mr.TreatmentPrice as Vactination_CostinINR,
ad.Type as Animal,
ad.Breed,
ad.Gender, 
ad.howold as Age, 
vd.VetName, 
vd.VetClinic as Clinic_location,
vd.Vetfees as Vet_feesinINR
from 
medical_record mr left outer join animal_details ad
on mr.AnimalID=ad.AnimalID
left outer join vet_details vd
on mr.Vetlicense=vd.Vetlicense
where mr.TreatmentDesc='Vaccination'
and mr.TreatmentDate > '2018/12/18';
#----------------------------------------

/*
Scenario 5: To display list of requests created by normal user and shelters only. Also list requestors contact details.
*/
select
r.CreatedBy as Creator,
r.requestorname as Requestor_name,
r.requestdesc as Request_desc,
r.requeststatus as Request_status,
Case when CreatedBy = 'User' then u.Phone else s.shelterphone
end Requestor_phone,
Case when CreatedBy = 'User' then u.email else s.shelteremail
end Requestor_email
from user u right outer join  request r
on u.UserID= r.UserID
left outer join shelter_details s
on r.shelterid= s.ShelterID
where 
r.createdby in ('user','shelter');
#----------------------------------------

/*
Scenario 6:Admin user wants to see list of all animals who are not adopted and who are not in shelter 
and details of people taking care of these animals in their community. 
Also list all the expenses occurred for these animals
*/
select 
au.FirstName as Caretaker_firstname,
au.LastName as Caretaker_secondname,
ad.Type as Animal,
ad.breed, 
ad.HowOld as Age,
ad.Gender, 
mr.TreatmentDesc,
mr.TreatmentDate,
mr.TreatmentPrice as Treatment_CostinINR,
ofa.FacilityDesc as FacilityName,
ofa.FacilityProvider As ProvideOrDonor,
ofa.Expenses as Facility_CostinINR
from animal_details ad left outer join admin_user au
on ad.AdminID=au.AdminID
left outer join medical_record mr
on mr.AnimalID= ad.AnimalID
left outer join other_facilities ofa
on ofa.animalid= ad.animalid
where ad.UserID is null and ad.ShelterID is null;
#----------------------------------------