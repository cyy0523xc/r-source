% File src/library/methods/man/methodUtilities.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2009 R Core Team
% Distributed under GPL 2 or later

\name{methodUtilities}
\alias{functionBody}
\alias{functionBody<-}
\alias{allNames}
\alias{getFunction}
\alias{existsFunction}
\alias{el}
\alias{elNamed}
\alias{el<-}
\alias{elNamed<-}
\alias{formalArgs}
\alias{Quote}
\alias{showDefault}
\alias{initMethodDispatch}
\alias{methodSignatureMatrix}
\title{Utility Functions for Methods and S-Plus Compatibility}
\description{
  These are utilities, currently in the \pkg{methods} package, that
  either provide some functionality needed by the package (e.g., element
  matching by name), or add compatibility with S-Plus, or both.
}
\usage{
functionBody(fun=sys.function(sys.parent()))

allNames(x)

getFunction(name, generic=TRUE, mustFind=TRUE, where)

el(object, where)

elNamed(x, name, mustFind=FALSE)

formalArgs(def)

Quote()

showDefault(object, oldMethods = TRUE)

initMethodDispatch(where = topenv(parent.frame()))

methodSignatureMatrix(object, sigSlots = c("target", "defined"))
}
\section{Summary of Functions}{
  \describe{
    \item{\code{allNames}:}{
      the character vector of names (unlike \code{names()}, never
      returns \code{NULL}).
    }
    \item{\code{getFunction}:}{
      find the object as a function.
    }
    \item{\code{elNamed}:}{
      get the element of the vector corresponding to name.  Unlike the
      \code{[}, \code{[[}, and \code{$} operators, this function %$
      requires \code{name} to match the element name exactly (no partial
      matching).
    }
    \item{\code{formalArgs}:}{
      Returns the names of the formal arguments of this function.
    }
    \item{\code{existsFunction}:}{
      Is there a function of this name?  If \code{generic} is
      \code{FALSE}, generic functions are not counted.
    }
    \item{\code{findFunction}:}{
      return all the indices of the search list on which a function
      definition for \code{name} exists.

      If \code{generic} is \code{FALSE}, ignore generic functions.
    }
    \item{\code{showDefault}:}{
      Utility, used to enable \code{show} methods to be called by the
      automatic printing (via \code{print.default}).

      Argument \code{oldMethods} controls whether old-style print
      methods are used for this object.  It is \code{TRUE} by default
      if called directly, but \code{FALSE} when called from the
      \pkg{methods} package for automatic printing (to avoid potential
      recursion).
    }
    \item{\code{initMethodDispatch}:}{
      Turn on the internal method dispatch code.  Called on attaching
      the package.  Also, if dispatch has been turned off (by calling
      \code{.isMethodsDispatchOn(FALSE)}---a very gutsy thing to do),
      calling this function should turn dispatch back on again.
    }
  \item{\code{methodSignatureMatrix}:}{
      Returns a matrix with the contents of the specified slots as
      rows.  The slots should be named character strings of the same
      length.  Basically used to turn the signatures of a
      \code{"MethodDefinition"} object into a matrix for printing.
    }
  }
}
\keyword{internal}
