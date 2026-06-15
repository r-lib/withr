# Language

Temporarily change the language used for translations.

## Usage

``` r
with_language(lang, code)

local_language(lang, .local_envir = parent.frame())
```

## Arguments

- lang:

  A BCP47 language code like "en" (English), "fr" (French), "fr_CA"
  (French Canadian). Formally, this is a lower case two letter [ISO 639
  country code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes),
  optionally followed by "\_" or "-" and an upper case two letter [ISO
  3166 region code](https://en.wikipedia.org/wiki/ISO_3166-2).

- code:

  `[any]`  
  Code to execute in the temporary environment

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Examples

``` r
with_language("en", try(mean[[1]]))
#> Error in mean[[1]] : object of type 'closure' is not subsettable
with_language("fr", try(mean[[1]]))
#> Error in mean[[1]] : object of type 'closure' is not subsettable
with_language("es", try(mean[[1]]))
#> Error in mean[[1]] : object of type 'closure' is not subsettable
```
