let _ =
  print_int 4649;
  print_newline ()

let _ =
  let n = Eval.f (Syntax.Num(5963)) in
  print_int n;
  print_newline ()