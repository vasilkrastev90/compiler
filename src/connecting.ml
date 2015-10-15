(* Sticks everything together *)

open Core.Std
open Lexing
open Lexer

let rec print_to_arrow store =
	match store with
	| 0 -> printf "^\n"
	| n -> print_string " "; print_to_arrow (n-1)

let print_err_line lno fileIn =
	(*print_endline(lexbuf.lex_buffer, lno)*)
(*	let err = In_channel.create lexbuf.lex_buffer in *)
	In_channel.seek fileIn (Int64.of_int lno); 
	match In_channel.input_line ?fix_win_eol:(Some true) fileIn with
		| Some line -> print_endline(line)
		| None -> ()

let print_pos out lexbuf =
	let pos = lexbuf.lex_curr_p in
	fprintf out "%s:%d:%d" pos.pos_fname
(* Print out current error item being lexed *)
	 pos.pos_lnum (pos.pos_cnum - pos.pos_bol +1); print_to_arrow (pos.pos_cnum - pos.pos_bol-1)

(* printf "%s" (lexbuf.lex_buffer)*)

let parse_error lexbuf fileIn = 
	try Parser.prog Lexer.main lexbuf with
	| SyntaxError msg -> print_err_line (lexbuf.lex_curr_p.pos_bol) fileIn; fprintf stderr  "%a: %s\n" print_pos lexbuf msg; exit(-1)
	| Parser.Error -> fprintf stderr "%a: Syntax Error\n" print_pos lexbuf; exit(-1)

let rec parse_print lexbuf fileIn = (* Add error handling to here *)
	match parse_error lexbuf fileIn with
	| [] -> (); exit(0)	(* change at some point *)
	| x -> Syntax.print_prog x; parse_print lexbuf fileIn

let read filename () =
	let fileIn = In_channel.create filename in
	let lexbuf = Lexing.from_channel fileIn in
	lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
	parse_print lexbuf fileIn;
	In_channel.close fileIn

let () =
	Command.basic ~summary:"Parse and display custom language"
	 Command.Spec.(empty +> anon ("Filename" %: file))
	 read
	|> Command.run
