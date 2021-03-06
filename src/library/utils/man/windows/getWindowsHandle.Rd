% File src/library/utils/man/windows/getWindowsHandle.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2007 R Core Team
% Distributed under GPL 2 or later

\name{getWindowsHandle}
\alias{getWindowsHandle}
\title{Get a Windows Handle}
\description{
  Get the Windows handle of a window or of the \R{} process.
}
\usage{
getWindowsHandle(which = "Console")
}
\arguments{
  \item{which}{A string (see below), or the number of a
                graphics device window}
}
\details{
  \code{getWindowsHandle} gets the Windows handle.
  Possible choices for \code{which} are:
  \tabular{ll}{
  \code{"Console"} \tab The console window handle. \cr
  \code{"Frame"}   \tab The MDI frame window handle. \cr
  \code{"Process"} \tab The process pseudo-handle. \cr
  A device number \tab The window handle of a graphics device
 }
  These values are not normally useful to users, but may be used by
  developers making add-ons to \R{}.

  \code{NULL} is returned for the Frame handle if not running in MDI mode,
  for the Console handle when running Rterm, for any unrecognized
  string for \code{which}, or for a graphics device with no
  corresponding window.

  Other windows (help browsers, etc.) are not accessible
  through this function.
}
\note{
  As from R 2.6.0, this function returns an external pointer rather than
  an integer value, and \code{which = "ProcessId"} is no longer supported.
  Use \code{\link{Sys.getpid}} for the latter.
}
\value{
  An external pointer holding the Windows handle, or \code{NULL}.
}
\seealso{\code{\link{getIdentification}}, \code{\link{getWindowsHandles}}}
\examples{
getWindowsHandle()
}
\keyword{utilities}
