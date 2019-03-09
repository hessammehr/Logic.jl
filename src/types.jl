struct Var
    name::String
end

const Goal = Union{Predicate, Conj, Disj}

struct Conj{N} where N
    goals::NTuple{N, Goal}
end

struct Disj
    goals::NTuple{N, Goal}
end

struct Predicate
    name::String
    params::Vector{Union{Predicate, Var, Const}}
end

struct Clause
    head::Goal
    body::Goal
end

const Database = Vector{Clause}
