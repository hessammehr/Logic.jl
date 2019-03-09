assert!(db::Database, clause::Clause) = push!(db, clause)
assert!(db::Database, clauses::AbstractArray{Clause}) = foreach(clause -> assert!(db, clause), clauses)

retract!(db::Database, clause::Clause) = filter!(c -> clause != c, db)
retract!(db::Database, clauses::AbstractArray{Clause}) = foreach(clause -> retract!(db, clause))

function query(db::Database, head::Predicate)
end

function query(db::Database, head::Conj)
end

function query(db::Database, head::Disj)
    Iterators.flatten(query(db, goal) for goal in head)
end
