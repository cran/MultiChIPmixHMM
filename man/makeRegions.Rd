\name{makeRegions}
\alias{makeRegions}

\title{Concatenation of adjacent probes with the same status}

\description{
Concatenation of adjacent probes with the same status in order to give results by regions, which is more interesting than by probes.
}

\usage{
makeRegions(fileIN="multiChIPmixHMM-results.txt", fileOUT="regions.txt", gap=1)
}

\arguments{
\item{fileIN}{Name of the file corresponding to the output file of the multiChIPmixHMM or multiChIPmix function with the columns ID and status.}
\item{fileOUT}{Name of the output file containing the positions of the regions.}
\item{gap}{maximum gap allowed within the region between two probes of the same status (default value = 1)}
}


\value{
    An output file where each line corresponds to an enriched region. The two columns "start" and "stop" correspond respectively to the ID of the probe starting the region and the ID of the probe ending the region.
}



\author{ C. Berard, caroline.berard@agroparistech.fr }



