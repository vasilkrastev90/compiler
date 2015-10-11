(* Sticks everything together *)
let rec read_file buf = 
	let code = read_line () in
	if code = "" then buf
	else (Buffer.add_string buf code; Buffer.add_string buf "\n"; read_file buf)

let () =
	read_file (Buffer.create 1)
	|> Buffer.contents
	|> Lexing.from_string
	|> Parser.prog Lexer.main
	|> List.map string_of_int
	|> String.concat ",\n"
	|> print_endline
