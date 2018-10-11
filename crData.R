setwd("~/WorkSpace/Neanderthal/src")
source("Result.R")

# back to work path
setwd("~/WorkSpace/assignment-prs")

# human 1000G population
pop <- getPhenoPop(data.dir="data")

sup.pop = unique(pheno$SuperPopulation)
human.pop <- data.frame(stringsAsFactors = F)
for (sp in sup.pop) {
  indi <- pheno[pheno$SuperPopulation ==sp,][1,]
  human.pop <- rbind(human.pop, indi)
}

write.table(human.pop, file="human.pop.txt", sep="\t", row.names=F, quote=F)

# human samples
samp = human.pop$Individual.ID


traits.names <- c("bmi","eduyears","hc","insulin","whr") 
neans=c("Altai","Denisovan","Vindija33.19")
colns=c("rsid","CHROM","POS","REF","ALT","GT")

for (trait.name in traits.names) {
  #trait.name = "bmi"
  RAW.PRS.PATH = file.path("~/WorkSpace/Neanderthal/",trait.name)
  PLINK.RESULT.PATH = file.path("~/WorkSpace/Neanderthal/plink1.9/",trait.name)
  
  ### 5 human
  for (chr in 1:22) {
    setwd(PLINK.RESULT.PATH)
    gt.raw.map <- read.table(paste0(trait.name, ".vcfchr", chr, ".map"), header=F, sep="\t", stringsAsFactors = F)
    gt.raw.ped <- read.table(paste0(trait.name, ".vcfchr", chr, ".ped"), header=F, sep="", stringsAsFactors = F)
    if (nrow(gt.raw.map) != (ncol(gt.raw.ped)-6)/2)
      stop("Number of SNPs in .map != .ped, chr = ", chr, ", trait = ", trait.name)
    
    for (ind in samp) {
      # HG01879 HG01879  0  0  0 -9 
      gt.ind <- gt.raw.ped[gt.raw.ped[,1]==ind,]
      # split into two columns with GT pairs
      gt <- matrix(gt.ind[-1:-6], ncol=2, byrow=TRUE)
      # "Allele1","Allele2"
      gt.raw.map$Allele1 <- unlist(gt[,1])
      gt.raw.map$Allele2 <- unlist(gt[,2])
    }
    setwd("~/WorkSpace/assignment-prs")
    write.table(gt.raw.map, file=paste0(trait.name,".chr", chr,".human.genotypes.txt"), sep="\t", 
                col.names=F, row.names=F, quote=F)
  }
  
  ### 3 Neanderthals genotypes
  for (ind in neans) {
    setwd(RAW.PRS.PATH)
    gt <- data.frame(stringsAsFactors = F)
    for (chr in 1:22) {
      # V1-V10 Denisovan, V11-V14 trait
      gt.raw <- read.table(file=paste0(trait.name, "-chr", chr, "-", ind, ".txt"), header=T, sep="\t", comment.char="#")
      #CHROM  POS ID REF ALT QUAL FILTER INFO  FORMAT   AltaiNeandertal  rsid A1 A2
      #nrow(gt.raw)
      # pull out GT from V10, e.g. 0/1:36:99:560,0,606:0,0:10,7:7,12:0,0:0
      gt.raw$GT <- sapply(strsplit(as.character(gt.raw[,10]), split=":"), "[", 1)
      # rm all meaningless calls "./."
      gt.raw <- gt.raw[!grepl("\\.", gt.raw$GT),]
      
      gt <- rbind(gt, gt.raw[,colns])
    }
    setwd("~/WorkSpace/assignment-prs")
    write.table(gt, file=paste(trait.name,ind,"genotypes.txt",sep = "."), sep="\t", row.names=F, quote=F)
  }
}


