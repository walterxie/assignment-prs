setwd("~/WorkSpace/Neanderthal/src")
source("Result.R")

# human 1000G population
pop <- getPhenoPop(data.dir="../data")

population = unique(pop$Population)
human.pop <- data.frame(stringsAsFactors = F)
for (p in population) {
  indi <- pop[pop$Population ==p,][2,]
  human.pop <- rbind(human.pop, indi)
}
human.pop <- human.pop[,c("Individual.ID","Population","Description",
                          "SuperPopulation","SuperPopulationDescription")]

# back to work path
setwd("~/WorkSpace/assignment-prs")

write.table(human.pop, file="human.pop.txt", sep="\t", row.names=F, quote=F)

# human samples
samp = human.pop$Individual.ID

### extract genotypes
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
    # read VCF
    fn.vcf <- paste0(trait.name, ".chr", chr, ".vcf")
    con <- file(fn.vcf,open="r")
    lins <- readLines(con, n=7)
    close(con)
    vcf.colns <- strsplit(lins[length(lins)], "\t")[[1]]
    #"#CHROM"
    vcf.colns[1] <- substring(vcf.colns[1], 2)  
    # "HG00096_HG00096" "HG00097_HG00097" "HG00099_HG00099"
    vcf.colns <- gsub("_.*$", "", vcf.colns)
    #human.pop$Individual.ID %in% vcf.colns
    
    # CHROM POS  ID REF ALT QUAL FILTER INFO FORMAT HG00096
    gt.raw <- read.table(file=fn.vcf, header=T, sep="\t", comment.char="#")
    if (ncol(gt.raw) != length(vcf.colns))
      stop("Column names did not parse correctly from VCF file ", fn.vcf)
    colnames(gt.raw) <- vcf.colns
    
    gt <- gt.raw[,1:5]
    #sample.start = which(colnames(gt.raw)=="HG00096") # 2504
    for (ind in samp) {
      gt[,ind] <- gt.raw[,ind]
    }
    setwd("~/WorkSpace/assignment-prs")
    write.table(gt, file=paste0(trait.name,".chr", chr,".human.genotypes.txt"), sep="\t", 
                row.names=F, quote=F)
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

# zip bmi.zip bmi.*.genotypes.txt
