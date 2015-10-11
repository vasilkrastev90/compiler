(* main parser *)

%token MAIN
%token LINE_BREAK
%token <int> INT
%token OPEN_BRACE
%token CLOSE_BRACE
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY
%token STRING

%token EOF

%left PLUS
%left MINUS
%left DIVIDE
%left MULTIPLY

(* edit this later *)
%start <int list> prog
%%

(* can remove cases in time *)
prog:
	| MAIN; OPEN_BRACE; e = body; CLOSE_BRACE; EOF				{ e }
	| MAIN; OPEN_BRACE; e = body; CLOSE_BRACE; LINE_BREAK; EOF		{ e }
	| MAIN; OPEN_BRACE; LINE_BREAK; e = body; CLOSE_BRACE; LINE_BREAK; EOF	{ e }
	| e = body; EOF								{ e }

body:
	| el = separated_list(LINE_BREAK, mth);					{ el }
	| s = STRING;								{ e }	

mth:
	| i = INT								{ i }
	| OPEN_BRACKET; e = mth; CLOSE_BRACKET					{ ( e ) }
	| e = mth; PLUS; f = mth;						{ e + f }
	| e = mth; MINUS; f = mth;						{ e - f }
	| e = mth; DIVIDE; f = mth;						{ e / f }
	| e = mth; MULTIPLY; f = mth;						{ e * f }
