* Relationship between self-reported health and insurance 
* Barra Roantree, 2024
* to mirror analysis in Mastering Metrics by Angrist and Pischke


* Paths
********************************************************************************************************************
global rawdata "${onedrive}/Research/Data/ISSDA 0021-00_Healthy Ireland_1-8/0021-08 Healthy Ireland 2023 DIP/0021-08 Healthy Ireland 2023_Data/STATA/0021-08_healthy_ireland_2023.DTA"
global outputs "/Users/barraroantree/Code/ecu33091/Lectures/Chapter1/"


* Load data, clean and plot relationship between self-reported health and insurance
********************************************************************************************************************

* load data
use "${rawdata}", clear


* crate vars
gen has_health_insurance = (q55 == 1)
label define has_health_insurance 0 "No health insurance" 1 "Has health insurance", replace
label values has_health_insurance has_health_insurance

clonevar self_reported_health = spq1
replace self_reported_health = . if inlist(self_reported_health,5,6)
label define self_reported_health 1 "Very good" 2 "Good" 3 "Fair" 4 "Bad" 5 "Very bad", replace
label values self_reported_health self_reported_health

label define age_cats 1 "15-24" 2 "25-34" 3 "35-44" 4 "45-54" 5 "55-64" 6 "65-74" 7 "75+", replace
label values age_category age_cats


* plot relationship between self-reported health and insurance
graph bar (percent), over(has_health_insurance) over(self_reported_health) asyvars ///
    title("Self-reported health by insurance status") 


* save graph
graph export "${outputs}/health_and_insurance.png", replace

// ends 
