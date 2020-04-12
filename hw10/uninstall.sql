-- выкл отображение замены переменных
set verify off

-- при возникновении ошибки выходим
whenever sqlerror exit failure

-- отключение считывания символов &
set define off


prompt ================
-------- откат --------

prompt >>>> rollback.sql
prompt 
@rollback.sql

-- запуск тестов
prompt >>>> unit_test.sql
prompt 
@unit_test.sql

prompt ================
prompt 
prompt Patch was successfull uninstalled :)

-- отрубаем спулл
spool off

exit;