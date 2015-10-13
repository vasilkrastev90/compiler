(* AST Types for code *)
type val_it =
	| Int of int
	| String of string
	
and ident =
	| Ident of string

and expr =
	| Value of val_it
	| Identif of ident
	| Assign of (ident * expr)

(*
and var_lst =
	| Vars of Assign list
*)

(* Print functions *)
open Core.Std

let print_ident = function
	| Ident i -> printf "%s" i

let rec print_expr = function
	| Value v -> begin match v with
		| Int i -> printf "%d" i
		| String s -> printf "\"%s\"" s
	end

	| Identif i -> begin match i with
		| Ident i -> printf "%s" i
	end

	| Assign (a, b) -> print_ident a; print_char '='; print_expr b

let rec print_prog = function
	| [] -> ()
	| expr :: prog -> print_expr expr; print_newline (); print_prog prog;
