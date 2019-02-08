(* 四則演算 *)
1 + 2 - 3 * 4 / 5;;

(* 余り *)
107 mod 7;;

(* 変数束縛 *)
let pi = 3.14;;
let e: float = 2.71;;

(* 同時複数定義 *)
let x = 2 and y = 3;;

(* bool *)
true;;
false;;
4 > 5;;

(*
 * 比較演算子
 * `=`: 両辺の式が等しければtrue
 * `<>`: 両辺の式が等しくなければtrue
*)
4 = 5;;
3 <> 3

(* 論理演算子
 * not b: 否定
 * &&: かつ
 * ||: または
 *
 * `not (a = b)`は`a<>b`と等しい
 *)
(not (1 < 2)) || (4.2 <> 4.2);;


(* if *)
let abs x = if x > 0 then x else -x;;


(* タプル
 * 型が異なっても、何組でも、入れ子でもいい
 *)
(1.0, 2.0);; (* - : float * float = (1., 2.)  タプルの型は`*`で表される *)

(* パターンマッチ *)
let author = ("Atsuchi", "Igarashi", 174.0, 61.0);;
let (firstname, lastname, height, weight) = author;;
(*
    val firstname : string = "Atsuchi"
    val lastname : string = "Igarashi"
    val height : float = 174.
    val weight : float = 61.
*)
let (first, last, _, _) = author;;


(*
 * function
 *)
let area_of_circle r = r *. r *. pi;;
let area_of_circle(r: float): float = r *. r *. pi;;

(* 大域変数と局所変数
 * 大域変数の定義内で開業するときは行末に`in`がいるのか
 *)
let vol_cone =                     (* 大域変数 *)
    let base = pi *. 2.0 *. 2.0 in (* 局所変数 *)
    base *. 5.0 /. 3.0;;

(* 2つの引数を取る関数 *)