module type B = sig
  val b : unit -> string
end;;

module A = functor (Bm : B) -> struct
  let show () =  "From A/" ^ Bm.b ();
end;;

module Bm : sig
  val b : unit -> string
  val b2 : string -> string
end = struct
  let b () = "Bm!";;
  let b2 s2 = "Bm2!: " ^ s2;;
end;;

module X = A(Bm);;
X.show ();;

