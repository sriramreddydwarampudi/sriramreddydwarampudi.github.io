# Binary relations 

Let P and Q be two non- empty sets. A binary relation R is defined to be a subset of P x Q from a set P to Q. If (a, b) ∈ R and R ⊆ P x Q then a is related to b by R i.e., aRb. If sets P and Q are equal, then we say R ⊆ P x P is a relation on P e.g.

(i) Let A = {a, b, c}  
      B = {r, s, t}  
Then R = {(a, r), (b, r), (b, t), (c, s)}  
is a relation from A to B.  
  
(ii) Let A = {1, 2, 3} and B = A  
         R = {(1, 1), (2, 2), (3, 3)}  
is a relation (equal) on A.  
Example1: If a set has n elements, how many relations are there from A to A.

Solution: If a set A has n elements, A x A has n2 elements. So, there are 2n2 relations from A to A.

Example2: If A has m elements and B has n elements. How many relations are there from A to B and vice versa?

Solution: There are m x n elements; hence there are 2m x n relations from A to A.

Example3: If a set A = {1, 2}. Determine all relations from A to A.

Solution: There are 22= 4 elements i.e., {(1, 2), (2, 1), (1, 1), (2, 2)} in A x A. So, there are 24= 16 relations from A to A. i.e.

 {(1, 2), (2, 1), (1, 1), (2, 2)}, {(1, 2), (2, 1)}, {(1, 2), (1, 1)}, {(1, 2), (2, 2)},  
{(2, 1), (1, 1)},{(2,1), (2, 2)}, {(1, 1),(2, 2)},{(1, 2), (2, 1), (1, 1)}, {(1, 2), (1, 1),  
(2, 2)}, {(2,1), (1, 1), (2, 2)}, {(1, 2), (2, 1), (2, 2)}, {(1, 2), (2, 1), (1, 1), (2, 2)} and ∅.  




# Composition Relations
Let A, B, and C be sets, and let R be a relation from A to B and let S be a relation from B to C. That is, R is a subset of A × B and S is a subset of B × C. Then R and S give rise to a relation from A to C indicated by R◦S and defined by:

a (R◦S)c if for some b ∈ B we have aRb and bSc.   
is,   
R ◦ S = {(a, c)| there exists b ∈ B for which (a, b) ∈ R and (b, c) ∈ S}   
The relation R◦S is known the composition of R and S; it is sometimes denoted simply by RS.

Let R is a relation on a set A, that is, R is a relation from a set A to itself. Then R◦R, the composition of R with itself, is always represented. Also, R◦R is sometimes denoted by R2. Similarly, R3 = R2◦R = R◦R◦R, and so on. Thus Rn is defined for all positive n.

Example1: Let X = {4, 5, 6}, Y = {a, b, c} and Z = {l, m, n}. Consider the relation R1 from X to Y and R2 from Y to Z.

R1 = {(4, a), (4, b), (5, c), (6, a), (6, c)}
R2 = {(a, l), (a, n), (b, l), (b, m), (c, l), (c, m), (c, n)}
Composition of Relations
Find the composition of relation (i) R1 o R2 (ii) R1o R1-1

Solution:

(i) The composition relation R1 o R2 as shown in fig:

Composition of Relations
R1 o R2 = {(4, l), (4, n), (4, m), (5, l), (5, m), (5, n), (6, l), (6, m), (6, n)}


(ii) The composition relation R1o R1-1 as shown in fig:

Composition of Relations
R1o R1-1 = {(4, 4), (5, 5), (5, 6), (6, 4), (6, 5), (4, 6), (6, 6)}

Composition of Relations and Matrices
There is another way of finding R◦S. Let MR and MS denote respectively the matrix representations of the relations R and S. Then

Example

Let P = {2, 3, 4, 5}. Consider the relation R and S on P defined by  
    R = {(2, 2), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5), (5, 3)}  
    S = {(2, 3), (2, 5), (3, 4), (3, 5), (4, 2), (4, 3), (4, 5), (5, 2), (5, 5)}.  
  
        Find the matrices of the above relations.  
Use matrices to find the following composition of the relation R and S.  
  (i)RoS       (ii)RoR       (iii)SoR  
Solution: The matrices of the relation R and S are a shown in fig:

Composition of Relations
(i) To obtain the composition of relation R and S. First multiply MR with MS to obtain the matrix MR x MS as shown in fig:

The non zero entries in the matrix MR x MS tells the elements related in RoS. So,

Composition of Relations
Hence the composition R o S of the relation R and S is

R o S = {(2, 2), (2, 3), (2, 4), (3, 2), (3, 3), (4, 2), (4, 5), (5, 2), (5, 3), (5, 4), (5, 5)}.  
(ii) First, multiply the matrix MR by itself, as shown in fig

Composition of Relations
Hence the composition R o R of the relation R and S is

R o R = {(2, 2), (3, 2), (3, 3), (3, 4), (4, 2), (4, 5), (5, 2), (5, 3), (5, 5)}  
(iii) Multiply the matrix MS with MR to obtain the matrix MS x MR as shown in fig:

Composition of Relations
The non-zero entries in matrix MS x MR tells the elements related in S o R.

Hence the composition S o R of the relation S and R is

S o R = {(2, 4) , (2, 5), (3, 3), (3, 4), (3, 5), (4, 2), (4, 4), (4, 5), (5, 2), (5, 3), (5, 4), (5, 5)}.  