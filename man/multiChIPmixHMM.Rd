\name{multiChIPmixHMM}
\alias{multiChIPmixHMM}
\alias{MultiChIPmixHMM}

\title{ Hidden Markov Model with linear regression to analyse one or several biological replicates of ChIP-chip data }

\description{
   Linear regression mixture model to analyse one or several biological replicates of ChIP-chip data. Dependence between neighboring probes is taken into account. 
 	- initialisation of the EM algorithm by PCA or randomly
        - one component regression
        - two  component regression (same variances)
        - best model selected with BIC criterion
        - classification of each probe 
}

\usage{
multiChIPmixHMM(files=c("data1.txt","data2.txt"),init.by.PCA=TRUE,alpha=0.01,
proba=0.5,eps=1e-06,fileOUT="multiChIPmixHMM-results.txt",
fileOUTgraph="multiChIPmixHMM-results.pdf")
}

\arguments{
\item{files}{Vector of the names of the input data files or vector of the names of the RData objects if you want to directly load RData objects. The size of the vector corresponds to the number of replicates. Each file/object must have exactly 3 columns named ID, INPUT and IP (ID=probe identifier, INPUT=log2(INPUT), IP=log2(IP)). The field separator character is tabs if input data files are used.s}
\item{init.by.PCA}{Initialisation of the EM algorithm. If TRUE, initialisation is done by PCA and randomly otherwise (default value = TRUE)}
\item{alpha}{level at which classification is done}
\item{proba}{Initial proportions of each group}
\item{eps}{The threshold of convergence for the EM algorithm. The default is 1e-6.}
\item{fileOUT}{name of the output data file. Can be NULL}
\item{fileOUTgraph}{name of the plot file. Can be NULL}
}

\details{
  Input file "fileIN" has to be ordered according to the position of the probes along the chromosome. 
  Parameters are estimated using the EM algorithm. The E step is achieved with the Forward-Backward algorithm implemented in C.
}

\value{
   A text file with parameter estimations.
   A pdf graph to visualize the probes after classification (enriched probes in red) and the two regression lines. 
   An output file with the ID, the INPUT and IP values, the posterior probabilities and the predicted status for each probe using the classification rule: 1 if the probe is classified as enriched, i.e. tau>=1-alpha, 0 otherwise.
}


\examples{
data(data_Rep1)
data(data_Rep2)
res=multiChIPmixHMM(files=c(data_Rep1,data_Rep2),init.by.PCA=TRUE,alpha=0.01,
proba=0.5,eps=1e-06,fileOUT="multiChIPmixHMM-results.txt",
fileOUTgraph="multiChIPmixHMM-results.pdf")
}

\author{ C. Berard, caroline.berard@agroparistech.fr }
\seealso{multiChIPmix}


