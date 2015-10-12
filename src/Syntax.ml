(* AST Types for code *)
type val_it =
	| Int of int
	| String of string

and expr =
	| Value of val_it

(* Print functions *)
open Core.Std

let rec print_expr = function
	| Value v -> begin match v with
		| Int i -> printf "%d" i
		| String s -> printf "\"%s\"" s
	end

let rec print_prog = function
	| [] -> ()
	| expr :: prog -> print_expr expr; print_newline (); print_prog prog;
