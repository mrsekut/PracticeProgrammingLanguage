(* int *)
123;;

(* float *)
3.14;;
1.5 +. 3.4;;

(* int ←→ float *)
4 + int_of_float 84.3 ;;

(* リスト型 *)

(* タプル *)
(3, 4) (* int * int *)
(3, "hello", 'x') (* int * stinrg * char *)

(* レコード *)

(**
    variant
*)
type foo =
    | Nothing
    | Int of int
    | Pair of int * int
    | String of string;;

(* 使用例 *)
Nothing
Int 3
Pair (4, 5)
String "hello"