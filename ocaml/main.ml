let _ =
    let args = Sys.argv in
    if Array.length args = 2 then (
        try (
            let n = int_of_string args.(1) in

            if n >= 10 && n <= 100 then (
                let calculs = Calcul.calcul n in

                print_string calculs
            )
            else
                prerr_endline "."
        )
        with
            | (Failure "int_of_string") -> prerr_endline "..."
    )
    else
        prerr_endline ".."
