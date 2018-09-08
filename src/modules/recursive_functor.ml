module Inc = struct
  module type MAKE = sig
    type t = int

    val self : t
  end

  module Make =
    functor (I : MAKE) -> struct
      type t = int
      let self = I.self + 1
    end
end;;

module Incr = Inc.Make(struct type t = int;; let self = 0 end);;

Incr.self;;

module Incr2 = Inc.Make(Incr);;

Incr2.self;;
