
Machine language 
Assembler
Compiler 
Interpreter



The first electronic computers were monstrous contraptions, filling several rooms, consuming as much electricity as a good-size factory, and costing millions of1940s dollars (but withmuch less computing power than even the simplest modern cell phone). The programmers who used these machines believed that the computer’s time was more valuable than theirs. They programmed in machine language. Machine language is the sequence ofbits that directly controls a processor, causing it to add, compare, move data from one place to another, and so forth at appropriate times. Specifying programs at this level of detail is an enormously tedious task. The following program calculates the greatest common
divisor (GCD) of two integers, using Euclid’s algorithm. It is written in machine language, expressed here as hexadecimal (base 16) numbers, for the x86 instruction set.

As people began to write larger programs, it quickly became apparent that a less error-prone notation was required.This notation is usually menomic abbrevations.

Translating from mnemonics to machine language became the job of a systems program known as an assembler


Assemblers were eventually elaborate “macro expansion” facilities to permit programmers to define parameterized abbreviations for common sequences of instructions i.e rather than one command menomic ,all menomics together in sequence in one command as a file.

As computers evolved, and as competing designs developed, it became increasingly frustrating to have to rewrite programs for every new machine.


People began to wish for a machine independent language, particularly one in which numerical computations (the most common type of program in those days) could be expressed in something more closely resembling mathematical formulae(present days).


Translating from a high-level language to assembly or machine language is the job of a systems program known as a compiler.


*****
 Compliers was slow to catch on at first, because human programmers with some effort, could almost always write assembly language programs that would run faster than what a compiler could produce.

Over time, however, the performance gap has narrowed, and eventually reversed. Increases in hardware complexity (due to pipelining, multiple functional units, etc.) and continuing improvements in compiler technology have led to a situation in which a state-of-the-art compiler will usually generate better code than a human being will.


Even in cases in which human beings can do better, increases in computer speed and program size have made it increasingly important to complier.


Architecture=>machine language(binary code)=>assembly language(low level language)=>compiler(high level language/source code)




Assembler = 
Complier = c,c++
Interpreter= works in it's logic without need to go into binary code
Python, Perl, JavaScript, Ruby.



platform independent language
Bytecode=> Interpreter




## Programming spectrum 

Based on use
The top-level division 
- declarative languages, in which the focus is on what the computer is to do.
- imperative languages, in which the focus is on how the computer should do it.

Imperative – code directly controls execution flow and state change
- procedural – organized as procedures that call each other
- object-oriented – organized as objects that contain both data structure and associated behavior

Declarative – code declares properties of the desired result, but not how to compute it
- functional – a desired result is declared as the value of a series of function evaluations
- logic – a desired result is declared as the answer to a question about a system of facts and rules
- reactive – a desired result is declared with data streams and the propagation of change






[List of programming language](Programming%20spectrum)

https://en.m.wikipedia.org/wiki/Programming_language

********
Why we use computer is productive

I.e to Solve a problem



Functional languages employ a computational model based on the recursive definition of functions. They take their inspiration from the lambda calculus, a formal computational model developed by Alonzo Church in the 1930s. In essence, a program is considered a function from inputs to outputs, defined in terms of simpler functions through a process of refinement. Languages in this category include Lisp, ML, and Haskell. 


Dataflow languages model computation as the flow of information (tokens) among primitive functional nodes. They provide an inherently parallel model: nodes are triggered by the arrival of input tokens, and can operate concurrently. Id and Val are examples of dataflow languages. Sisal, a descendant of Val, is more often described as a functional language.


Logic or constraint-based languages take their inspiration from predicate logic. They model computation as an attempt to find values that satisfy certain specified relationships, using goal-directed search through a list of logical rules. Prolog is the best-known logic language. The term is also sometimes applied to the SQL database language, the XSLT scripting language, and programmable aspects of spreadsheets such as Excel and its predecessors. 


von Neumann languages are probably the most familiar and widely used. They include Fortran, Ada, C, and all of the others in which the basic means of computation is the modification of variables.7 Whereas functional languages are based on expressions that have values, von Neumann languages are based on statements (assignments in particular) that influence subsequent computation via the side effect ofchanging the value ofmemory. 


Object-oriented languages trace their roots to Simula 67. Most are closely related to the von Neumann languages, but have a much more structured and distributed model of both memory and computation. Rather than picture computation as the operation of a monolithic processor on a monolithic memory, object-oriented languages picture it as interactions among semiindependent objects, each of which has both its own internal state and subroutines to manage that state. Smalltalk is the purest of the object-oriented languages; C++ and Java are probably the most widely used. It is also possible to devise object-oriented functional languages (the best known ofthese are CLOS  and OCaml, but they tend to have a strong imperative flavor. 


Scripting languages are distinguished by their emphasis on coordinating or
“gluing together” components drawn from some surrounding context. Several scripting languages were originally developed for specific purposes: csh and bash are the input languages of job control (shell) programs; PHP and JavaScript are primarily intended for the generation of dynamic web content; Lua is widely used to control computer games. Other languages, including Perl, Python, and Ruby, are more deliberately general purpose. Most place an emphasis on rapid prototyping, with a bias toward ease of expression over speed of execution.


Problem = algorithm= language 


EXAMPLE
As a simple example of the contrast among language families, consider the  
greatest common divisor (GCD) problem .


The choice among, say, von Neumann, functional, or logic programming for this problem influences not only the appearance of the code, but how the programmer thinks. 

```c
int gcd(int a, int b) { 
while (a!=b) {
if (a > b) a =a -b; else b = b - a;
}
return a;
} 
```




```OCaml
let rec gcd a b=
if a= b then a else if a>b then gcd b (a- b) else gcd a (b - a)
```


``` prolog
gcd(A,B,G) :- A = B, G = A.
gcd(A,B,G) :- A > B, C is A-B,gcd(C,B,G). 
gcd(A,B,G) :- B > A, C is B-A, gcd(C,A,G).
```



```logical

The gcd of a and b is defined to be 
(1) a when a and b are equal, 
(2) the gcd of b and a-b when a>b, 
(3) the gcd of a and b-a when b>a.

To compute the gcd of a given pair ofnumbers, expand and simplify this definition until it terminates

```


```english

To compute the gcd of a and b,check to see if a and b are equal. If so, print one of them and stop. Otherwise, replace the larger one by their difference and repeat.

```



A good knowledge of grammatical forms makes it easier to learn a foreign language.

## ENVIRONMENT 






Phases of compilation

Phases of Interpretion



Pure compilation
Pure interpretation
Mixing compilation and interpretation
Preprocessing
Library routines and linking
Post-compilation assembly
The C preprocessor
Source-to-source translation
Bootstrapping
Compiling interpreted
Dynamic and just-in-time compilation
Microcode (firmware)


