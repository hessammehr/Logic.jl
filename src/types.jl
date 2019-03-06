struct Var
    name::String
end

const Head = Vector{Predicate}
const Body = Vector{Union{Predicate, Var}}

struct Clause
    head::Head
    body::Body
end

struct Predicate
    name::String
    params::Vector{Union{Predicate, Var, Const}}
end

const Database = Vector{Clause}
