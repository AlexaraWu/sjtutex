# Latexmk configuration file.

# Use XeLaTeX to compile.
$pdf_mode = 5;

# Files to clean.
$clean_ext = 'bbl glo gls hd loa run.xml xdv';

# Process index.
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

# Process glossary (change history).
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\"
        -t \"$_[0].glg\" \"$_[0].glo\"");
}
