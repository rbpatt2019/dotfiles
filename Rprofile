# Language Server lintr setup
setHook(
    packageEvent("languageserver", "onLoad"),
    function(...) {
        options(languageserver.default_linters = lintr::with_defaults(
            line_length_linter = lintr::line_length_linter(100),
            object_usage_linter = NULL
        ))
    }
)

# Set CRAN mirror
options(repos=structure(c(CRAN="https://cran.ma.imperial.ac.uk/")))
