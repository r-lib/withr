# Locale settings

Temporarily change locale settings.

## Usage

``` r
with_locale(new, code)

local_locale(.new = list(), ..., .local_envir = parent.frame())
```

## Arguments

- new, .new:

  `[named character]`  
  New locale settings

- code:

  `[any]`  
  Code to execute in the temporary environment

- ...:

  Additional arguments with locale settings.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

Setting the `LC_ALL` category is currently not implemented.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`Sys.setlocale()`](https://rdrr.io/r/base/locales.html)

## Examples

``` r
## Change locale for time:
df <- data.frame(
  stringsAsFactors = FALSE,
  date = as.Date(c("2019-01-01", "2019-02-01")),
  value = c(1, 2)
)
with_locale(new = c("LC_TIME" = "es_ES"), code = plot(df$date, df$value))
#> Warning: OS reports request to set locale to "es_ES" cannot be honored

## Compare with:
#  plot(df$date, df$value)

## Month names:
with_locale(new = c("LC_TIME" = "en_GB"), format(ISOdate(2000, 1:12, 1), "%B"))
#> Warning: OS reports request to set locale to "en_GB" cannot be honored
#>  [1] "January"   "February"  "March"     "April"     "May"      
#>  [6] "June"      "July"      "August"    "September" "October"  
#> [11] "November"  "December" 
with_locale(new = c("LC_TIME" = "es_ES"), format(ISOdate(2000, 1:12, 1), "%B"))
#> Warning: OS reports request to set locale to "es_ES" cannot be honored
#>  [1] "January"   "February"  "March"     "April"     "May"      
#>  [6] "June"      "July"      "August"    "September" "October"  
#> [11] "November"  "December" 

## Change locale for currencies:
with_locale(new = c("LC_MONETARY" = "it_IT"), Sys.localeconv())
#> Warning: OS reports request to set locale to "it_IT" cannot be honored
#>     decimal_point     thousands_sep          grouping 
#>               "."                ""                "" 
#>   int_curr_symbol   currency_symbol mon_decimal_point 
#>                ""                ""                "" 
#> mon_thousands_sep      mon_grouping     positive_sign 
#>                ""                ""                "" 
#>     negative_sign   int_frac_digits       frac_digits 
#>                ""             "127"             "127" 
#>     p_cs_precedes    p_sep_by_space     n_cs_precedes 
#>             "127"             "127"             "127" 
#>    n_sep_by_space       p_sign_posn       n_sign_posn 
#>             "127"             "127"             "127" 
with_locale(new = c("LC_MONETARY" = "en_US"), Sys.localeconv())
#> Warning: OS reports request to set locale to "en_US" cannot be honored
#>     decimal_point     thousands_sep          grouping 
#>               "."                ""                "" 
#>   int_curr_symbol   currency_symbol mon_decimal_point 
#>                ""                ""                "" 
#> mon_thousands_sep      mon_grouping     positive_sign 
#>                ""                ""                "" 
#>     negative_sign   int_frac_digits       frac_digits 
#>                ""             "127"             "127" 
#>     p_cs_precedes    p_sep_by_space     n_cs_precedes 
#>             "127"             "127"             "127" 
#>    n_sep_by_space       p_sign_posn       n_sign_posn 
#>             "127"             "127"             "127" 

## Ordering:
x <- c("bernard", "bérénice", "béatrice", "boris")
with_locale(c(LC_COLLATE = "fr_FR"), sort(x))
#> Warning: OS reports request to set locale to "fr_FR" cannot be honored
#> [1] "bernard"  "boris"    "béatrice" "bérénice"
with_locale(c(LC_COLLATE = "C"), sort(x))
#> [1] "bernard"  "boris"    "béatrice" "bérénice"
```
