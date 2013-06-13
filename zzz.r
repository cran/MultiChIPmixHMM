.onAttach <- function(libname, pkgname)
{
	if(.Platform$OS.type=="windows" && 
		.Platform$GUI=="Rgui") {

		winMenuAddItem("Vignettes", "MultiChIPmixHMM",
		"shell.exec(system.file(\"doc\",\"MultiChIPmixHMM.pdf\", package=\"MultiChIPmixHMM\"))")

	}
}
