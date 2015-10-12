(* AST Types for code *)
type val_it =
	| Int of int
	| String of string

and expr =
	| Value of val_it

(* Print functions *)
open Core.Std

let rec print_expr out = function
	| [] -> ()
	| (Value v)::xs -> begin match v with
		| Int i -> printf "%d" i
		| String s -> printf "\"%s\"" s
	end
