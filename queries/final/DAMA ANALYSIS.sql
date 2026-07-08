---Creating my Tables( admission_details, doctors, patient details, risk factor)!

--patient_details table
CREATE TABLE patient_details(
			 pt_id INT CONSTRAINT pk_pt_id primary key,
			 name varchar(50),
			 age INT,
			 sex char(1),
			 occupation varchar(50),
			 level_of_education varchar(20),
			 marital_status varchar(20)
);

---Creating risk factor table
CREATE TABLE risk_factors(
			 pt_id INT CONSTRAINT fk_pt_id REFERENCES patient_details(pt_id),
			 alcohol_hx varchar(10),
			 tobacco_hx varchar(10),
			 nsaid_use varchar(10)
);

---Creating Doctors Table

CREATE TABLE doctors(
			 doctors_id VARCHAR(10) CONSTRAINT pk_doc_id PRIMARY KEY,
			 doctor varchar(50),
			 gender char(1),
			 email varchar(50),
			 specialization varchar(50)
);

-------------Creating admission details
CREATE TABLE admission_details(
			 pt_id INT CONSTRAINT fk_pt_id REFERENCES patient_details(pt_id),
			 admission_id INT CONSTRAINT pk_admission_id PRIMARY KEY,
			 admission_duration INT,
			 doctor_id VARCHAR(10) CONSTRAINT fk_doc_id REFERENCES doctors(doctors_id),
			 dama varchar(5),
			 reason_for_dama varchar(50),
			 dead varchar (5),
			 cause_of_death varchar(50),
			 ckd varchar(5),
			 cause_ckd varchar(50),
			 dialysis varchar(5),
			 no_of_sessions INT,
			 stroke varchar (5),
			 dm varchar (5),
			 cancer varchar (5),
			 type_of_cancer varchar(50),
			 pud varchar(5)
);



------ ANSWERING THE OBJECTIVE QUESTIONS

--Objective 1 (Analyze patient demographics in relation to hospital outcomes.)

--Grouping demography of patient by age, level of education, and Occupation then

-- Giving it a CTE to enable proper analysis of each demography by outcome,

WITH patient_demography AS(
SELECT name,
CASE 
			WHEN p.age BETWEEN 15 and 19 then 'adolescent'
			WHEN p.age between 20 and 24 then 'Youth'
			when p.age between 25 and 44 then 'Adult'
			when p.age between 45 and 64 then 'Middle Aged'
			when p.age between 65 and 79 then 'Senior'
			when p.age between 79 and 94 then 'Elders'
			END AS age_category,
CASE 
		 WHEN p.level_of_education IN ('FSLC','SSCE') THEN 'BASIC'
		when p.level_of_education IN ('NCE','Undergraduate') THEN 'Intermediate'
		WHEN p.level_of_education IN ('BA','BSc','MSC','BEd','HND') THEN 'Advanced'
		ELSE 'Unknown'
		END AS education_category,
CASE 
  ----	Daily Income earners
  		when p.occupation like '%Trad%'
		or p.occupation like '%Driver%'
		or p.occupation like '%Farm%'
		or p.occupation like '%Fish%'
		or p.occupation like '%Artisan%'
		or p.occupation like '%Tailor%'
		or p.occupation like '%Seamstress%'
		or p.occupation like '%Mechanic%'
		or p.occupation like '%Carpenter%'
		or p.occupation like '%Plumb%'
		or p.occupation like '%Welding%'
		or p.occupation like '%Stylist%'
		or p.occupation like '%Barber%'
		or p.occupation like '%Caterer%'
		or p.occupation like '%Contractor%'
		or p.occupation like '%Vendor%'
		or p.occupation like '%Beater%'
		or p.occupation like '%Brick Layer%' then 'Basic'

---Vulnerable (no personal income)
		WHEN p.occupation like '%Unemployed%'
		or p.occupation like '%Retiree%'
		or p.occupation like '%Dependant%'
		or p.occupation like '%Student%'
		or p.occupation like '%Housewife%' then 'Fixed Dependent'

---Leadership/Community
WHEN p.occupation like '%Clergy%' 
or p.occupation like  '%Pastor%'
or p.occupation like  '%Village Head%' then 'Community Leader'

when p.occupation like '%Scientist%'
or p.occupation like '%Engineer%'
or p.occupation like '%Banker%'
or p.occupation like '%Lawyer%'
or p.occupation like '%Accountant%'
or p.occupation like '%Teach%'
or p.occupation like '%Nurse%'
or p.occupation like '%Practitioner%'
or p.occupation like '%Civil Servant%'
or p.occupation like '%Public Servant%'
or p.occupation like '%Journalist%'
or p.occupation like '%Lecturer%' then 'Professional'

ELSE 'Uncategorized'
END AS occupation_group,
a.dead,
a.dama
FROM patient_details as p
JOIN admission_details as a on p.pt_id=a.pt_id)

---joining with cte
SELECT age_category,
	   education_category,
	   occupation_group,
COUNT (*) as total_admission,
	SUM(CASE WHEN dead = 'Yes' then 1 else 0 END ) as death_count,
	ROUND (SUM(CASE WHEN dead = 'Yes' then 1 else 0 END )*100.0/COUNT (*),2) AS mortality_rate,
SUM(CASE WHEN dama ='Yes'then 1 else 0 END) as dama_count,
ROUND (SUM(CASE WHEN dama ='Yes'then 1 else 0 END)*100.0/COUNT (*),2) as dama_rate
FROM patient_demography
GROUP BY age_category,education_category,occupation_group
ORDER BY 
total_admission DESC,
dama_rate desc

------------------------------------------------------OBJECTIVE 2
---Identify common reasons for discharge against medical advice (DAMA) 
SELECT reason_for_dama,
COUNT(*) as total_dama_case
FROM admission_details
WHERE dama = 'Yes'
GROUP BY reason_for_dama
ORDER BY total_dama_case DESC

------- Objective 3
---Examine the prevalence and impact of chronic illnesses among patients.

--after calculating the prevalence and impact to identify them (Stroke and CKD,Most prevalent),
--(DM and CKD, most impactful(Death).
-- i then created a demographic CTE table so as to be able to link the impact to demography to know the affected ones

WITH patient_demography AS(
SELECT name,
a.ckd,
a.dm,
a.stroke,
a.cancer,
a.pud,
CASE 
			WHEN p.age BETWEEN 15 and 19 then 'adolescent'
			WHEN p.age between 20 and 24 then 'Youth'
			when p.age between 25 and 44 then 'Adult'
			when p.age between 45 and 64 then 'Middle Aged'
			when p.age between 65 and 79 then 'Senior'
			when p.age between 80 and 94 then 'Elders'
			END AS age_category,
CASE 
		 WHEN p.level_of_education IN ('FSLC','SSCE') THEN 'BASIC'
		when p.level_of_education IN ('NCE','Undergraduate') THEN 'Intermediate'
		WHEN p.level_of_education IN ('BA','BSc','MSC','BEd','HND') THEN 'Advanced'
		ELSE 'Unknown'
		END AS education_category,
CASE 
  ----	Daily Income earners
  		when p.occupation like '%Trad%'
		or p.occupation like '%Driver%'
		or p.occupation like '%Farm%'
		or p.occupation like '%Fish%'
		or p.occupation like '%Artisan%'
		or p.occupation like '%Tailor%'
		or p.occupation like '%Seamstress%'
		or p.occupation like '%Mechanic%'
		or p.occupation like '%Carpenter%'
		or p.occupation like '%Plumb%'
		or p.occupation like '%Welding%'
		or p.occupation like '%Stylist%'
		or p.occupation like '%Barber%'
		or p.occupation like '%Caterer%'
		or p.occupation like '%Contractor%'
		or p.occupation like '%Vendor%'
		or p.occupation like '%Beater%'
		or p.occupation like '%Brick Layer%' then 'Basic'

---Vulnerable (no personal income)
		WHEN p.occupation like '%Unemployed%'
		or p.occupation like '%Retiree%'
		or p.occupation like '%Dependant%'
		or p.occupation like '%Student%'
		or p.occupation like '%Housewife%' then 'Fixed Dependent'

---Leadership/Community
WHEN p.occupation like '%Clergy%' 
or p.occupation like  '%Pastor%'
or p.occupation like  '%Village Head%' then 'Community Leader'

when p.occupation like '%Scientist%'
or p.occupation like '%Engineer%'
or p.occupation like '%Banker%'
or p.occupation like '%Lawyer%'
or p.occupation like '%Accountant%'
or p.occupation like '%Teach%'
or p.occupation like '%Nurse%'
or p.occupation like '%Practitioner%'
or p.occupation like '%Civil Servant%'
or p.occupation like '%Public Servant%'
or p.occupation like '%Journalist%'
or p.occupation like '%Lecturer%' then 'Professional'

ELSE 'Uncategorized'
END AS occupation_group,
a.dead
FROM patient_details as p
JOIN admission_details as a on p.pt_id=a.pt_id)
---------------------------- the prevalence and impact calculations
SELECT 
		age_category,
	   education_category,
	   occupation_group,
COUNT (*) as total_admission,
SUM(CASE WHEN ckd = 'Yes'then 1 ELSE 0 END) as no_of_ckd_cases,
ROUND(SUM(CASE WHEN ckd = 'Yes'then 1 ELSE 0 END)*100.0/COUNT (*),2) AS ckd_prevalence,
-----for dm
SUM(CASE WHEN dm = 'Yes'then 1 ELSE 0 END) as no_of_dm_cases,
ROUND(SUM(CASE WHEN dm = 'Yes'then 1 ELSE 0 END)*100.0/COUNT (*),2) AS dm_prevalence,
---for stroke
SUM(CASE WHEN stroke = 'Yes'then 1 ELSE 0 END) as no_of_stroke_cases,
ROUND(SUM(CASE WHEN stroke = 'Yes'then 1 ELSE 0 END)*100.0/COUNT (*),2) AS stroke_prevalence,
------ for cancer
SUM(CASE WHEN cancer = 'Yes'then 1 ELSE 0 END) as no_of_cancer_cases,
ROUND(SUM(CASE WHEN cancer = 'Yes'then 1 ELSE 0 END)*100.0/COUNT (*),2) AS cancer_prevalence,
----for pud
SUM(CASE WHEN pud = 'Yes'then 1 ELSE 0 END) as no_of_pud_cases,
ROUND(SUM(CASE WHEN pud = 'Yes'then 1 ELSE 0 END)*100.0/COUNT (*),2) AS pud_prevalence,

------------------------------IMPACT
SUM(CASE WHEN ckd ='Yes' then 1 else 0 END) as no_of_ckd_case,
SUM(CASE WHEN ckd = 'Yes' and dead= 'Yes' then 1 ELSE 0 END) as no_of_ckd_death,
ROUND 
(SUM(CASE WHEN ckd = 'Yes' and dead= 'Yes' then 1 ELSE 0 END)*100.0/
NULLIF(SUM(CASE WHEN ckd = 'Yes' then 1 ELSE 0 END),0) ,2) AS ckd_mortality_rate,

-----for dm
SUM(CASE WHEN dm ='Yes' then 1 else 0 END) as no_of_dm_case,
SUM(CASE WHEN dm = 'Yes' and dead ='Yes' then 1 ELSE 0 END) as no_of_dm_death,
ROUND
(SUM(CASE WHEN dm = 'Yes' and dead= 'Yes' then 1 ELSE 0 END)*100.0/
NULLIf(SUM(CASE WHEN dm = 'Yes' then 1 ELSE 0 END),0),2) AS dm_mortality_rate,

--- for stroke
SUM(CASE WHEN stroke ='Yes' then 1 else 0 END) as no_of_stroke_case,
SUM(CASE WHEN stroke ='Yes' and dead = 'Yes' then 1 ELSE 0 END) as no_of_stroke_death,
ROUND
(SUM(CASE WHEN stroke = 'Yes' and dead= 'Yes' then 1 ELSE 0 END)*100.0/
NULLIF(SUM(CASE WHEN stroke= 'Yes' then 1 ELSE 0 END),0),2) AS stroke_mortality_rate,

---for cancer
SUM(CASE WHEN cancer ='Yes' then 1 else 0 END) as no_of_cancer_case,
SUM(CASE WHEN cancer ='Yes' and dead = 'Yes' then 1 ELSE 0 END) as no_of_cancer_death,
ROUND
(SUM(CASE WHEN cancer = 'Yes' and dead= 'Yes' then 1 ELSE 0 END)*100.0/
NULLIF(SUM(CASE WHEN cancer= 'Yes' then 1 ELSE 0 END),0),2) AS cancer_mortality_rate,

------for pud
SUM(CASE WHEN PUD ='Yes' then 1 else 0 END) as no_of_pud_case,
SUM(CASE WHEN pud = 'Yes' and dead = 'Yes' then 1 ELSE 0 END) as no_of_pud_death,
ROUND
(SUM(CASE WHEN pud = 'Yes' and dead= 'Yes' then 1 ELSE 0 END)*100.0/
NULLIF(SUM(CASE WHEN pud= 'Yes' then 1 ELSE 0 END),0),2) AS pud_mortality_rate

FROM patient_demography
GROUP BY age_category,
	   education_category,
	   occupation_group
ORDER BY total_admission desc,
stroke_prevalence desc




-----OBJECTIVE QUESTION 4
---- Assess the impact of lifestyle factors on hospital outcomes.
SELECT 'Alcohol_Use' AS lifestyle_factor,
		alcohol_hx AS Status,
	   COUNT(*) as total_admission,
	   SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END) as total_death,
ROUNd(SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END)*100.0/COUNT(*),2) as mortality_rate
FROM risk_factors as r
JOIN admission_details as a on r.pt_id=a.pt_id
GROUP BY alcohol_hx
UNION ALL

SELECT 'Tobacco Use',
		tobacco_hx AS status,
		COUNT(*) as total_admission,
	SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END) as total_death,
ROUND(SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END)*100.0/COUNT(*),2) as mortality_rate
FROM risk_factors as r
JOIN admission_details as a on r.pt_id=a.pt_id
GROUP BY tobacco_hx
UNION ALL

SELECT 'NSAID Use',
		nsaid_use AS Status,
		COUNT(*) as total_admission,
	SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END) as total_death,
ROUND(SUM(CASE WHEN dead='Yes' then 1 ELSE 0 END)*100.0/COUNT(*),2) as mortality_rate
FROM risk_factors as r
JOIN admission_details as a on r.pt_id=a.pt_id
GROUP BY nsaid_use
ORDER BY mortality_rate DESC

------------------Objective Question 5
-----Evaluate the performance of the doctors based on specialization, and workload.
SELECT d.doctor,
	   d.specialization,
	   COUNT(*) as total_admission,
	   SUM(CASE WHEN dead = 'Yes' then 1 ELSE 0 END) as death_rate,
ROUND(SUM(CASE WHEN dead = 'Yes' then 1 ELSE 0 END)*100.0/ COUNT(*),2) as mortality_rate
FROM doctors as d
JOIN admission_details as a ON d.doctors_id=a.doctor_id
GROUP BY d.doctor,
	   d.specialization
ORDER BY  mortality_rate DESC




