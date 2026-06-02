# R Studio Labs

Laboratory assignments for the course **Programming Styles and Methods** (BSUIR). The repository contains R scripts, Common Lisp programs, LaTeX reports, and generated figures for three labs.

## Structure

| Directory | Topic | Contents |
|-----------|-------|----------|
| `lab1_r_base/` | Introduction to R | Vectors, matrices, data frames, base plots |
| `lab2_r_analyse/` | Data analysis & visualization | HTTP API, CSV, k-means clustering, ggplot2 |
| `lab3_func_lang/` | Functional programming (Common Lisp) | Math expressions, `cond`, tail recursion, text processing |

Shared data file: `users_data.csv` (downloaded by Lab 2 script 1).

## Requirements

- **R** (CRAN) and **RStudio** (optional, for Labs 1–2)
- R packages: `httr`, `jsonlite`, `ggplot2`, `dplyr`, `corrplot`, `cluster`
- **SBCL** (Steel Bank Common Lisp) for Lab 3
- **Visual Studio Code** + [Alive](https://marketplace.visualstudio.com/items?itemName=rheller.alive) extension (optional Lisp IDE)
- **Python 3** + Pillow (only for regenerating Lab 3 terminal screenshots)
- **LaTeX** (pdflatex + Cyrillic fonts) to compile PDF reports

