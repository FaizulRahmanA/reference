SELECT * FROM SOFT

SELECT * FROM SOFT_SALARY

SELECT SOFT.STAFF_NAME, SOFT_SALARY.DESIGNATION, SOFT_SALARY.SALARY FROM SOFT full outer JOIN SOFT_SALARY ON SOFT.ID=SOFT_SALARY.ID

 --simple document...
declare
    user_name varchar2(50):='Faiuzl Rahman';
begin
    dbms_output.put_line('User Name' || user_name);
end;

--user define subtype...
DECLARE
    SUBTYPE secound is char(10);
    SUBTYPE third is varchar2(10);
    contant1 secound;
    contant2 third;
BEGIN
    contant1 := 'point';
    contant2 := 'every time';
    dbms_output.put_line('learning' ||contant1 ||contant2);
end;

-------Variable...
DECLARE 
    A INTEGER := 32;
    B INTEGER :=46;
    C INTEGER;
    F REAL;
BEGIN
    C := A*B;
    dbms_output.put_line('C Values is' || C);
    F := 72/3.0;
    dbms_output.put_line('F Values is' || F);
END;

--global variable
declare
    num1 number(3) := 3;
    num2 number(3) :=222;
    c number(3);
begin
    c := num1 + num2;
    dbms_output.put_line( 'C Values is '|| C);
    --local variable
    declare
        num3 number(3) := 2;
        num4 number(3) := 253;
        d number(3);
    begin
         d := num3 + num4;
        dbms_output.put_line('D Values is '|| d);   
    end;
end;

-- constant declaration 
PI CONSTANT NUMBER := 3.141592654; 
DECLARE 
   -- constant declaration 
   pi constant number := 3.141592654; 
   -- other declarations 
   radius number(5,2);  
   dia number(5,2);  
   circumference number(7, 2); 
   area number (10, 2); 
BEGIN  
   -- processing 
   radius := 9.5;  
   dia := radius * 2;  
   circumference := 2.0 * pi * radius; 
   area := pi * radius * radius; 
   -- output 
   dbms_output.put_line('Radius: ' || radius); 
   dbms_output.put_line('Diameter: ' || dia); 
   dbms_output.put_line('Circumference: ' || circumference); 
   dbms_output.put_line('Area: ' || area); 
END; 

---if condition
declare
    a number(2) :=10;
begin
     a := 10;
     if(a<5)then
     DBMS_OUTPUT.PUT_LINE(' A less then small B');
end if;
      dbms_output.put_line('A values is' || A);
end;

---if condition
DECLARE
    s_id SOFT_SALARY.ID%type := 24;
    s_slry SOFT_SALARY.SALARY%type;
    s_dsg SOFT_SALARY.DESIGNATION%type; 
BEGIN
    select salary,designation into s_slry,s_dsg from SOFT_SALARY where ID=s_id;
    if (s_slry<=8500)then
            update soft_salary set SALARY = SALARY - 50 where id=s_id;
             dbms_output.put_line('Salary Udate'); 
    end if;
END;

declare
    d_id SOFT.ID%type :=30;
    d_name SOFT.STAFF_NAME%type;
    d_num SOFT.phone%type;
begin
    select staff_name,phone into d_name,d_num from soft where id=d_id;
    dbms_output.put_line('Staff Name'||d_name||'Phone Number'||d_num);
end;
---if esle..
declare
        s_id SOFT_SALARY.ID%type := 24;
        s_slry SOFT_SALARY.SALARY%type;
begin
        select salary into s_slry from soft_salary where id=s_id;
    if(s_slry < 6000)then
        update soft_salary set salary = salary - 100 where id=s_id;
        dbms_output.put_line(' Update salary increment ' ); 
   ELSE
        update soft_salary set salary = salary + 150 where id=s_id;
        dbms_output.put_line('Udate salary decrement ' ); 
   END IF; 
   
END;

--if elseif....
declare
    a number(3) := 200;
begin
    if(a = 10)then
        dbms_output.put_line('Not Equla');
     elsif (a=20)then
         dbms_output.put_line('Not Equla');
      elsif (a=30)then
         dbms_output.put_line('Not Equla');
      else
          dbms_output.put_line('Not Match');
      end if;
             dbms_output.put_line('Not Equla');
 end;
 
 ---case statement..
 declare
    grade char(1) := 'c';
 begin
     case grade
        when 'a' then dbms_output.put_line('excellent');
        when 'b' then dbms_output.put_line('very good');
        when 'c' then dbms_output.put_line('well done');
        when 'd' then dbms_output.put_line('you passed');
        when 'e' then dbms_output.put_line('better try  again');
        else dbms_output.put_line('so much grade');
     end case;
end;

---nest condition...
declare
    d_slry SOFT_SALARY.SALARY%type :=9000;
    d_id soft_salary.id%type;
begin
    select salary,id into d_slry,d_id from soft_salary where salary=d_slry;
    if(d_slry=9000)then
        if(d_id = 24)then
            dbms_output.put_line(' ID Number 22 Right');
         end if; 
       end if;   
          dbms_output.put_line(' ID Number 22 Worng');  
 end;

---Basic loop..
declare
    x number(2) := 20;
begin
    loop
        dbms_output.put_line(x);
        x := x+10;
        if  x >70 then
            exit;
         end if;
       end loop;
    dbms_output.put_line('After loop condtion' || x);
end;

---Exit when.....
declare
    x number(2) :=10;
begin
    loop
        sys.dbms_output.put_line(x);
        x := x + 10;
        
        exit when x > 50;
        
        end loop;
        sys.dbms_output.put_line('After loop when conditioin ' || x);
end;

---while loop...
declare
    x number(2) := 20;
 begin
    while x < 70 loop
        sys.dbms_output.put_line('values is ' || x);
        x := x + 10;
     end loop;
end;   

---for loop...
declare 
    a number(2);
begin
    for a in 10 .. 60 loop
        sys.dbms_output.put_line('values is' || a);
     end loop;
end;

--for reverse....
declare

    a number(2);
    
begin

    for a in reverse 10 .. 20 loop
    
        sys.dbms_output.put_line('Values is ' || a);
        
    end loop;
    
end;

---labeing loop..
declare
i number(2);
j number(2);
begin
    <<outer_loop>>
    for i in 1 .. 3 loop
    <<inner_loop>>
    for j in 1 .. 3 loop
        SYS.DBMS_OUTPUT.PUT_LINE(' i is ' || i ||' j is '|| j);
    end loop inner_loop;
    end loop outer_loop;
end;

--nest loop...
declare
i number(2);
j number(2);
begin
    i := 2;
        loop
            j:=2;
                loop
                    exit when (( mod (i, j) = 0 )or ( j = i ));
                    j:= j+1;
                    end loop;
                    if (j=i) then
                        sys.dbms_output.put_line(i);
                    end if;
            i := i +1;
            exit when i =50;
            end loop;
end;                 

---exit .....
declare
     a number(2) :=10;
begin
     while a < 20 loop
     dbms_output.put_line( a);
     a := a + 1;
     if (a >15)then
      exit;
      end if;
      end loop;
end;

---continue...
declare
    a number(2) :=10;
begin
    while a >20 loop
        dbms_output.put_line(a);
        a := a+1;
        if (a = 15)then
            a := a+1;
           continue;
           end if;
           end loop;
 end;
        
 ---goto loop    
declare
    A number(2) :=10;
begin
        <<loopstart>> 
    while A< 20 loop
    
        dbms_output.put_line (a);
        
        A := A +1;
        
        if (A = 15) then
         
           A := A +1;
         
          GOTO loopstart;
        
         end if;
         
         end loop;
         
 end;
     
 ----string...
 declare
    name varchar2(20);
    company varchar2(20);
    introduction clob;
    choice char(1);
begin
    name := 'faizul';
    company := 'SHASTICORP';
    introduction :='SHASTICORP CONSULTANCY SERVICES PVT LTD';
    choice :='a';
    if choice = 'a' then
    dbms_output.put_line(name);
    dbms_output.put_line(company);
    dbms_output.put_line(introduction);
    end if;
end;
    
----array....
 declare
     type namesarray is varray(5) of varchar2(10);
     type grade is varray(5) of integer;
     names namesarray;
     marks grade;
     total integer;
 begin 
     names := namesarray ('faizul', 'prithi', 'arun', 'gopal', 'kannan');
     marks := grade(50,60,40,77,95);
     total := names .count;
      dbms_output.put_line( 'student'|| total|| 'members');
      for i in 1 .. total loop
           dbms_output.put_line( 'student' || names(i)  || 'marks' || marks(i) );
       end loop;
  end;
  
  ----procedure....
  create or replace procedure greetings
  as
  begin
    dbms_output.put_line('Hello world');
  end; 
  
  -----execute procedure...
  execute greetings;
  
    -----execute procedure...
  begin
   greetings;
  end;
  
----drop procedure.....
  drop procedure greetings
  
  ----in and out ....
declare
    a number;
    procedure squareNum(x in out number)is
begin
    x := x* x;
    end;
    begin
    a := 2;
    squareNum(a);
    sys.dbms_output.put_line(a);
end;  

---Positional notation...
declare 
    a number;
    b number;
    c number;
        procedure dlts (x in number, y in number, z out number)is
begin
    if ( x < y ) then
        z := x;
    else
        z := y;
    end if;
end;
begin
    a := 24;
    b := 23;
    dlts(a,b,c);
    dbms_output.put_line ('A , B which smallest number' || c);
end;    

-----function create.......
CREATE OR REPLACE FUNCTION fnt_just
   RETURN number IS
   total   NUMBER (2) := 0;
BEGIN
   SELECT COUNT ( * ) INTO total 
   FROM soft_salary;
   return total;
end;

----calling funciton...
declare
    c number(2);
begin
    c := fnt_just();
    sys.dbms_output.put_line(c);
end;

---max,min....
declare
    a number;
    b number;
    c number;
    function fnt_demo (x in number, y in number)
    return number IS
    z number;
begin
    if ( x > y) then
        z := x;
        else
        z:= y;
    end if;
    return z;
end;
begin
    a := 50;
    b := 37;
    c := fnt_demo(a,b);
    SYS.DBMS_OUTPUT.put_line (c);
end;

----Recursive Functions....
declare 
    num number;
    factorial  number;
    function fact(x number)
    return number is
    f number;
begin
    if (x = 0) then
    f := 1;
    else
    f := x * fact(x-1);
    end if;
    return f;
end;
begin
    num := 6;
    factorial  := fact(num);
    SYS.DBMS_OUTPUT.put_line ('6 factorial  Number' || num);
end;

----%found cursors....
declare 
    total_row number(2);
begin
    update soft_salary
    set salary = salary + 150;
    if sql%notfound then
            sys.dbms_output.put_line('No select');
        elsif sql%found then
            total_row := sql%rowcount;
           sys.dbms_output.put_line(total_row || ' Select Row' );
    end if;
end;

---%rowtype records...
declare
    soft_dtl soft_salary%rowtype;
begin
    select * into soft_dtl from soft_salary
    where id= 22;
    sys.dbms_output.put_line ('ID' || soft_dtl.id);
    sys.dbms_output.put_line ('Designation' || soft_dtl.designation);
    sys.dbms_output.put_line('Salary' || soft_dtl.salary);
 end;

---user define records....
declare
    type books is record
    ( title varchar2(20),
    author varchar2(50),
    subject varchar2(50));
    book1 books;
    book2 books;
begin

    book1.title := 'title 1';
    book1.author := 'author 1';
    book1.subject := 'subject 1';
    book2.title := 'title 2';
    book2. author := 'author 2';
    book2.subject := 'subject 2';
     
    sys.dbms_output.put_line (book1.title);
    sys.dbms_output.put_line (book1.author);
    sys.dbms_output.put_line (book1.subject);
    sys.dbms_output.put_line (book2.title);
    sys.dbms_output.put_line (book2.author);
    sys.dbms_output.put_line (book2.subject);
    
end;

---exception...
declare 
    c_id soft.id%type := 22;
    c_name SOFT.STAFF_NAME%type;
    c_plc soft.place%type;
    c_ph SOFT.PHONE%type;
begin
    select id, staff_name, place, phone into c_id, c_name,c_plc, c_ph from soft where id = c_id;
    SYS.DBMS_OUTPUT.put_line('name' || c_name);
    sys.dbms_output.put_line('place' || c_plc);
exception
    when no_data_found then
     sys.dbms_output.put_line('No such data');
     when others then
     sys.dbms_output.put_line('error'); 
end;

----Package Simple....

CREATE OR REPLACE PACKAGE APPS.H_EMP_PKG2 AS
PROCEDURE H_EMP_DATA_PARAM2 ( ERRBUF OUT VARCHAR2,                                
                                                      RETCODE OUT VARCHAR2,                                
                                                      P_FROM_DEPTNO IN NUMBER,                                
                                                      P_TO_DEPTNO     IN     NUMBER);
END H_EMP_PKG2;

CREATE OR REPLACE PACKAGE BODY APPS.H_EMP_PKG2 AS    
PROCEDURE H_EMP_DATA_PARAM2( ERRBUF OUT VARCHAR2,                                
                                                        RETCODE OUT VARCHAR2,                                
                                                        P_FROM_DEPTNO IN NUMBER,                                
                                                        P_TO_DEPTNO IN NUMBER) 
IS       CURSOR C_EMP       
IS          SELECT EMPNO,ENAME,SAL,HIREDATE,DEPTNO FROM EMP WHERE DEPTNO BETWEEN P_FROM_DEPTNO AND P_TO_DEPTNO;   
BEGIN       FOR C_EMP_REC IN C_EMP       
    LOOP          FND_FILE.PUT_LINE (FND_FILE.OUTPUT, RPAD (C_EMP_REC.EMPNO, 3)  || ' -- '  || RPAD (C_EMP_REC.ENAME, 15)|| ' -- '|| RPAD (C_EMP_REC.SAL, 10)|| ' -- ' || RPAD (C_EMP_REC.HIREDATE, 10)|| ' -- ' || C_EMP_REC.DEPTNO);       
    END LOOP;    
END H_EMP_DATA_PARAM2; 
END H_EMP_PKG2;








    create package slry_report as procedure  slry_exps (c_id soft_salary.id%type);
    end slry_report;

-------Package Body
create or replace package body slry_dtls as procedure slry_exps(c_id soft_salary.id%type) is c_slry soft_salary.salary%type;
begin
    select salary into c_slry from soft_salary where id=:c_id;
   sys.dbms_output.put_line(c_slry);
   end slry_exps;
   end slry_dtls;
   
   ----package element..
declare
    code soft_salary.id%type := &cc_id;
begin
    slry_dtls.slry_exps(code);
end;

----date..
select sysdate from soft
-----current date...
SELECT TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY HH:MI:SS') FROM soft_salary; 
----commit...
insert into soft (id,staff_name,place,phone)values(29,'Tharan','slm',87654567);
commit;
-----savepoint
insert into soft (id,staff_name,place,phone)values(35,'Hari','slm',87654567);
savepoint sav1;
-------rollback...
insert into soft (id,staff_name,place,phone)values(32,'Ellavarasan','mdr',87654567);
rollback;
-------rollback...
insert into soft_salary (id,designation,salary)values(29,'Cleaning', 4700);
rollback to sav1;

select * from soft_salary where  &cc_id;

select * from soft_salary where SALARY=:cc_id;


create package pck_soft as procedure add_soft (c_slry soft.id%type);
end pck_soft;

---collection
declare
    type salary is table of number index by varchar2(20);
    salary_list salary;
    name varchar2(20);
begin
    salary_list('Rajith') := 5500;
    salary_list('Praba') := 7240;
    salary_list('Karan') := 6700;
    salary_list('Mani') := 12500;
    
    name := salary_list.FIRST;
    WHILE name is not null loop
    sys.dbms_output.put_line('Staff Name' || name || 'Salary Per Mnt' || to_char(salary_list(name)));
    name := salary_list.next(name);
    end loop ;
end;

----collection
declare
            cursor c_soft is select staff_name from soft;
            type c_list is table of soft.staff_name%type index by binary_integer;
            name_list c_list;
            counter integer := 0;
begin
            for n in c_soft loop
            counter := counter + 1;
            name_list(counter) := n.staff_name;
            sys.dbms_output.put_line ('Customer' || counter || 'Name' || name_list(counter));
            end loop;
end;
    
-----collection
declare 
    cursor c_soft is select staff_name from soft;
    type c_list is table of soft.staff_name%type;
    name_list c_list := c_list();
    counter integer := 0;
begin
        for  n in c_soft loop
        counter := counter +1;
        name_list.extend;
        name_list(counter) := n.staff_name;
        sys.dbms_output.put_line ('ID' || counter || 'Staff' || name_list(counter) );
        end loop;
 end;
 
 ----object type....
 create or replace type address as object
 (house_no varchar2(10),
 street varchar2(50),
 city varchar2(40),
 state varchar2(40),
 pincode varchar2(40)
 );
 
 ----object type....
 create or replace type staff as object
 (code number(5),
 staff_name varchar2(20),
 contact varchar2(20),
 addr address
 );
 
 -------Instantiating an Object....
 declare

    residence address;
    
begin

    residence := address(32,'Main Bazar','Chennai','Tamilnadu',639007);
    sys.dbms_output.put_line( 'House No' || residence.house_no);
    sys.dbms_output.put_line( 'Street' || residence.street);
    sys.dbms_output.put_line( 'City' || residence.city);
    sys.dbms_output.put_line( 'State' || residence.state);
    sys.dbms_output.put_line( 'Pincode' || residence.pincode);
    
end;



