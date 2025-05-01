Distinguishing between syntax and semantics is useful for at least two reasons.
First, different programming languages often provide features with very similar
semantics but very different syntax. It is generally much easier to learn a new lan-
guage if one is able to identify the common (and presumably familiar) semantic
ideas beneath the unfamiliar syntax. Second, there are some very efficient and
elegant algorithms that a compiler or interpreter can use to discover the syntactic
structure (but not the semantics!) of a computer program, and these algorithms
can be used to drive the rest of the compilation or interpretation process

formal” languages are  regular or context-free or programming languages. A formal language is just a set of strings, with no accompanying semantics




character(alphabets)

Tokens(words) are the basic building blocks of programs—the shortest strings of characters with individual meaning. Tokens come in many kinds, including keywords, identifiers, symbols, and constants of various types


tokens can be constructed from individual characters using just three kinds of formal rules: concatenation, alternation (choice among a finite set of alternatives), and so-called “Kleene closure”, recursion.


“token” informally to refer to both the generic kind (an identifier, the increment
operator) and the specific string (foo, ++); the distinction between these should
be clear from context


To specify tokens, we use the notation of regular expressions(sentence)


Most modern languages
are also more or less free format, meaning that a program is simply a sequence of
tokens: what matters is their order with respect to one another, not their physical
position within a printed line or page. “White space” (blanks, tabs, carriage re-
turns, and line and page feed characters) between tokens is usually ignored, except
to the extent that it is needed to separate one token from the next.

Each of the rules in a context-free grammar is known as a production. The
symbols on the left-hand sides of the productions are known as variables, or non-
terminals, terminals.

scanning(seeing contents or outline) and praser(reading line to line )



Together, the scanner and parser for a programming language are responsible for discovering the syntactic structure of a program

By grouping input characters into tokens, the scanner dramatically reduces the number of individual items that must be inspected by the more computationally intensive parser.

however, it is usually preferable to build a scanner in a more structured way, as an explicit representation of a finite automaton. Finite automata can be generated automatically from a set of regular expressions, making it easy to regenerate a
scanner when token definitions change.


White space (blanks, tabs, newlines, comments) is generally ignored, except to
the extent that it separates tokens (e.g., foo bar is different from foobar).

Fine automata represents state like group of scenes in a story(algorithm).


Automa is definitive automata (DFA) and non-definitive automata(NFA)


![[SmartSelect_20240702_123912_Drive.jpg]]


From an NFA to a DFA


Some languages and language implementations allow a program to contain constructs called pragmas that provide directives or hints to the compiler. Pragmas that do not change program semantics—only the compilation process—are sometimes called significant comments


The parser is the heart of a typical compiler. It calls the scanner to obtain the
tokens of the input program, assembles the tokens together into a syntax tree,
and passes the tree (perhaps one subroutine at a time) to the later phases of the
compiler, which perform semantic analysis and code generation and improve-
ment.

 A parser is a language recognizer. It can be shown
that for any CFG we can create a parser that runs in O(n3) time, where n is the
length of the input program.12 There are two well-known parsing algorithms that
achieve this bound: Earley’s algorithm [Ear70] and the Cocke-Younger-Kasami
(CYK) algorithm [Kas65, You67]. Cubic time is much too slow for parsing siz-
able programs, but fortunately not all grammars require such a general and slow
parsing algorithm. There are large classes of grammars for which we can build
parsers that run in linear time. The two most important of these classes are called
LL and LR (Figure 2.13).


Grammar

Names, module,scopes environment,binding timings and allocation

languages such as Fortran, Algol, and Lisp were termed “high level” because their syntax and semantics were significantly more abstract—farther from the hardware(Emprical)