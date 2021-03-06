(*
 * Copyright (c) 2016 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

val make_base : string -> AccessPath.base

val make_field_access : string -> AccessPath.access

val make_array_access : unit -> AccessPath.access

val make_access_path : string -> string list -> AccessPath.raw
