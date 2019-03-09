# Logic.jl
Sketch of a Prolog interpreter in Julia. Aiming to have a nice Julia API of the purer parts of Prolog. It would be cool if Constraint Handling Rules (CHR) could be implemented on top of this subset.

Other goals:
- Make the database/context explicit.
- 
- Find how well-suited Julia is to this problem. I think Julia has a lot of potential beyond typical numerical applications, as demonstrated
by a number of projects.

I have purposely not read about the implementation of the Warren Abstract Machine (WAM) hoping to come up with something (possibly) different.

## Getting started

```julia
using Pkg
Pkg.develop("https://github.com/hessammehr/Logic.jl")
```

This will conveniently clone the current repository to (typically) `~/.julia/dev/Logic`.

## Contributing and resources
Pull requests, issues, and discussions are very much appreciated. I found the following resources useful for learning about logic programming and Prolog in particular:

- The Power of Prolog by Markus Triska ([link](https://www.metalevel.at/prolog))
- The Art of Prolog by Sterling and Shapiro ([link](https://mitpress.mit.edu/books/art-prolog-second-edition))
