## Editar a conveniencia
fuentes=/u01/app/oracle/middleware/starh/Fuentes
salida=/u01/app/oracle/middleware/starh/_ejecutables
userid=starh/Oracl301@promer


## Generalmente no es necesario tocar esta parte
for modulo in $(find $fuentes/ -name '*.mmb' -or -name '*.fmb' -or -name '*.rdf'); do
    archivo="$(basename -- $modulo)"

    if [ ${modulo: -4} == ".mmb" ]; then
        nombre=`basename $modulo .mmb`
        sh frmcmp_starh.sh Module=$modulo Userid=$userid Module_Type=MENU compile_all=y  Output_File="$salida/$nombre.mmx" >> "$salida/_logs_menus.log"
        echo "MENU compilado: $archivo";
    elif [ ${modulo: -4} == ".rdf" ]; then
        nombre=`basename $modulo .rdf`
        sh /u01/app/oracle/middleware/STARHapp/config/reports/bin/rwconverter.sh userid=$userid batch=yes source=$modulo stype=rdffile DTYPE=REPFILE compile_all=yes OVERWRITE=yes dest="$salida/$nombre.rep" >> "$salida/_logs_reportes.log"
        echo "REPORTE compilado: $archivo";
    else
        nombre=`basename $modulo .fmb`
        echo "Compilando forma $archivo..." >> "$salida/_logs_formas.log"
        sh frmcmp_starh.sh Module=$modulo Userid=$userid Module_Type=FORM compile_all=y  Output_File="$salida/$nombre.fmx" >> "$salida/_logs_formas.log"
        echo "FORMA compilada: $archivo";
    fi
done
