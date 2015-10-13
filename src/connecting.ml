(* Sticks everything together *)

open Core.Std
open Lexing
open Lexer

let print_pos out lexbuf =
	let pos = lexbuf.lex_curr_p in
	fprintf out "%s:%d:%d" pos.pos_fname
	 pos.pos_lnum (pos.pos_cnum - pos.pos_bol +1)

let parse_error lexbuf = 
	try Parser.prog Lexer.main lexbuf with
	| SyntaxError msg -> fprintf stderr "%a: %s\n" print_pos lexbuf msg; exit(-1)
	| Parser.Error -> fprintf stderr "%a: Syntax Error\n" print_pos lexbuf; exit(-1)

let rec parse_print lexbuf = (* Add error handling to here *)
	match parse_error lexbuf with
	| [] -> (); exit(0)	(* change at some point *)
	| x -> Syntax.print_prog x; parse_print lexbuf

let read filename () =
	let fileIn = In_channel.create filename in
	let lexbuf = Lexing.from_channel fileIn in
	lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
	parse_print lexbuf;
	In_channel.close fileIn

let () =
	Command.basic ~summary:"Parse and display custom language"
	 Command.Spec.(empty +> anon ("Filename" %: file))
	 read
	|> Command.run
