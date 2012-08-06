let _ =
    let args = Sys.argv in
    if Array.length args = 2 then (
        try (
            let n = int_of_string args.(1) in

            let calculs = Calcul.calcul n in

            print_string calculs
        )
        with
            | (Failure "int_of_string") -> prerr_endline "..."
    )
    else
        prerr_endline ".."
