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

# radian set up
options(radian.color_scheme = "monokai")
options(radian.editing_mode = "vi")
options(radian.auto_match = TRUE)
options(radian.suppress_reticulate_message = FALSE)
options(radian.enable_reticulate_prompt = TRUE)
options(radian.escape_key_map = list(
    list(key = "-", value = "<-"),
    list(key = "=", value = "%>%")
))

# Set CRAN mirror
options(repos=structure(c(CRAN="https://cran.cnr.berkeley.edu/")))
