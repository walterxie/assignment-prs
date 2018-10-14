# Assignment on PRS Calculation

This assignment provides some exposure to working with polygenic risk scores (PRSs).

Find and download one of the following GWAS summaries, which were preprocessed from raw files listed in GWAShare Center in LD Hub http://ldsc.broadinstitute.org

The mapping file of human populations is [human.pop.txt](human.pop.txt). The population code is dscribed http://www.internationalgenome.org/category/population/. 


## GWAS summary and genotype data 

The GWAS summary had been pre-processed to protect you from some of the more annoying data issues. The columns used for the analysis are:

```GWAS
rsid : the unique identifier of SNPs
CHR : chromosome
POS : chromosome position (GRCh37/hg19)
A1 : effect allele (also called risk allele, reference allele, coded allele, etc.)
A2 : non-effect allele (also called alternate allele, the other allele etc.)
b : effect size (e.g. beta)
p : p value
```

The genotype data you will calculate PRSs for belong to 26 humans selected from 5 super populations and 3 ancient hominins (named as "Altai" "Denisovan" "Vindija33.19"). The file format for the genotype data is the same as [VCF](http://www.internationalgenome.org/wiki/Analysis/vcf4.0/) except that it is tab-delimited and the first row contains column names. 


1. __BMI__ (bmi)

GIANT consortium: 2017 GIANT Gene-Physical Activity Interaction Meta-analysis

Preprocessed: [bmi-sig5e-3.txt](bmi-sig5e-3.txt);
Original: BMI.ACTIVE.ALL.AllAncestry.txt.gz. 

human & hominin genotype data [download](https://github.com/walterxie/assignment-prs/raw/master/bmi.zip).  
LD-based clumped SNPs [download](https://github.com/walterxie/assignment-prs/raw/master/bmi.clump.zip).


2. __Years of educational attainment 2016__ (eduyears)

SSGAC data sharing: Okbay et al. (2016)

Preprocessed: [EduYears-sig5e-3.txt](EduYears-sig5e-3.txt);
Original: EduYears_Main.txt.gz

human & hominin genotype data [download](https://github.com/walterxie/assignment-prs/raw/master/eduyears.zip). 
LD-based clumped SNPs [download](https://github.com/walterxie/assignment-prs/raw/master/eduyears.clump.zip).

3. __Infant head circumference__ (hc)

EGG: infant head circumference

Preprocessed: [hc-sig5e-3-drop22.txt](hc-sig5e-3-drop22.txt);
Original: EGG_HC_DISCOVERY.v2.txt.gz

human & hominin genotype data [download](https://github.com/walterxie/assignment-prs/raw/master/hc.zip).  
LD-based clumped SNPs [download](https://github.com/walterxie/assignment-prs/raw/master/hc.clump.zip).

4. __In transformed fasting insulin__ (insulin)

MAGIC: fasting insulin

Preprocessed: [insulin-sig5e-3-drop0.txt](insulin-sig5e-3-drop0.txt);
Original: FI_STAGE1_2_3_SEX_GWAS_2018.txt.gz

human & hominin genotype data [download](https://github.com/walterxie/assignment-prs/raw/master/insulin.zip). 
LD-based clumped SNPs [download](https://github.com/walterxie/assignment-prs/raw/master/insulin.clump.zip).

5. __Waist−to−hip ratio__ (whr)

GIANT consortium: 2017 GIANT Gene-Physical Activity Interaction Meta-analysis

Preprocessed: [waist-sig5e-3.txt](waist-sig5e-3.txt);
Original: WHRadjBMI.ACTIVE.ALL.AllAncestry.txt.gz

human & hominin genotype data [download](https://github.com/walterxie/assignment-prs/raw/master/whr.zip).  
LD-based clumped SNPs [download](https://github.com/walterxie/assignment-prs/raw/master/whr.clump.zip).


## PRS calculation

There are [different models](https://choishingwan.github.io/PRSice/step_by_step/#prs-calculation) to code the genotypes during PRS analyses. In this assignment, we are going to use the additive model.

There are also different approaches to performing PRS analysis. In this assignment, we will focus on two of them: p-value thresholding (P+T) with/without LD-based clumping.  

## LD-based clumping

[PLINK](https://www.cog-genomics.org/plink/1.9/)'s LD-based clumping procedure groups SNP-based results across one or more datasets or analyses, based on empirical estimates of linkage disequilibrium between SNPs. http://zzz.bwh.harvard.edu/plink/clump.shtml  

The result saved in the _*.clumped_ file provides index SNPs in the "SNP" column. You will use these index SNPs rather than all SNPs from VCF files during the PRS calculation.

Tip to read _*.clumped_ files in R:
```R
# https://stackoverflow.com/questions/16979858/reading-text-file-with-multiple-space-as-delimiter-in-r 
clump.df <- read.table(file, sep = "" , header = T, na.strings ="", stringsAsFactors= F)
```

Please write up your analysis in a report, describe what you did, and answer the following questions.

## Questions

1. What is the formula for an additive model to calculate PRS?

2. Why do we need to make LD-based clumping before calculating PRS?

3. Compare PRSs (p-value < 5E-3) calculated by all SNPs with PRSs by index SNPs from clumping for all 29 samples. 

4. Focusing on the LD-based clumping method, calculate PRSs using these different thresholds: 5E-3, 1E-4, 5E-4, 1E-5, 5E-5, 1E-6, 5E-6, 1E-7.

5. What threshold should we use?

6. Plot PRSs for question 4 in such a way that the results for the 3 hominins can be compared to the empirical distribution from the 26 human genotypes.
