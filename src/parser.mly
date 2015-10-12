(* main parser *)
(*
%token MAIN
*)

%token <int> INT
%token <string> STRING

%token COMMA
(*
%token OPEN_BRACE
%token CLOSE_BRACE *)
(*
%token <string> VARID *)

%token OPEN_BRACKET
%token CLOSE_BRACKET
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY

%token EOF

%left PLUS MINUS
%left DIVIDE MULTIPLY

(* edit this later *)
%start <Syntax.expr list> prog
%%

prog:
	| f = func; EOF;				{ f }

func:
	| c = code;					{ c }

code:
	| exprs = separated_list(COMMA, expr);		{ exprs }

expr:
	| v = value;					{ Syntax.Value v }

value:
	| s = STRING					{ Syntax.String s }
	| m = mth;					{ Syntax.Int m }	

mth:
	| i = INT;					{ i }
	| OPEN_BRACKET; e = mth; CLOSE_BRACKET;		{ ( e ) }
	| e = mth; PLUS; f = mth;			{ e + f }
	| e = mth; MINUS; f = mth;			{ e - f }
	| e = mth; DIVIDE; f = mth;			{ e / f }
	| e = mth; MULTIPLY; f = mth;			{ e * f }




(* REDO!
prog:
	| MAIN; OPEN_BRACE; e = body; CLOSE_BRACE; EOF				{ e }
	| MAIN; OPEN_BRACE; e = body; CLOSE_BRACE; LINE_BREAK; EOF		{ e }
	| MAIN; OPEN_BRACE; LINE_BREAK; e = body; CLOSE_BRACE; LINE_BREAK; EOF	{ e }
	| e = body; EOF								{ e }

body:
	| el = separated_list(LINE_BREAK, mth);					{ el }

mth:
	| i = INT								{ i }
	| OPEN_BRACKET; e = mth; CLOSE_BRACKET					{ ( e ) }
	| e = mth; PLUS; f = mth;						{ e + f }
	| e = mth; MINUS; f = mth;						{ e - f }
	| e = mth; DIVIDE; f = mth;						{ e / f }
	| e = mth; MULTIPLY; f = mth;						{ e * f }
*)
