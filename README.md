# Assignment on PRS Calculation


## GWAS 
Find and download one of the following GWAS summaries, which are linked from GWAShare Center in LD Hub http://ldsc.broadinstitute.org

1. __Height__



2. __BMI__

GIANT consortium: 2017 GIANT Gene-Physical Activity Interaction Meta-analysis
BMI.ACTIVE.ALL.AllAncestry.txt.gz

3. __Years of educational attainment 2016__

SSGAC data sharing: Okbay et al. (2016)
EduYears_Main.txt.gz

4. __Infant head circumference__

EGG: infant head circumference
EGG_HC_DISCOVERY.v2.txt.gz

5. __Alzheimer's disease__
IGAP: IGAP_stage_1_2_combined.txt
```R
# Get rs id from https://www.ncbi.nlm.nih.gov/variation/view/
trait[which(trait$MarkerName=="6:32451104"),"MarkerName"] <- "rs200460564"
trait[which(trait$MarkerName=="6:32512533"),"MarkerName"] <- "rs202207567"
trait[which(trait$MarkerName=="6:32521793"),"MarkerName"] <- "rs375350961"
trait[which(trait$MarkerName=="6:32554091"),"MarkerName"] <- "rs531446857"
trait[which(trait$MarkerName=="6:32639456"),"MarkerName"] <- "rs201341530"
trait[which(trait$MarkerName=="6:32639459"),"MarkerName"] <- "rs202086737"
trait[which(trait$MarkerName=="13:52803345"),"MarkerName"] <- "rs376333437"
```


## Genotypes

Human


Hominins


## PRS calculation




## 

