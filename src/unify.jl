unify(term, c::Conj) = intersection(Iterators.flatten(unify(term, with) for with in c))

unify(c::Conj, with) = intersection(Iterators.flatten(unify(term, with) for term in c))

unify(term, d::Disj) = Disj(Iterators.flatten(unify(term, with) for with in d))

unify(d::Disj, with) = Disj(Iterators.flatten(unify(term, with) for term in d))

unify(v::Var, with) = [(v => with)]

function unify(pred::P, with_pred::P) where P <: Predicate 
    unifications = (unify(term, with_term) for (term, with_term in zip(pred, with_pred)))
    intersection(Interators.flatten(unifications))
end

# fallback
unify(term, with) = []
