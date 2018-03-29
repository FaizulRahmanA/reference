CREATE TABLE HOSPITAL(S_NO NUMBER(10),PASENT_NAME VARCHAR2(20), WARD_NO NUMBER(10), PHONE_NUM NUMBER(12))

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(1,'KANNAN',122,98765432)

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(2,'MANI',135,98765432)

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(3,'THARAN',162,98765432)

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(4,'GOPI',298,98765432)

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(5,'ARUL',245,98765432)

INSERT INTO HOSPITAL (S_NO,PASENT_NAME,WARD_NO,PHONE_NUM)VALUES(6,'KARUPU',99,98765432)

SELECT * FROM HOSPITAL


CREATE OR REPLACE PACKAGE XXSC_HOSPITAL_INFO
AS
   PROCEDURE HOSPITAL_PASENT_LIST (ERRBUF               OUT VARCHAR2,
                                RETCODE              OUT VARCHAR2,
                                PASENT_LIST_FROM   IN     NUMBER,
                                PASENT_LIST_TO     IN     NUMBER);
END XXSC_HOSPITAL_INFO;


----------PACKAGE BODY CREATE

CREATE OR REPLACE PACKAGE BODY APPS.XXSC_HOSPITAL_INFO
AS
   PROCEDURE HOSPITAL_PASENT_LIST (ERRBUF               OUT VARCHAR2,
                                RETCODE              OUT VARCHAR2,
                                PASENT_LIST_FROM   IN     NUMBER,
                                PASENT_LIST_TO     IN     NUMBER)
   IS
      CURSOR C_HOSPITAL
      IS
         SELECT S_NO,
                PASENT_NAME,
                WARD_NO,
                PHONE_NUM
           FROM HOSPITAL
          WHERE WARD_NO BETWEEN PASENT_LIST_FROM AND PASENT_LIST_TO;
   BEGIN
      FOR PASENT_LST_ORD IN C_HOSPITAL
      LOOP
         FND_FILE.PUT_LINE (
            FND_FILE.OUTPUT,
               RPAD (PASENT_LST_ORD.S_NO, 10)
            || ' -- '
            || RPAD (PASENT_LST_ORD.PASENT_NAME, 20)
            || ' -- '
            || RPAD (PASENT_LST_ORD.WARD_NO, 12)
            || ' -- '
            || PASENT_LST_ORD.PHONE_NUM);
      END LOOP;
   END HOSPITAL_PASENT_LIST;
END XXSC_HOSPITAL_INFO;