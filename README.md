# Assignment on PRS Calculation

Find and download one of the following GWAS summaries, which were preprocessed from raw files listed in GWAShare Center in LD Hub http://ldsc.broadinstitute.org

The mapping file of human populations is [human.pop.txt](human.pop.txt). The population code is dscribed http://www.internationalgenome.org/category/population/. 

The paper of [A guide to performing Polygenic Risk Score analyses](https://www.biorxiv.org/content/early/2018/09/14/416545) will help you for calculating, applying, evaluating and plotting the results of polygenic risk scores (PRS) analyses.  


## GWAS summary and genotypes data 

The GWAS summary had been prepossed due to various of data issues. The columns used for the analysis are:

```GWAS
rsid : the unique identifier of SNPs
CHR : chromosome
POS : chromosome position (GRCh37/hg19)
A1 : effect allele (also called risk allele, reference allele, coded allele, etc.)
A2 : non-effect allele (also called alternate allele, the other allele etc.)
b : effect size (e.g. beta)
p : p value
```

The genotypes data belongs to 5 humans (named as "HG01880" "HG03007" "HG00867" "NA06989" "HG01121") selected from 5 super populations and 3 Hominins (named as "Altai" "Denisovan" "Vindija33.19"). The file format is same as [VCF](http://www.internationalgenome.org/wiki/Analysis/vcf4.0/) except that it is tab-delimited and the first row is column names. 


1. __BMI__ (bmi)

GIANT consortium: 2017 GIANT Gene-Physical Activity Interaction Meta-analysis

Preprocessed: [bmi-sig5e-3.txt](bmi-sig5e-3.txt);
Original: BMI.ACTIVE.ALL.AllAncestry.txt.gz. 

Human & Hominins genotypes [download](https://github.com/walterxie/assignment-prs/raw/master/bmi.zip).  

2. __Years of educational attainment 2016__ (eduyears)

SSGAC data sharing: Okbay et al. (2016)

Preprocessed: [EduYears-sig5e-3.txt](EduYears-sig5e-3.txt);
Original: EduYears_Main.txt.gz

Human & Hominins genotypes [download](https://github.com/walterxie/assignment-prs/raw/master/eduyears.zip).  

3. __Infant head circumference__ (hc)

EGG: infant head circumference

Preprocessed: [hc-sig5e-3-drop22.txt](hc-sig5e-3-drop22.txt);
Original: EGG_HC_DISCOVERY.v2.txt.gz

Human & Hominins genotypes [download](https://github.com/walterxie/assignment-prs/raw/master/hc.zip).  

4. __In transformed fasting insulin__ (insulin)

MAGIC: fasting insulin

Preprocessed: [insulin-sig5e-3-drop0.txt](insulin-sig5e-3-drop0.txt);
Original: FI_STAGE1_2_3_SEX_GWAS_2018.txt.gz

Human & Hominins genotypes [download](https://github.com/walterxie/assignment-prs/raw/master/insulin.zip).  

5. __Waist−to−hip ratio__ (whr)

GIANT consortium: 2017 GIANT Gene-Physical Activity Interaction Meta-analysis

Preprocessed: [waist-sig5e-3.txt](waist-sig5e-3.txt);
Original: WHRadjBMI.ACTIVE.ALL.AllAncestry.txt.gz

Human & Hominins genotypes [download](https://github.com/walterxie/assignment-prs/raw/master/whr.zip).  


## PRS calculation

There are [different models](https://choishingwan.github.io/PRSice/step_by_step/#prs-calculation) for PRS analyses. In this assignment, we are going to use additive model.


## LD-based clumping

[PLINK](https://www.cog-genomics.org/plink/1.9/)'s LD-based result clumping procedure groups SNP-based results across one or more datasets or analyses, based on empirical estimates of linkage disequilibrium between SNPs. http://zzz.bwh.harvard.edu/plink/clump.shtml  



## Questions

1. What is the formula for additive model to calculate PRS?

2. Make a summary of given genotypes in the trait.








