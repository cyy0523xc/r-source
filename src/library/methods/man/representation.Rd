% File src/library/methods/man/representation.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2010 R Core Team
% Distributed under GPL 2 or later

\name{representation}
\alias{representation}
\alias{prototype}
\title{ Construct a Representation or a Prototype for a Class Definition}
\description{
  In calls to
  \code{\link{setClass}}, these two functions construct,
  respectively, the \code{representation} and \code{prototype}
  arguments.  They do various checks and handle special cases.  You're
  encouraged to use them when defining classes that, for
  example, extend other classes as a data part or have multiple
  superclasses, or that combine extending a class and slots.
}
\usage{
representation(...)
prototype(...)
}
\arguments{
  \item{...}{
    The call to representation takes arguments that are single character
    strings.  Unnamed arguments are classes that a newly defined class
    extends; named arguments name the explicit slots in the new class,
    and specify what class each slot should have.

    In the call to \code{prototype}, if an unnamed argument is
    supplied, it unconditionally forms the basis for the prototype
    object.  Remaining arguments are taken to correspond to slots of
    this object.  It is an error to supply more than one unnamed argument.
}
}
\details{
  The \code{representation} function applies tests for the validity of
  the arguments.  Each must specify the name of a class.

  The classes named don't have to exist when \code{representation} is
  called, but if they do, then the function will check for any duplicate
  slot names introduced by each of the inherited classes.

  The arguments to \code{prototype} are usually named initial values
  for slots, plus an optional first argument that gives the object
  itself.  The unnamed argument is typically useful if there is a data
  part to the definition (see the examples below).
}
\value{
  The value of \code{representation}  is just the list of arguments, after these have been checked
  for validity.

  The value of \code{prototype} is the object to be used as the
  prototype.  Slots will have been set consistently with the
  arguments, but the construction does \emph{not} use the class
  definition to test validity of the contents (it hardly can, since
  the prototype object is usually supplied to create the definition).
}
\references{
 Chambers, John M. (2008)
 \emph{Software for Data Analysis: Programming with R}
  Springer.  (For the R version.)

 Chambers, John M. (1998)
 \emph{Programming with Data}
 Springer (For the original S4 version.)
}
\seealso{ \code{\link{setClass}} }

\examples{
## representation for a new class with a directly define slot "smooth"
## which should be a "numeric" object, and extending class "track"
representation("track", smooth ="numeric")
\dontshow{
prev <- getClassDef("class3")
setClass("class1", representation(a="numeric", b = "character"))
setClass("class2", representation(a2 = "numeric", b = "numeric"))
try(setClass("class3", representation("class1", "class2")))
{if(is.null(prev))
  stopifnot(!isClass("class3"))
else
  stopifnot(identical(getClassDef("class3"), prev))}
}

setClass("Character",representation("character"))
setClass("TypedCharacter",representation("Character",type="character"),
          prototype(character(0),type="plain"))
ttt <- new("TypedCharacter", "foo", type = "character")
\dontshow{
stopifnot(identical(as(ttt, "character"), "foo"))
}

setClass("num1", representation(comment = "character"),
         contains = "numeric",
         prototype = prototype(pi, comment = "Start with pi"))

\dontshow{
stopifnot(identical(new("num1"), new("num1", pi, comment = "Start with pi")))
for(cl in c("num1", "TypedCharacter", "Character", "class2", "class1"))
    removeClass(cl)
}

}
\keyword{programming}
\keyword{classes}

