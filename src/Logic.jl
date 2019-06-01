module Logic

VAR_COUNTER = 0

struct Var{T}
    name::String
end

function Var{T}() where T
    global VAR_COUNTER
    
    VAR_COUNTER += 1
    Var{T}("_VAR$VAR_COUNTER")
end

Var(args...) = Var{Any}(args...)

Variable{T} = Union{T, Var{T}} where T

abstract type Predicate end

macro predicate(decl)
    name, args = decl.args[1], decl.args[2:end]
    arg_names = [field isa Symbol ? field : field.args[1] for field in args]
    quote
        struct $(esc(name)) <: Predicate
            $(map(esc, args)...)
        end
        
        # params(p::$(esc(name))) = tuple($([:(p.$arg_name) for arg_name in arg_names]...)) #tuple((p.$(esc(arg_name)) for arg_name in arg_names)...)
    end
end

@generated function params(p::P) where P <: Predicate
    fields = fieldnames(P)
    :(
        tuple($([:(p.$name) for name in fields]...))
    )
end

macro var(decl)
    name, type = decl isa Symbol ? (decl, Any) : decl.args
    quote
        $(esc(name)) = Var{$type}($(string(name)))
    end
end

nameof(::T) where T<:Predicate  = Symbol(T)

abstract type Result end

struct Success<:Result
    substitutions::Dict{Var, Any}
end

Success() = Success(Dict{Var, Any}())

Base.:(==)(s1::Success, s2::Success) = s1.substitutions == s2.substitutions

struct Failure<:Result
    val1
    val2
end

unify(v::Var{T}, x::Variable{T}) where T = Success(Dict(v => x))
unify(x::T, v::Var{T}) where T = unify(v, x)

unify(p1::P, p2::P) where P<:Predicate = intersection(unify(p1, p2) for (p1, p2) in zip(params(p1), params(p2)))

# fallback
unify(x, y) = x == y ? Success() : Failure(x, y)

intersection(unifications) = reduce(intersection, unifications)
function intersection(unification1::Success, unification2::Success)
    u1, u2 = unification1.substitutions, unification2.substitutions
    merge_dict = Dict()
    common_vars = intersect(keys(u1), keys(u2))
    for var in common_vars
        v1, v2 = u1[var], u2[var]
        v, possible = unionof(v1, v2)
        !possible && return Failure(v1, v2)
        merge_dict[var] = v
    end
    Success(merge(u1, u2, merge_dict))
end
intersection(u1::Failure, u2) = u1
intersection(u1, u2::Failure) = u2

unionof(v1::Var{T}, v2::Variable{T}) where T = v2, true
unionof(v1::T, v2::Var{T}) where T = v1, true
unionof(v1, v2) = v1 == v2 ? (v1, true) : (nothing, false)

end