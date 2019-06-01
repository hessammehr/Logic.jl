using Test
using Logic: unify, @var, @predicate, Variable, Success, Failure

@test Success() == Success()
@test unify(1, 1) == Success()
@test unify(1, 2) == Failure(1, 2)

@var X::Int
@var Y::String
@var Z::String
@test unify(X, 1) == unify(1, X) == Success(Dict(X => 1))
@test unify(X, X) == Success(Dict(X => X))
@test unify(X, Y) == Failure(X, Y)
@test unify(Y, Z) == Success(Dict(Y => Z))

@predicate Parent(p::Variable{String}, c::Variable{String})
@assert unify(Parent("Abraham", "Isaac"), Parent(Y, Z)) == Success(Dict(Y => "Abraham", Z => "Isaac"))
@assert unify(Parent("Abraham", Z), Parent(Y, "Isaac")) == Success(Dict(Y => "Abraham", Z => "Isaac"))