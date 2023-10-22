$pdf_mode = 5;

$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";
$lualatex = "lualatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

$bibtex_use = 2; # 当源文件需要用 .bbl 文件作为参考文献的时候, 运行 bibtex 或者 biber 来更新 .bbl 文件. 这个选项可以将 latexmkrc 中的 $bibtex_use 的值设置为 2 来实现. 当 `$bibtex_use = 1.5` 时，如果 `.bib` 文件存在，则 `.bbl` 文件被视为可再生的，会在清理时被删除。但是如果 `.bib` 文件不存在，则 `.bbl` 文件被视为不可再生的，不会被删除。这个选项需要 TeX Live 2018 或更高版本²³。

$clean_ext = "hd loa synctex.gz xdv nav snm vrb";

$makeindex = "makeindex -s gind.ist %O -o %D %S";
add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, "glo", "gls";

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, "nlo", "nls";
