(*
 * Copyright (c) 2014-2015 Jeremy Yallop.
 *
 * This file is distributed under the terms of the MIT License.
 * See the file LICENSE for details.
 *)

open Ctypes

let x : [`x] structure typ = structure "x"
let y = field x "z" (Ctypes_zarith.MPZ.zarith)
let () = seal x

let print s =
  getf (!@s)  y |> Z.to_string |> Printf.printf "print from OCaml: %s\n%!"

module Stubs(I : Cstubs_inverted.INTERNAL) =
struct
  (* Expose the type 'struct handlers' to C. *)
  let () = I.structure x

  let () = I.internal "ocaml_print" (ptr x @-> returning void) print
end
