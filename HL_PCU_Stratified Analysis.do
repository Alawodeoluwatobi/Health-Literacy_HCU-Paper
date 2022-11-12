****Health Literacy & Healthcare Utilization among Yougn Adults***
import sasxport "C:\Users\USER\Downloads\LLCP2016XPT\LLCP2016.XPT"

set more off

****Generating weight*****
gen wt = _llcpwt
svyset _psu [pweight=wt], strata(_ststr)


***LIMIT ANALYSIS TO YOUNG PEOPLE [15-29]*** 
keep if _age80<30


***DEPENDENT VARIABLE***
***Checkup***
ta checkup1
recode checkup1 (2 3 4 7 8 9=0 "No") (1=1 "Yes"), gen(checkup) 
ta checkup


***KEY EXPLANATORY VARIABLES [Health Literacy]***
***ORAL HL***
ta undrstnd
recode undrstnd (1=1 "very easy") (2=2 "somewhat easy") (3=3 "somewhat diff") (4=4 "very diff") (7/9=.), gen(Oral_HL)
ta Oral_HL

***WRITTEN HL***
ta written
recode written (1=1 "very easy") (2=2 "somewhat easy") (3=3 "somewhat diff") (4=4 "very diff") (5/9=.), gen(Writt_HL)
ta Writt_HL 

***MEDICAL ADVICE OR INFORMATION ABOUT HEALTH/MEDICAL TOPICS***
ta medadvic 
recode medadvic (1=1 "very easy") (2=2 "somewhat easy") (3=3 "somewhat diff") (4=4 "very diff") (5/9=.), gen(medic_advise)
ta medic_advise


***GENDER OF RESPONDENTS***
ta sex
recode sex (1=1 "Male") (2=2 "Female") (9=.), gen(sexvar)
ta sexvar

***RACE***
ta _race
recode _race (1=1 "White only") (2=2 "Black only") (3=3 "American Indian") (4=4 "Asian") (8=5 "Hispanic") (5 6 7 9=6 "Others"), gen(race)
ta race 
 

***INCOME CATEGORY***
ta _incomg
recode _incomg (1=1 "<$15k") (2=2 "$15k-<$25k") (3=3 "$25k-<$35k") (4=4 "$35k-<$50k") (5=5 "<$50k") (9=.), gen(Ann_Income)
ta Ann_Income 

***EDUCATIONAL LEVEL***
ta _educag
recode _educag (1=1 "<HS") (2=2 "HS Grad") (3=3 "Some college/Tech") (4=4 "College/Tech Grad") (9=.), gen(educ)
ta educ 

***MARITAL STATUS***
ta marital
recode marital (1 6=1 "Mar/Cohab") (2=2 "Divorced") (3/4=3 "Wid/Sep") (5=5 "Never married") (9=.), gen(mar_stat)
ta mar_stat

***RRESIDENTIAL TYPE***
ta mscode
recode mscode (1/3=1 "Urban") (5=2 "Rural"), gen(residence)
ta residence 

***EMPLOYMENT
ta employ1
recode employ1 (1/2=1 "Yes") (3/7=0 "No") (8/9=.), gen(employ_stat)
ta employ_stat

***HEALTH COVERAGE***
ta hlthpln1 
recode hlthpln1 (1=1 "Yes") (2=2 "No") (7/9=.), gen(health_cov)
ta health_cov

***HEALTH STATUS***
ta genhlth
recode genhlth (1/3=1 "Ex/VGood/Good") (4/5=2 "Fair/Poor") (7/9=.), gen(SRH)
ta SRH

***MENTAL HEALTH***
***DEPRESSION***
ta addepev2
recode addepev2 (1=0 "Yes") (2=1 "No") (7/9=.), gen(MNTLH)
ta MNTLH

***HEALTHCARE ACCESS***
ta persdoc2
recode persdoc2 (1/2=1 "Yes") (3=2 "No") (7/9=.), gen(access2care)
ta access2care 

***DISABILITY VARIABLES***
***DEAF***
ta deaf
recode deaf (1=0 "Yes") (2=1 "No") (7/9=.), gen(_deaf)
ta _deaf 

***BLIND***
ta blind
recode blind (1=0 "Yes") (2=1 "No") (7/9=.), gen(_blind)
ta _blind

***DECIDE***
ta decide
recode decide (1=0 "Yes") (2=1 "No") (7/9=.), gen(_decide)
ta _decide

***WALKING***
ta diffwalk
recode diffwalk (1=0 "Yes") (2=1 "No") (7/9=.), gen(_diffwalk)
ta _diffwalk

***DRESSING***
ta diffdres
recode diffdres (1=0 "Yes") (2=1 "No") (7/9=.), gen(_diffdres)
ta _diffdres

***DOING THINGS ALONE***
ta diffalon
recode diffalon (1=0 "Yes") (2=1 "No") (7/9=.), gen(_diffalon)
ta _diffalon

***DISABILITY VARIABLES***
ta _deaf
ta _blind
ta _decide
ta _diffwalk
ta _diffdres
ta _diffalon

***GENERATE DISABILITY STATUS***
gen disable = _deaf + _blind + _decide + _diffwalk + _diffdres + _diffalon 
ta disable
recode disable (0=1 "Yes") (1/6=2 "No"), gen(disability)
ta disability

***CHRONIC DISEASE STATUS***
***DIABETES***
ta diabete3
recode diabete3 (1/2=0 "Yes") (3/4=1 "No") (7/9=.), gen(diabetes)
ta diabetes

***HEART ATTACK***
ta cvdinfr4
recode cvdinfr4 (1=0 "Yes") (2=1 "No") (7/9=.), gen(hrt_att) 
ta hrt_att

***ANGINA***
ta cvdcrhd4
recode cvdcrhd4 (1=0 "Yes") (2=1 "No") (7/9=.), gen(angina) 
ta angina

***STROKE***
ta cvdstrk3
recode cvdstrk3 (1=0 "Yes") (2=1 "No") (7/9=.), gen(stroke) 
ta stroke

***ASTHMA***
ta asthma3
recode asthma3 (1=0 "Yes") (2=1 "No") (7/9=.), gen(asthma) 
ta asthma

***CANCER***
ta chcocncr
recode chcocncr (1=0 "Yes") (2=1 "No") (7/9=.), gen(cancer)
ta cancer 

***CANCER***
ta chccopd1
recode chccopd1 (1=0 "Yes") (2=1 "No") (7/9=.), gen(copd)
ta copd

***ARTHRITIS***
ta havarth3
recode havarth3 (1=0 "Yes") (2=1 "No") (7/9=.), gen(arthrithis)
ta arthrithis

***KIDNEY INFECTION***
ta chckidny
recode chckidny (1=0 "Yes") (2=1 "No") (7/9=.), gen(kidney)
ta kidney

***CHRONIC ILNESS**
ta diabetes
ta hrt_att
ta angina
ta stroke
ta asthma
ta cancer
ta copd
ta arthrithis
ta kidney

***GENERATE CHRONIC ILLNESS***
gen chronic = diabetes + hrt_att + angina + stroke + asthma + cancer + copd + arthrithis + kidney 
ta chronic

recode chronic (0/6=1 "Yes") (7/10=2 "No"), gen(chronic_cond)
ta chronic_cond


***TABULATION OF ALL VARIABLES***
sum _age80 if _age80<30
svy: ta checkup if _age80<30  
svy: ta Writt_HL if _age80<30
svy: ta Oral_HL if _age80<30
svy: ta medic_advise if _age80<30
svy: ta sexvar if _age80<30
svy: ta race if _age80<30
svy: ta Ann_Income if _age80<30
svy: ta educ if _age80<30
svy: ta mar_stat if _age80<30
svy: ta health_cov if _age80<30
svy: ta SRH if _age80<30
svy: ta MNTLH if _age80<30
svy: ta access2care if _age80<30
svy: ta chronic_cond if _age80<30
svy: ta residence if _age80<30
svy: ta employ_stat if _age80<30

***CHISQUARE TEST - checkup***
svy: ta Writt_HL checkup, row 
svy: ta Oral_HL checkup, row 
svy: ta medic_advise checkup, row 
svy: ta sexvar checkup, row 
svy: ta race checkup, row
svy: ta Ann_Income checkup, row 
svy: ta educ checkup, row 
svy: ta mar_stat checkup, row 
svy: ta health_cov checkup, row 
svy: ta SRH checkup, row 
svy: ta access2care checkup, row 
svy: ta chronic_cond checkup, row
svy: ta MNTLH checkup, row
svy: ta residence checkup, row 
svy: ta employ_stat checkup, row 

***MUTLIVARIABLE ANALYSIS FOR WHITES***
***ANNUAL ROUTINE MEDICAL CHECKUP***
logit checkup i.Writt_HL, or
logit checkup i.Oral_HL, or
logit checkup i.medic_advise, or
logit checkup i.Writt_HL i.Oral_HL i.medic_advise _age80 sexvar i.race i.Ann_Income i.educ i.employ_stat i.residence i.mar_stat i.health_cov i.SRH i.MNTLH i.access2care i.chronic_cond, or



