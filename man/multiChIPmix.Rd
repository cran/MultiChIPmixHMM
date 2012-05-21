\name{multiChIPmix}
\alias{multiChIPmix}

\title{Linear Regression Mixture Model to analyse one or several biological replicates of ChIP-chip data }

\description{Linear regression mixture model to analyse one or several biological replicates of ChIP-chip data.
- initialisation of the EM algorithm by PCA or randomly
- one component regression
- two component regression (same variances)
- best model selected with BIC criterion
- classification of each probe using the Benjamini-Hochberg procedure (adjusted false-positive risk lower than 0.01)
}

\usage{
multiChIPmix(files=c("data1.txt","data2.txt"),init.by.PCA=TRUE,alpha=0.01,proba=0.5,save=TRUE,fileOUT="multiChIPmix-results.txt",fileOUTgraph="multiChIPmix-results.pdf")
}

\arguments{
\item{files}{vector of the names of the input data files corresponding to the replicates. Each file has 3 columns named ID, INPUT and IP (ID=probe identifier, INPUT=log2(INPUT), IP=log2(IP))}
\item{init.by.PCA}{Initialisation of the EM algorithm. If TRUE, initialisation is done by PCA and randomly otherwise (default value = TRUE)}
\item{alpha}{level at which FDR is controlled}
\item{proba}{Proportions of each group}
\item{save}{If TRUE, data results are saved in file fileOUT}
\item{fileOUT}{name of the output data file}
\item{fileOUTgraph}{name of the plot file}
}

\details{
   Parameters are estimated using the EM algorithm. Classification is performed with a control of false positive.
}

\value{
   A png graph to visualize the probes after classification (enriched probes in red) and the two regression lines for each replicate. 
   An output file with the ID, the INPUT and IP values, the posterior probabilities, fp.risk=false positive risk defined as the probability of obtaining a posterior probability at least as extreme as the one that was actually observed when the probe is normal (equivalent to the raw pvalue in the hypothesis test theory), FDR.BH= adjusted fp.risk by the Benjamini-Hochberg procedure, status = probe status, 1 if the probe is classified as enriched, i.e. FDR.BH<=0.01, 0 otherwise.
}

\references{ 
  M-L. Martin-Magniette, T. Mary-Huard, C. Berard and S. Robin, ChIPmix: Mixture model of                          
regressions for two-color ChIP-chip analysis. Bioinformatics 24:181-86, 2008.
}

\examples{
data(data_Rep1)
data(data_Rep2)
multiChIPmix(files=c(data_Rep1,data_Rep2),init.by.PCA=TRUE,alpha=0.01,proba=0.5,save=TRUE,fileOUT="multiChIPmix-results.txt",fileOUTgraph="multiChIPmix-results.pdf")
}

\author{ C. Berard, caroline.berard@agroparistech.fr }
\seealso{multiChIPmixHMM}


