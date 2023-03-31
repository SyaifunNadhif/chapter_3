-- DDL
-- membuat database manufaktur
CREATE DATABASE manufaktur;

--masuk ke database yang dibuat
\c manufaktur

-- membuat table 
CREATE TABLE "produk" (
   "id_produk" BIGSERIAL,
   "nama_produk" VARCHAR(50) NOT NULL,
   "kuantitas" INT NOT NULL,
   PRIMARY KEY ("id_produk")
);

CREATE TABLE "pemasok" (
   "id_pemasok" BIGSERIAL,
   "pemasok" VARCHAR(50) NOT NULL,
   PRIMARY KEY ("id_pemasok")
);

CREATE TABLE "komponen" (
   "id_komponen" BIGSERIAL,
   "komponen" VARCHAR(50) NOT NULL,
   "deskripsi" TEXT NOT NULL,
   PRIMARY KEY ("id_komponen")
);

CREATE TABLE "komponen_detail" (
  "id" BIGSERIAL,
  "id_produk" INT,
  "id_komponen" INT,
  "id_pemasok" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_komponen_detail.id_produk"
    FOREIGN KEY ("id_produk")
      REFERENCES "produk"("id_produk"),
  CONSTRAINT "FK_komponen_detail.id_komponen"
    FOREIGN KEY ("id_komponen")
      REFERENCES "komponen"("id_komponen"),
  CONSTRAINT "FK_komponen_detail.id_pemasok"
    FOREIGN KEY ("id_pemasok")
      REFERENCES "pemasok"("id_pemasok")
);

DROP TABLE komponen_detail;

CREATE TABLE "komponen_detail" (
   "id" BIGSERIAL,
   "id_produk" INT,
   "id_komponen" INT,
   "id_pemasok" INT,
   PRIMARY KEY ("id"),
   CONSTRAINT "FK_komponen_detail.id_produk"
     FOREIGN KEY ("id_produk")
       REFERENCES "produk"("id_produk"),
   CONSTRAINT "FK_komponen_detail.id_komponen"
     FOREIGN KEY ("id_komponen")
       REFERENCES "komponen"("id_komponen"),
   CONSTRAINT "FK_komponen_detail.id_pemasok"
     FOREIGN KEY ("id_pemasok")
       REFERENCES "pemasok"("id_pemasok")
);

\dt
              List of relations
 Schema |      Name       | Type  |  Owner
--------+-----------------+-------+----------
 public | komponen        | table | postgres
 public | komponen_detail | table | postgres
 public | pemasok         | table | postgres
 public | produk          | table | postgres

-- DML

INSERT INTO produk(nama_produk, kuantitas) VALUES ('Pajero', 10);
INSERT INTO produk(nama_produk, kuantitas) VALUES ('Avanza', 20);
INSERT INTO produk(nama_produk, kuantitas) VALUES ('Civic', 5);
SELECT * FROM produk;
 id_produk | nama_produk | kuantitas
-----------+-------------+-----------
         1 | Pajero      |        10
         2 | Avanza      |        20
         3 | Civic       |         5
(3 rows)

INSERT INTO komponen(komponen, deskripsi) VALUES ('busi', 'busi terbaik');
INSERT INTO komponen(komponen, deskripsi) VALUES ('sein', 'sein sop');
INSERT INTO komponen(komponen, deskripsi) VALUES ('head unit', 'head unit digital');
INSERT INTO komponen(komponen, deskripsi) VALUES ('suspensi', 'suspensi terempuk');

SELECT * FROM komponen;
 id_komponen | komponen  |     deskripsi
-------------+-----------+-------------------
           1 | busi      | busi terbaik
           2 | sein      | sein sop
           3 | head unit | head unit digital
           4 | suspensi  | suspensi terempuk
(4 rows)


INSERT INTO pemasok(pemasok) VALUES ('Honda');
INSERT INTO pemasok(pemasok) VALUES ('Mitshubisi');
SELECT * FROM pemasok;
 id_pemasok |  pemasok
------------+------------
          1 | Honda
          2 | Mitshubisi
(2 rows)


INSERT INTO pemasok(pemasok) VALUES ('Nasmoco');
SELECT * FROM pemasok;
 id_pemasok |  pemasok
------------+------------
          1 | Honda
          2 | Mitshubisi
          3 | Nasmoco
(3 rows)


INSERT INTO komponen_detail(id_produk, id_komponen, id_pemasok) VALUES (1, 1, 2);
INSERT INTO komponen_detail(id_produk, id_komponen, id_pemasok) VALUES (3, 4, 1);
INSERT INTO komponen_detail(id_produk, id_komponen, id_pemasok) VALUES (2, 3, 1);
INSERT INTO komponen_detail(id_produk, id_komponen, id_pemasok) VALUES (2, 1, 1);
INSERT INTO komponen_detail(id_produk, id_komponen, id_pemasok) VALUES (3, 2, 1);
SELECT * FROM komponen_detail;
 id | id_produk | id_komponen | id_pemasok
----+-----------+-------------+------------
  1 |         1 |           1 |          2
  2 |         3 |           4 |          1
  3 |         2 |           3 |          1
  4 |         2 |           1 |          1
  5 |         3 |           2 |          1
(5 rows)

-- komponen_detail
SELECT
    komponen.komponen as nama_komponen,
    komponen.deskripsi,
    pemasok.pemasok,
    produk.nama_produk
    FROM komponen_detail
    join komponen on komponen.id_komponen = komponen_detail.id_komponen
    join produk on produk.id_produk = komponen_detail.id_produk
    join pemasok on pemasok.id_pemasok = komponen_detail.id_pemasok
;

 nama_komponen |     deskripsi     |  pemasok   | nama_produk
---------------+-------------------+------------+-------------
 busi          | busi terbaik      | Mitshubisi | Pajero
 suspensi      | suspensi terempuk | Honda      | Civic
 head unit     | head unit digital | Honda      | Avanza
 busi          | busi terbaik      | Honda      | Avanza
 sein          | sein sop          | Honda      | Civic
(5 rows)

SELECT
    komponen.id_komponen,
    komponen.komponen as nama_komponen,
    komponen.deskripsi,
    pemasok.pemasok,
    produk.nama_produk
    FROM komponen_detail
    join komponen on komponen.id_komponen = komponen_detail.id_komponen
    join produk on produk.id_produk = komponen_detail.id_produk
    join pemasok on pemasok.id_pemasok = komponen_detail.id_pemasok
    ORDER BY komponen.id_komponen ASC
;
-- mengurutkan id_kompenen secara ASC
 id_komponen | nama_komponen |     deskripsi     |  pemasok   | nama_produk
-------------+---------------+-------------------+------------+-------------
           1 | busi          | busi terbaik      | Mitshubisi | Pajero
           1 | busi          | busi terbaik      | Honda      | Avanza
           2 | sein          | sein sop          | Honda      | Civic
           3 | head unit     | head unit digital | Honda      | Avanza
           4 | suspensi      | suspensi terempuk | Honda      | Civic


