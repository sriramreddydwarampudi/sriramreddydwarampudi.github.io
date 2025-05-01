Informally, syntax concerns the form of a valid program, while semantics concerns its meaning. Meaning is important for at least two reasons: it allows us to enforce rules (e.g., type consistency) that go beyond mere form, and it provides the information we need in order to generate an equivalent output program.



It is conventional to say that the syntax of a language is precisely that portion of the language definition that can be described conveniently by a context-free
grammar, while the semantics is that portion of the definition that cannot.



Semantic rules are further divided into static and dynamic semantics
This division is fuzzy.


The compiler enforces static semantic rules at compile time. It generates code to enforce dynamic semantic rules at run time.

Both semantic analysis and intermediate code generation can be described in
terms of annotation, or decoration of a parse tree or syntax tree. The annotations
themselves are known as attributes.

Attribute grammars provide a formal framework for the decoration of a tree.then attribute flow.


Programming languages vary dramatically in their choice of semantic rules.

The role of the semantic analyzer is to enforce all static
semantic rules and to annotate the program with information needed by the in-
termediate code generator(mind).

Ada, assigns a specific type to every numeric variable, and requires the programmer to convert among these explicitly when combining them in expressions.

C requires no checks at all, beyond those that come “free” with the hardware (e.g., division by zero, or attempted access to memory outside the bounds of the program). 

Java takes great pains to check as many rules as possible, in part to ensure that
an untrusted program cannot do anything to damage the memory or files of the
machine on which it runs.




In the typical compiler, analysis and intermediate code generation mark the
end of front end computation. The exact division of labor between the front end
and the back end, however, may vary from compiler to compiler: it can be hard
to say exactly where analysis (figuring out what the program means) ends and
synthesis (expressing that meaning in some new form) begins (and as noted in
Section 1.6 there may be a “middle end” in between). Many compilers also carry
a program through more than one intermediate form.


the semantic analyzer creates
an annotated syntax tree, which the intermediate code generator then translates
into a linear form reminiscent of the assembly language for some idealized ma-
chine. After machine-independent code improvement, this linear form is then
translated into yet another form, patterned more closely on the assembly lan-
guage of the target machine. That form may undergo machine-specific code
improvement.
Compilers also vary in the extent to which semantic analysis and intermedi-
ate code generation are interleaved with parsing. With fully separated phases, the
parser passes a full parse tree on to the semantic analyzer, which converts it to
a syntax tree, fills in the symbol table, performs semantic checks, and passes it
on to the code generator. With fully interleaved phases, there may be no need
to build either the parse tree or the syntax tree in its entirety: the parser can call
semantic check and code generation routines on the fly as it parses each expres-
sion, statement, or subroutine of the source. We will focus on an organization in
which construction of the syntax tree is interleaved with parsing (and the parse
tree is not built), but semantic analysis occurs during a separate traversal of the
syntax tree

Many compilers that generate code for dynamic checks provide the option of dis-
abling them if desired. It is customary in some organizations to enable dynamic
checks during program development and testing, and then disable them for pro-
duction use, to increase execution speed. 