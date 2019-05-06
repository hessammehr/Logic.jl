using Test
using Logic: unify, Var

x = Var("x")
y = Var("y")

@test unify(x, 1) == [(x => 1)]
@test unify(x, y) == [(x => y)]
