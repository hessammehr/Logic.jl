# Logic.jl
Sketch of a typed Prolog interpreter in Julia. Aiming to have a nice Julia
API of the purer parts of Prolog. Also curious about performance and whether
typing helps at all.

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