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

## Quick start

### Lab 1 — R basics

```bash
cd lab1_r_base
Rscript lab1_script.R          # interactive plots in RStudio
Rscript generate_images.R      # export report PNGs (screenshot1–4.png)
```

### Lab 2 — Data analysis

```bash
cd lab2_r_analyse
Rscript lab2_script1.R         # fetch users → ../users_data.csv
Rscript lab2_script2.R         # clustering + cluster_scatter.png, cluster_bar.png
```

Run script 2 from the project root if `users_data.csv` is stored there:

```bash
Rscript lab2_r_analyse/lab2_script2.R
```

### Lab 3 — Common Lisp

```bash
cd lab3_func_lang
sbcl --script task2_1.lisp
sbcl --script task2_2.lisp
sbcl --script task2_3.lisp
sbcl --script task3_text.lisp

python3 generate_screenshots.py   # regenerate terminal screenshots for the report
```

Install SBCL and Alive on macOS:

```bash
brew install sbcl
brew install --cask visual-studio-code
code --install-extension rheller.alive
```

## Reports

Each lab folder includes:

- `report_labN.tex` — LaTeX source (Russian)
- `2026_Lab_N_*.pdf` — compiled report (when built)
- PNG images referenced by the report

Compile a report (from the lab directory):

```bash
pdflatex report_lab1.tex
pdflatex report_lab1.tex   # run twice for the table of contents
```

## Author

Artyom Lebedevich — magistracy, Faculty of Computer Systems and Networks, BSUIR, group 556301.
