-- выкл отображение замены переменных
set verify off

-- при возникновении ошибки выходим
whenever sqlerror exit failure

-- отключение считывания символов &
set define off


prompt ================
-------- накат --------

prompt >>>> create_objects.sql
prompt 
@create_objects.sql

-- запуск тесты
prompt >>>> unit_test.sql
prompt 
@unit_test.sql

prompt ================
prompt 
prompt Patch was successfull installed :)

exit;