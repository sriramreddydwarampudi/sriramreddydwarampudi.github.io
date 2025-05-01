# Equivalence Relations
A relation R on a set A is called an equivalence relation if it satisfies following three properties:

Relation R is Reflexive, i.e. aRa ∀ a∈A.
Relation R is Symmetric, i.e., aRb ⟹ bRa
Relation R is transitive, i.e., aRb and bRc ⟹ aRc.




Example: Let A = {1, 2, 3, 4} and R = {(1, 1), (1, 3), (2, 2), (2, 4), (3, 1), (3, 3), (4, 2), (4, 4)}.

Show that R is an Equivalence Relation.

Solution:

Reflexive: Relation R is reflexive as (1, 1), (2, 2), (3, 3) and (4, 4) ∈ R.

Symmetric: Relation R is symmetric because whenever (a, b) ∈ R, (b, a) also belongs to R.

Example: (2, 4) ∈ R ⟹ (4, 2) ∈ R.

Transitive: Relation R is transitive because whenever (a, b) and (b, c) belongs to R, (a, c) also belongs to R.

Example: (3, 1) ∈ R and (1, 3) ∈ R ⟹ (3, 3) ∈ R.

So, as R is reflexive, symmetric and transitive, hence, R is an Equivalence Relation.



Inverse Relation
Let R be any relation from set A to set B. The inverse of R denoted by R-1 is the relations from B to A which consist of those ordered pairs which when reversed belong to R that is:

R-1 = {(b, a): (a, b) ∈ R}
Example1: A = {1, 2, 3}
                   B = {x, y, z}

Solution: R = {(1, y), (1, z), (3, y)
               R-1 = {(y, 1), (z, 1), (y, 3)}
                  Clearly (R-1)-1 = R

Note1: Domain and Range of R-1 is equal to range and domain of R.
Example2: R = {(1, 1), (2, 2), (3, 3), (1, 2), (2, 3), (3, 2)}
                R-1 = {(1, 1), (2, 2), (3, 3), (2, 1), (3, 2), (2, 3)}

Note2: If R is an Equivalence Relation then R-1 is always an Equivalence Relation.
Example: Let A = {1, 2, 3}
                    R = {(1, 1), (2, 2), (3, 3), (1, 2), (2, 1)}
                    R-1 = {(1, 1), (2, 2), (3, 3), (2, 1), (1, 2)}
                    R-1 is a Equivalence Relation.

Note3: If R is a Symmetric Relation then R-1=R and vice-versa.
Example: Let A = {1, 2, 3}
                    R = {(1, 1), (2, 2), (1, 2), (2, 1), (2, 3), (3, 2)}
                    R-1 = {(1, 1), (2, 2), (2, 1), (1, 2), (3, 2), (2, 3)}

Note4: Reverse Order of Law
     (SOT)-1 = T-1 or S-1
     (ROSOT)-1 = T-1 or S-1 or R-1.


# Partial Order Relations
A relation R on a set A is called a partial order relation if it satisfies the following three properties:

Relation R is Reflexive, i.e. aRa ∀ a∈A.
Relation R is Antisymmetric, i.e., aRb and bRa ⟹ a = b.
Relation R is transitive, i.e., aRb and bRc ⟹ aRc.
Example1: Show whether the relation (x, y) ∈ R, if, x ≥ y defined on the set of +ve integers is a partial order relation.

Solution: Consider the set A = {1, 2, 3, 4} containing four +ve integers. Find the relation for this set such as R = {(2, 1), (3, 1), (3, 2), (4, 1), (4, 2), (4, 3), (1, 1), (2, 2), (3, 3), (4, 4)}.

Reflexive: The relation is reflexive as for every a ∈ A. (a, a) ∈ R, i.e. (1, 1), (2, 2), (3, 3), (4, 4) ∈ R.

Antisymmetric: The relation is antisymmetric as whenever (a, b) and (b, a) ∈ R, we have a = b.

Transitive: The relation is transitive as whenever (a, b) and (b, c) ∈ R, we have (a, c) ∈ R.

Example: (4, 2) ∈ R and (2, 1) ∈ R, implies (4, 1) ∈ R.

As the relation is reflexive, antisymmetric and transitive. Hence, it is a partial order relation.

Example2: Show that the relation 'Divides' defined on N is a partial order relation.

Solution:

Reflexive: We have a divides a, ∀ a∈N. Therefore, relation 'Divides' is reflexive.

Antisymmetric: Let a, b, c ∈N, such that a divides b. It implies b divides a iff a = b. So, the relation is antisymmetric.

Transitive: Let a, b, c ∈N, such that a divides b and b divides c.

Then a divides c. Hence the relation is transitive. Thus, the relation being reflexive, antisymmetric and transitive, the relation 'divides' is a partial order relation.

Example3: (a) The relation ⊆ of a set of inclusion is a partial ordering or any collection of sets since set inclusion has three desired properties:

A ⊆ A for any set A.
If A ⊆ B and B ⊆ A then B = A.
If A ⊆ B and B ⊆ C then A ⊆ C
(b) The relation ≤ on the set R of real no that is Reflexive, Antisymmetric and transitive.

(c) Relation ≤ is a Partial Order Relation.

n-Ary Relations
By an n-ary relation, we mean a set of ordered n-tuples. For any set S, a subset of the product set Sn is called an n-ary relation on S. In particular, a subset of S3 is called a ternary relation on S.

Partial Order Set (POSET):
The set A together with a partial order relation R on the set A and is denoted by (A, R) is called a partial orders set or POSET.

Total Order Relation
Consider the relation R on the set A. If it is also called the case that for all, a, b ∈ A, we have either (a, b) ∈ R or (b, a) ∈ R or a = b, then the relation R is known total order relation on set A.

Example: Show that the relation '<' (less than) defined on N, the set of +ve integers is neither an equivalence relation nor partially ordered relation but is a total order relation.

Solution:

Reflexive: Let a ∈ N, then a < a
⟹ '<' is not reflexive.

As, the relation '<' (less than) is not reflexive, it is neither an equivalence relation nor the partial order relation.

But, as ∀ a, b ∈ N, we have either a < b or b < a or a = b. So, the relation is a total order relation.

Equivalence Class
Consider, an equivalence relation R on a set A. The equivalence class of an element a ∈ A, is the set of elements of A to which element a is related. It is denoted by [a].

Example: Let R be an equivalence relations on the set A = {4, 5, 6, 7} defined by
                  R = {(4, 4), (5, 5), (6, 6), (7, 7), (4, 6), (6, 4)}.

Determine its equivalence classes.

Solution: The equivalence classes are as follows:
                    {4} = {6} = {4, 6}
                    {5} = {5}
                    {7} = {7}.

Circular Relation
Consider a binary relation R on a set A. Relation R is called circular if (a, b) ∈ R and (b, c) ∈ R implies (c, a) ∈ R.

Example: Consider R is an equivalence relation. Show that R is reflexive and circular.

Solution: Reflexive: As, the relation, R is an equivalence relation. So, reflexivity is the property of an equivalence relation. Hence, R is reflexive.

Circular: Let (a, b) ∈ R and (b, c) ∈ R
                  ⇒ (a, c) ∈ R       (∵ R is transitive)
                  ⇒ (c, a) ∈ R       (∵ R is symmetric)

Thus, R is Circular.

Compatible Relation
A binary relation R on a set A that is Reflexive and symmetric is called Compatible Relation.

Every Equivalence Relation is compatible, but every compatible relation need not be an equivalence.

Example: Set of a friend is compatible but may not be an equivalence relation.

Friend       Friend
a → b,       b → c     but possible that a and c are not friends.



