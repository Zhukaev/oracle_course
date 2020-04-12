create table hw10 (
id number(10) primary key,
name varchar2(100 char)
);

create or replace package hw10_pack as

    procedure add_hw10(v_id hw10.id%type, v_name hw10.name%type);

    procedure update_hw10(v_id hw10.id%type, v_name hw10.name%type);
    
    procedure delete_hw10(v_id hw10.id%type);
end;
/

create or replace package body hw10_pack as

    procedure add_hw10(v_id hw10.id%type, v_name hw10.name%type) as
    begin
        insert into hw10 values (v_id, v_name);
    end;

    procedure update_hw10(v_id hw10.id%type, v_name hw10.name%type) as
    begin
        update hw10 set name = v_name where id = v_id;
    end;

    procedure delete_hw10(v_id hw10.id%type) as
    begin
        delete hw10 where id = v_id;
    end;
end;
/


create or replace package test_hw10_pack as
    --%suite(Test hw10_pack)
    
    --%test(создание нового объекта)
    --%aftertest(delete_obj)
    procedure create_new_object;
    
    --%test(удаление объекта)
    --%beforetest(create_obj)
    procedure delete_object;
    
    --%test(изменение объекта)
    --%beforetest(create_obj)
    --%aftertest(delete_obj)    
    procedure update_object;
    
    --%test(вставка объекста с существующим id)
    --%throws(-00001)
    --%beforetest(create_obj)
    --%aftertest(delete_obj)
    procedure create_new_obj_pk_error;

    procedure delete_obj;
    procedure create_obj;
end;
/

create or replace package body test_hw10_pack as
    c_test_id hw10.id%type := 1000000;
    procedure create_new_object as
    begin
        hw10_pack.add_hw10(c_test_id, 'obj_name');
    end;
    
    procedure delete_object as
    begin
        hw10_pack.delete_hw10(c_test_id);
    end;
    
    procedure update_object as
    begin
        hw10_pack.update_hw10(c_test_id, 'new_obj_name');
    end;
    
    procedure create_new_obj_pk_error as
    begin
        hw10_pack.add_hw10(c_test_id, 'obj_name');
    end;
    
    procedure delete_obj as
    begin
        hw10_pack.delete_hw10(c_test_id);
    end;
    
    procedure create_obj as
    begin
        hw10_pack.add_hw10(c_test_id, 'obj_name');
    end;
end;
/