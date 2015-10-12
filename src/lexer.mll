(* main lexer *)

{
	open Parser
	exception SyntaxError of string
}

let int = ['0'-'9'] ['0'-'9']*
(* Add in more chars for strings *)
let string = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z']*
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


(*
	| '{'		{ OPEN_BRACE }
	| '}' 		{ CLOSE_BRACE }

*)


(*
	| "main" 	{ main lexbuf (*MAIN*) }
	| '(' 		{ OPEN_BRACKET }
	| ')' 		{ CLOSE_BRACKET }
*)
	| int 		{ INT (int_of_string (Lexing.lexeme lexbuf)) }
	| '"'		{ read_str (Buffer.create 6) lexbuf } 

	| _ 		{ raise (SyntaxError ("Deal with it: " ^ Lexing.lexeme lexbuf)) }

	| eof		{ EOF }

and read_str buf =
	parse
	| '"'		{ STRING (Buffer.contents buf) }
	| [^ '"' '\\']+	{ Buffer.add_string buf (Lexing.lexeme lexbuf); read_str buf lexbuf }

	| _ 		{ raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }

	| eof		{ raise (SyntaxError ("Expected '\"' Found End of File ")) }


(*
rule main =
	parse
	| white		{ main lexbuf }
	| newline	{ main lexbuf }
	| "main" 	{ MAIN }
	| '{'		{ parse_code lexbuf }
	
	| eof		{ EOF }

and parse_code =
	parse
	| white { parse_code lexbuf }
	| newline { LINE_BREAK }
	| int { INT (int_of_string (Lexing.lexeme lexbuf)) }
	| '}' { main lexbuf }
	| '(' { OPEN_BRACKET }
	| ')' { CLOSE_BRACKET }
	| '+' { PLUS }
	| '-' { MINUS }
	| '/' { DIVIDE }
	| '*' { MULTIPLY }

	| _ { raise (SyntaxError ("Deal with it: " ^ Lexing.lexeme lexbuf)) }
*)
