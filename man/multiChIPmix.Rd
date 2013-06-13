\name{multiChIPmix}
\alias{multiChIPmix}


\title{Linear Regression Mixture Model to analyse one or several biological replicates of ChIP-chip data }

\description{Linear regression mixture model to analyse one or several biological replicates of ChIP-chip data.
- initialisation of the EM algorithm by PCA or randomly
- one component regression
- two component regression (same variances)
- best model selected with BIC criterion
- classification of each probe 
}

\usage{
multiChIPmix(files=c("data1.txt","data2.txt"),init.by.PCA=TRUE,alpha=0.01,
proba=0.5,eps=1e-06,fileOUT="multiChIPmix-results.txt",
fileOUTgraph="multiChIPmix-results.pdf")
}

\arguments{
\item{files}{Vector of the names of the input data files or vector of the names of the RData objects if you want to directly load RData objects. The size of the vector corresponds to the number of replicates. Each file/object must have exactly 3 columns named ID, INPUT and IP (ID=probe identifier, INPUT=log2(INPUT), IP=log2(IP)). The field separator character is tabs if input data files are used.}
\item{init.by.PCA}{Initialisation of the EM algorithm. If TRUE, initialisation is done by PCA and randomly otherwise (default value = TRUE)}
\item{alpha}{level at which classification is done}
\item{proba}{Initial proportions of each group}
\item{eps}{The threshold of convergence for the EM algorithm. The default is 1e-6.}
\item{fileOUT}{name of the output data file. Can be NULL}
\item{fileOUTgraph}{name of the plot file. Can be NULL}
}

\details{
   Parameters are estimated using the EM algorithm. 
}

\value{
   A pdf graph to visualize the probes after classification (enriched probes in red) and the two regression lines for each replicate. 
   An output file with the ID, the INPUT and IP values, the posterior probability, and the probe status, which is 1 if the probe is classified as enriched (i.e. posterior probability >= 1-alpha), 0 otherwise.
}

\references{ 
  M-L. Martin-Magniette, T. Mary-Huard, C. Berard and S. Robin, ChIPmix: Mixture model of                          
regressions for two-color ChIP-chip analysis. Bioinformatics 24:181-86, 2008.
}

\examples{
data(data_Rep1)
data(data_Rep2)
res=multiChIPmix(files=c(data_Rep1,data_Rep2),init.by.PCA=TRUE,alpha=0.01,
proba=0.5,eps=1e-06,fileOUT="multiChIPmix-results.txt",
fileOUTgraph="multiChIPmix-results.pdf")
}

\author{ C. Berard, caroline.berard@agroparistech.fr }
\seealso{multiChIPmixHMM}


