{
(* 補助的な変数、関数、型などの定義 *)
open Parser
}

(* 正規表現の略記 *)
let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let uppper = ['A'-'Z']
let alpha = lower | uppper

(* 字句解析の規則 *)
rule token = parse
| space+ { token lexbuf } (* スペースは読み飛ばす *)
| "(*" [^ '\n']* "\n" { token lexbuf } (* （＊ から行末まではコメント *)
| "(" { LPAREN }
| ")" { RPAREN }
| "-" { MINUS }
| "*" { TIMES }
| digit+ { NUMBER (int_of_string (Lexing.lexeme lexbuf)) }
| eof { EOF } (* 入力終了 *)
| _ { failwith ("unknown token: " ^ Lexing.lexeme lexbuf) }
