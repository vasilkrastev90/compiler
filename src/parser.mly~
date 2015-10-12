(* main parser *)

%token MAIN

%token LINE_BREAK

%token <int> INT
%token <string> STRING
%token <string> VARID

%token OPEN_BRACE
%token CLOSE_BRACE
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
	| EOF;						{ [] }
	| MAIN; c = code; EOF;				{ c }

code:
	| ls = separated_list(LINE_BREAK, value);	{ ls }

value:
	| i = INT;					{ Syntax.Value(Syntax.Int i) }



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
