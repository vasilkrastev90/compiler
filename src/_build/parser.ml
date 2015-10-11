
type token = 
  | STRING
  | PLUS
  | OPEN_BRACKET
  | OPEN_BRACE
  | MULTIPLY
  | MINUS
  | MAIN
  | LINE_BREAK
  | INT of (
# 5 "parser.mly"
       (int)
# 15 "parser.ml"
)
  | EOF
  | DIVIDE
  | CLOSE_BRACKET
  | CLOSE_BRACE

let menhir_begin_marker =
  0

and (xv_prog, xv_body) =
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_startofs : int) (_endofs : int) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (e : 'tv_body) (_startpos_e_ : Lexing.position) (_endpos_e_ : Lexing.position) (_startofs_e_ : int) (_endofs_e_ : int) ->
    (
# 32 "parser.mly"
                        ( e )
# 30 "parser.ml"
     : (
# 24 "parser.mly"
       (Syntax.expr list)
# 34 "parser.ml"
    )) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_startofs : int) (_endofs : int) (_7 : unit) (_startpos__7_ : Lexing.position) (_endpos__7_ : Lexing.position) (_startofs__7_ : int) (_endofs__7_ : int) (_6 : unit) (_startpos__6_ : Lexing.position) (_endpos__6_ : Lexing.position) (_startofs__6_ : int) (_endofs__6_ : int) (_5 : unit) (_startpos__5_ : Lexing.position) (_endpos__5_ : Lexing.position) (_startofs__5_ : int) (_endofs__5_ : int) (e : 'tv_body) (_startpos_e_ : Lexing.position) (_endpos_e_ : Lexing.position) (_startofs_e_ : int) (_endofs_e_ : int) (_3 : unit) (_startpos__3_ : Lexing.position) (_endpos__3_ : Lexing.position) (_startofs__3_ : int) (_endofs__3_ : int) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) ->
    (
# 31 "parser.mly"
                                                                        ( e )
# 40 "parser.ml"
     : (
# 24 "parser.mly"
       (Syntax.expr list)
# 44 "parser.ml"
    )) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_startofs : int) (_endofs : int) (_6 : unit) (_startpos__6_ : Lexing.position) (_endpos__6_ : Lexing.position) (_startofs__6_ : int) (_endofs__6_ : int) (_5 : unit) (_startpos__5_ : Lexing.position) (_endpos__5_ : Lexing.position) (_startofs__5_ : int) (_endofs__5_ : int) (_4 : unit) (_startpos__4_ : Lexing.position) (_endpos__4_ : Lexing.position) (_startofs__4_ : int) (_endofs__4_ : int) (e : 'tv_body) (_startpos_e_ : Lexing.position) (_endpos_e_ : Lexing.position) (_startofs_e_ : int) (_endofs_e_ : int) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) ->
    (
# 30 "parser.mly"
                                                             ( e )
# 50 "parser.ml"
     : (
# 24 "parser.mly"
       (Syntax.expr list)
# 54 "parser.ml"
    )) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_startofs : int) (_endofs : int) (_5 : unit) (_startpos__5_ : Lexing.position) (_endpos__5_ : Lexing.position) (_startofs__5_ : int) (_endofs__5_ : int) (_4 : unit) (_startpos__4_ : Lexing.position) (_endpos__4_ : Lexing.position) (_startofs__4_ : int) (_endofs__4_ : int) (e : 'tv_body) (_startpos_e_ : Lexing.position) (_endpos_e_ : Lexing.position) (_startofs_e_ : int) (_endofs_e_ : int) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) ->
    (
# 29 "parser.mly"
                                                   ( e )
# 60 "parser.ml"
     : (
# 24 "parser.mly"
       (Syntax.expr list)
# 64 "parser.ml"
    )) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_startofs : int) (_endofs : int) (s : unit) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) ->
    (
# 36 "parser.mly"
                      ( s )
# 70 "parser.ml"
     : 'tv_body) in
  (raise Not_found : (
# 24 "parser.mly"
       (Syntax.expr list)
# 75 "parser.ml"
  ) * 'tv_body)

and menhir_end_marker =
  0

# 220 "/home/user/.opam/system/lib/menhir/standard.mly"
  


# 85 "parser.ml"
