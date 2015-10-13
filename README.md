Compiler code for the 3rd year compilers module at UoB

## Compiler Code

The compiler consists of four major parts:
* Syntax.ml - Contains the ast types and syntax for the compiler
* lexer.mll - Breaks the language down into set tokens
* parser.mly - Contains all of the currently accepted tokens and applies the types and assignments
* connecting.ml - Contains the main function, must be compiled to use

## Compiling

Right now the only required files are the files above

You will also require:
* ocamlbuild
* ocamlfind
* ocaml core package
* menhir

To compile the code, as there is currently no make file, run from the terminal

ocamlbuild -use-menhir -use-ocamlfind -r -pkg core -tags thread connecting.native

## Usage

Currently the native file will only accept files of input as an argument in the command line

e.g. connecting.native *Filename.extension*

## Language Syntax

Valid input consists of:

* Integers and all integer maths
* Strings of the form "string"
* Assignments: var = accepted type
* Lists of these inputs separated by ,
