abstract type Predicate
end

struct Literal{T} where T
    val :: T
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
