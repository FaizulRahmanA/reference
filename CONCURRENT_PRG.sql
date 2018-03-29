/* Formatted on 22-03-2018 18:00:31 (QP5 v5.136.908.31019) */
CREATE TABLE LIBRARY
(
   S_NO        NUMBER (10),
   BOOK_NAME   VARCHAR2 (30),
   AUTHORS     VARCHAR2 (30),
   PRICE       NUMBER (10)
);

-----select query

SELECT *
  FROM LIBRARY ------rename column
               ALTER
      TABLE LIBRARY RENAME COLUMN S_ TO S_NO
----INSERT QUERY

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (1,
            'The Philosophers Stone ',
            'J. K. Rowling',
            999);

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (2,
            'The Chamber of Secrets  ',
            'J. K. Rowling',
            1299);

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (3,
            'The Prisoner of Azkaban  ',
            'J. K. Rowling',
            1100);

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (4,
            'The Half-Blood Prince ',
            'J. K. Rowling',
            780);

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (5,
            'The Order of the Phoenix ',
            'J. K. Rowling',
            900);

INSERT INTO LIBRARY (S_NO,
                     BOOK_NAME,
                     AUTHORS,
                     PRICE)
    VALUES (6,
            'The Goblet of Fire ',
            'J. K. Rowling',
            1350);

------------CONCURRENT PRG

------------PACKAGE CREATE

CREATE OR REPLACE PACKAGE XXSC_LIBRARY_INFO
AS
   PROCEDURE LIBRARY_INFO_LIST (ERRBUF               OUT VARCHAR2,
                                RETCODE              OUT VARCHAR2,
                                PRICE_LIST_FROM   IN     NUMBER,
                                PRICE_LIST_TO     IN     NUMBER);
END XXSC_LIBRARY_INFO;


----------PACKAGE BODY CREATE

CREATE OR REPLACE PACKAGE BODY APPS.XXSC_LIBRARY_INFO
AS
   PROCEDURE LIBRARY_INFO_LIST (ERRBUF               OUT VARCHAR2,
                                RETCODE              OUT VARCHAR2,
                                PRICE_LIST_FROM   IN     NUMBER,
                                PRICE_LIST_TO     IN     NUMBER)
   IS
      CURSOR C_LIBRARY
      IS
         SELECT S_NO,
                BOOK_NAME,
                AUTHORS,
                PRICE
           FROM LIBRARY
          WHERE PRICE BETWEEN PRICE_LIST_FROM AND PRICE_LIST_TO;
   BEGIN
      FOR LIBRARY_LST_ORD IN C_LIBRARY
      LOOP
         FND_FILE.PUT_LINE (
            FND_FILE.OUTPUT,
               RPAD (LIBRARY_LST_ORD.S_NO, 10)
            || ' -- '
            || RPAD (LIBRARY_LST_ORD.BOOK_NAME, 30)
            || ' -- '
            || RPAD (LIBRARY_LST_ORD.AUTHORS, 30)
            || ' -- '
            || LIBRARY_LST_ORD.PRICE);
      END LOOP;
   END LIBRARY_INFO_LIST;
END XXSC_LIBRARY_INFO;