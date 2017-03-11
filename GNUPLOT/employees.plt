set terminal png size 800,500
set output 'output_employees_512.png'

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";

set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set logscale y

set title "Employees DB Buffer Size = 512MB"
plot "queries-employees-512M.dat" using 2:xtic(1) title "SQL" linecolor rgb red, \
            '' using 3 title "NEO4J" linecolor rgb blue