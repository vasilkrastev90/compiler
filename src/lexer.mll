(* main lexer *)

{
	open Parser
	open Lexing
	exception SyntaxError of string
	
	let next_line lexbuf =
	let pos = lexbuf.lex_curr_p in
		lexbuf.lex_curr_p <- 
		{ pos with pos_bol = lexbuf.lex_curr_pos; pos_lnum = pos.pos_lnum + 1 }	

}

let int = ['0'-'9']+
(* Add in more chars for strings *)
let varid = ['a'-'z' 'A'-'Z']+
let white = [' ' '\t']+
let newline = '\n' | "\r\n"

rule main =
	parse
	| white		{ main lexbuf }
	| newline	{ main lexbuf }

	| ','		{ COMMA }

	| '+' 		{ PLUS }
	| '-' 		{ MINUS }
	| '/' 		{ DIVIDE }
	| '*' 		{ MULTIPLY }
	| '='		{ ASSIGN }

	| int 		{ INT (int_of_string (Lexing.lexeme lexbuf)) }
	| '"'		{ read_str (Buffer.create 6) lexbuf }
	| varid		{ VARID (Lexing.lexeme lexbuf) }

	| _ 		{ raise (SyntaxError ("Deal with it: " ^ Lexing.lexeme lexbuf)) }

	| eof		{ EOF }

(*
	| '{'		{ OPEN_BRACE }
	| '}' 		{ CLOSE_BRACE }

*)


(*
	| "main" 	{ main lexbuf (*MAIN*) }
	| '(' 		{ OPEN_BRACKET }
	| ')' 		{ CLOSE_BRACKET }
*)

and read_str buf =
	parse
	| '"'		{ STRING (Buffer.contents buf) }
	| [^ '"' ]+	{ Buffer.add_string buf (Lexing.lexeme lexbuf); read_str buf lexbuf }

	| _ 		{ raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }

	| eof		{ raise (SyntaxError ("Expected '\"' Found End of File ")) }
