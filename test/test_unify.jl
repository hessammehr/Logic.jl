using Test
using Logic: unify, @var, @predicate, Variable, Success, Failure, Clause, Conj, Disj

@test Success() == Success()
@test unify(1, 1) == Success()
@test unify(1, 2) == Failure(1, 2)

@var X::Int
@var Y::String
@var Z::String
@var T::Any
@test unify(X, 1) == unify(1, X) == Success(Dict(X => 1))
@test unify(X, X) == Success(Dict(X => X))
@test unify(X, Y) == Failure(X, Y)
@test unify(Y, Z) == Success(Dict(Y => Z))

@predicate parentp(p::Variable{String}, c::Variable{String})

@assert unify(parentp("Abraham", "Isaac"), parentp(Y, Z)) == Success(Dict(Y => "Abraham", Z => "Isaac"))
@assert unify(parentp("Abraham", Z), parentp(Y, "Isaac")) == Success(Dict(Y => "Abraham", Z => "Isaac"))

@predicate can(verb)
@predicate source(node, port)
@test unify(can(source("flask1", X)), can(T)) == Success(Dict(T => source("flask1", X)))
@test unify(can(source("flask1", "0")), can(source(Y, Z))) == Success(Dict(Y => "flask1", Z => "0"))

@predicate male(name::Variable{String})
@predicate father(f::Variable{String}, c::Variable{String})
@show unify(father("Abraham", "Isaac"), Clause(father(Y, Z), Conj(parentp(Y, Z), male(Y))))