\name{multiChIPmixHMM}
\alias{multiChIPmixHMM}

\title{ Hidden Markov Model with linear regression to analyse one or several biological replicates of ChIP-chip data }

\description{
   Linear regression mixture model to analyse one or several biological replicates of ChIP-chip data. Dependence between neighboring probes is taken into account. 
 	- initialisation of the EM algorithm by PCA or randomly
        - one component regression
        - two  component regression (same variances)
        - best model selected with BIC criterion
        - classification of each probe using the MAP rule
}

\usage{
multiChIPmixHMM(files=c("data1.txt","data2.txt"),init.by.PCA=TRUE,proba=0.5,save=TRUE,fileOUT="multiChIPmix-results.txt",fileOUTgraph="multiChIPmix-results.pdf")
}

\arguments{
\item{files}{vector of the names of the input data files corresponding to the replicates. Each file has exactly 3 columns named ID, INPUT and IP (ID=probe identifier, INPUT=log2(INPUT), IP=log2(IP))}
\item{init.by.PCA}{Initialisation of the EM algorithm. If TRUE, initialisation is done by PCA and randomly otherwise (default value = TRUE)}
\item{proba}{Proportions of each group}
\item{save}{If TRUE, data results are saved in file fileOUT}
\item{fileOUT}{name of the output data file with 7 columns (ID=probe identifier, INPUT.1 = log2(INPUT.Rep1), IP.1 = log2(IP.Rep1), INPUT.2 = log2(INPUT.Rep2), IP.2 = log2(IP.Rep2),tau = posterior probability, status = probe status, 1 if the probe is classified as enriched, i.e. tau>0.5, 0 otherwise}
\item{fileOUTgraph}{name of the plot file}
}

\details{
  Input file "fileIN" has to be ordered according to the position of the probes along the chromosome. 
  Parameters are estimated using the EM algorithm. The E step is achieved with the Forward-Backward algorithm implemented in C.
}

\value{
   A text file with parameter estimations.
   A png graph to visualize the probes after classification (enriched probes in red) and the two regression lines. 
   An output file with the ID, the INPUT and IP values, the posterior probabilities and the predicted status for each probe using the classification rule.
}


\examples{
data(dataHMM_Rep1)
data(dataHMM_Rep2)
multiChIPmixHMM(files=c(dataHMM_Rep1,dataHMM_Rep2),init.by.PCA=TRUE,proba=0.5,save=TRUE,fileOUT="multiChIPmixHMM-results.txt",fileOUTgraph="multiChIPmixHMM-results.pdf")
}

\author{ C. Berard, caroline.berard@agroparistech.fr }
\seealso{multiChIPmix}


