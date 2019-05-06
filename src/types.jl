abstract type Predicate
end

struct Literal{T}
    val :: T
end

struct Var
    name::String
end

const Goal = Union{Predicate, Var, Literal}

const Substitution = Tuple{Var, Predicate}

struct Conj <: Predicate
    goals::Tuple
end

struct Disj <: Predicate
    goals::Tuple
end

struct Clause
    head::Goal
    body::Goal
end

const Database = Vector{Clause}
