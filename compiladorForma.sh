#!/bin/sh

ORACLE_HOME=/u01/app/oracle/middleware/11GFR
export ORACLE_HOME

# Set ORACLE_INSTANCE if not set in the calling environment:
ORACLE_INSTANCE=/u01/app/oracle/middleware/STARHapp
export ORACLE_INSTANCE

FORMS_PATH=/u01/app/oracle/middleware/11GFR/forms:/u01/app/oracle/middleware/STARHapp/FormsComponent/forms
export FORMS_PATH

FORMS_BUILDER_CLASSPATH=$ORACLE_HOME/jlib/frmbld.jar:$ORACLE_HOME/jlib/importer.jar:$ORACLE_HOME/jlib/debugger.jar:$ORACLE_HOME/jlib/utj.jar:$ORACLE_HOME/jlib/ewt3.jar:$ORACLE_HOME/jlib/share.jar:$ORACLE_HOME/jlib/dfc.jar:$ORACLE_HOME/jlib/ohj.jar:$ORACLE_HOME/jlib/help-share.jar:$ORACLE_HOME/jlib/oracle_ice.jar:$ORACLE_HOME/jlib/jewt4.jar:$ORACLE_HOME/forms/java/frmwebutil.jar:$ORACLE_HOME/forms/java/frmall.jar
export FORMS_BUILDER_CLASSPATH

TNS_ADMIN=/u01/app/oracle/product/11.2.0/dbhome_1/network/admin
export TNS_ADMIN
echo $TNS_ADMIN


LD_LIBRARY_PATH=$ORACLE_HOME/jdk/jre/lib/amd64/native_threads:$ORACLE_HOME/jdk/jre/lib/amd64/server:$ORACLE_HOME/jdk/jre/lib/amd64:$ORACLE_HOME/lib
export LD_LIBRARY_PATH

/u01/app/oracle/middleware/11GFR/bin/frmcmp $*
