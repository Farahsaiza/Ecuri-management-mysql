Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>  show databases;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centreformation    |
| djalabasoft        |
| ecuri              |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test3              |
| tramway            |
| world              |
+--------------------+
14 rows in set (3.52 sec)

mysql> use ecuri;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_ecuri |
+-----------------+
| cheval          |
| concour         |
| croissance      |
| personne        |
| proprietaire    |
| race            |
+-----------------+
6 rows in set (0.55 sec)

mysql> desc  personne;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IdPersonne | int         | NO   | PRI | NULL    |       |
| NomPer     | varchar(30) | YES  |     | NULL    |       |
| telephone  | int         | YES  |     | NULL    |       |
| Adresse    | varchar(30) | YES  |     | NULL    |       |
| fonction   | varchar(30) | YES  |     | NULL    |       |
| IdPerSup   | int         | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (3.20 sec)

mysql> desc proprietaire;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdPersonne | int   | NO   | PRI | NULL    |       |
| IdCheval   | int   | NO   | PRI | NULL    |       |
| PrixAchat  | float | YES  |     | NULL    |       |
| date       | year  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.08 sec)

mysql> desc concour;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| NomConcours     | varchar(30) | NO   | PRI | NULL    |       |
| Anne            | year        | NO   | PRI | NULL    |       |
| lieu            | varchar(30) | YES  |     | NULL    |       |
| NbreParticipant | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.06 sec)

mysql> desc proprietaire;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdPersonne | int   | NO   | PRI | NULL    |       |
| IdCheval   | int   | NO   | PRI | NULL    |       |
| PrixAchat  | float | YES  |     | NULL    |       |
| date       | year  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table proprietaire
    -> add foreign key  (IdPersonne) references personne(IdPersonne);
Query OK, 0 rows affected (8.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc propretaire;
ERROR 1146 (42S02): Table 'ecuri.propretaire' doesn't exist
mysql> desc proprietaire;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdPersonne | int   | NO   | PRI | NULL    |       |
| IdCheval   | int   | NO   | PRI | NULL    |       |
| PrixAchat  | float | YES  |     | NULL    |       |
| date       | year  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc cheval;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| IdCheval     | int         | NO   | PRI | NULL    |       |
| NomCheval    | varchar(30) | YES  |     | NULL    |       |
| couleur      | varchar(30) | YES  |     | NULL    |       |
| NumTatouage  | int         | YES  |     | NULL    |       |
| IdChevalMere | int         | YES  | MUL | NULL    |       |
| IdChevalPere | int         | YES  | MUL | NULL    |       |
| IdRace       | int         | YES  | MUL | NULL    |       |
| IdPerEleveur | int         | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.04 sec)

mysql> show tables
    -> ;
+-----------------+
| Tables_in_ecuri |
+-----------------+
| cheval          |
| concour         |
| croissance      |
| personne        |
| proprietaire    |
| race            |
+-----------------+
6 rows in set (0.03 sec)

mysql> desc croissance;
+--------------+-------+------+-----+---------+-------+
| Field        | Type  | Null | Key | Default | Extra |
+--------------+-------+------+-----+---------+-------+
| IdCroissance | int   | NO   | PRI | NULL    |       |
| mois         | int   | YES  |     | NULL    |       |
| tailleCr     | float | YES  |     | NULL    |       |
| PoidCr       | float | YES  |     | NULL    |       |
| IdCheval     | int   | YES  | MUL | NULL    |       |
+--------------+-------+------+-----+---------+-------+
5 rows in set (0.04 sec)

mysql> desc race;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdRace     | int   | NO   | PRI | NULL    |       |
| PoidType   | float | YES  |     | NULL    |       |
| TailleType | float | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> create table participation (
    -> IdCheval int primary key,
    -> NomConcours varchar(30),
    -> AnneConcours year,
    -> rank int,
    -> foreign key  (IdCheval) references  cheval  (IdCheval),
    -> foreign key  (NomConcours) references concour (nomConcours),
    -> foreign key (AnneConcours) references concour (Anne));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank int,
foreign key  (IdCheval) references  cheval  (IdCheval),
foreign key  (' at line 5
mysql> create create table participation (
    -> l;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'create table participation (
l' at line 1
mysql> show tables
    -> ;
+-----------------+
| Tables_in_ecuri |
+-----------------+
| cheval          |
| concour         |
| croissance      |
| personne        |
| proprietaire    |
| race            |
+-----------------+
6 rows in set (0.08 sec)

mysql> create table participation (
    ->  IdCheval int primary key,
    ->  NomConcours varchar(30),
    ->  AnneConcours year,
    -> rank int);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank int)' at line 5
mysql> create table participation (
    ->  IdCheval int primary key,
    ->  NomConcours varchar(30),
    -> AnneConcours year,
    ->  rank int);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank int)' at line 5
mysql> create table participation (
    -> IdCheval int primary key,
    ->   NomConcours varchar(30),
    ->  AnneConcours year);
Query OK, 0 rows affected (3.49 sec)

mysql> alter table  participation
    -> add column rank int;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank int' at line 2
mysql> alter table  participation
    -> add column score int;
Query OK, 0 rows affected (1.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc participation;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| IdCheval     | int         | NO   | PRI | NULL    |       |
| NomConcours  | varchar(30) | YES  |     | NULL    |       |
| AnneConcours | year        | YES  |     | NULL    |       |
| score        | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.25 sec)

mysql> alter table  participation
    -> add foreign key (IdCheval) references  cheval(IdCheval);
Query OK, 0 rows affected (7.45 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table  participation
    -> add foreign key (NomConcours) references  concour(nomConcous);
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'nomConcous' for constraint 'participation_ibfk_2' in the referenced table 'concour'
mysql> alter table  participation
    -> add foreign key (NomConcours) references  concour(nomConcours);
Query OK, 0 rows affected (3.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table  participation
    -> add foreign key (AnneConcours) references  concour(anne);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concour'
mysql> desc participation;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| IdCheval     | int         | NO   | PRI | NULL    |       |
| NomConcours  | varchar(30) | YES  | MUL | NULL    |       |
| AnneConcours | year        | YES  |     | NULL    |       |
| score        | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> desc concour;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| NomConcours     | varchar(30) | NO   | PRI | NULL    |       |
| Anne            | year        | NO   | PRI | NULL    |       |
| lieu            | varchar(30) | YES  |     | NULL    |       |
| NbreParticipant | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> alter table  participation
    -> add foreign key (AnneConcours) references  concour(Anne);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concour'
mysql> alter table  participation
    -> add foreign key (AnneConcours) references  concour(Anne);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concour'
mysql> alter table  participation
    -> add primary key (AnneConcours);
ERROR 1068 (42000): Multiple primary key defined
mysql> drop participation  ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'participation' at line 1
mysql> drop table participation;
Query OK, 0 rows affected (0.85 sec)

mysql> desc participation;
ERROR 1146 (42S02): Table 'ecuri.participation' doesn't exist
mysql> create table participation(
    -> IdCheval int,
    -> NomConcour varchar(30),
    -> AnneConcours year,
    -> score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours),
    -> add foreign key (AnneConcours) references  concour(Anne),
    -> add foreign key (NomConcour) references  concour(nomConcours),
    -> add foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'add foreign key (AnneConcours) references  concour(Anne),
add foreign key (NomCo' at line 7
mysql> create table participation(
    -> IdCheval int,
    -> NomConcour varchar(30),
    ->  AnneConcours year,
    ->  score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours),
    -> add foreign key (NomConcour) references  concour(nomConcours),
    -> add foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'add foreign key (NomConcour) references  concour(nomConcours),
add foreign key (' at line 7
mysql>  create table participation(
    ->  IdCheval int,
    -> NomConcour varchar(30),
    ->  AnneConcours year,
    ->  score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours),
    -> foreign key (AnneConcours) references  concour(Anne),
    ->  foreign key (NomConcour) references  concour(nomConcours),
    -> foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1072 (42000): Key column 'NomConcours' doesn't exist in table
mysql> foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foreign key (IdCheval) references  cheval(IdCheval))' at line 1
mysql> desc concour;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| NomConcours     | varchar(30) | NO   | PRI | NULL    |       |
| Anne            | year        | NO   | PRI | NULL    |       |
| lieu            | varchar(30) | YES  |     | NULL    |       |
| NbreParticipant | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.06 sec)

mysql> create table participation(
    ->  IdCheval int,
    -> NomConcour varchar(30),
    ->  AnneConcours year,
    ->  score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours),
    -> foreign key (AnneConcours) references  concour(Anne),
    -> foreign key (NomConcour) references  concour(NomConcours),
    -> foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1072 (42000): Key column 'NomConcours' doesn't exist in table
mysql>  create table participation(
    ->  IdCheval int,
    -> NomConcour varchar(30),
    ->  AnneConcours year,
    -> score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours));
ERROR 1072 (42000): Key column 'NomConcours' doesn't exist in table
mysql>  create table participation(
    ->  IdCheval int,
    ->  NomConcours varchar(30),
    ->  AnneConcours year,
    -> score int  ,
    -> primary key(IdCheval, NomConcours,AnneConcours),
    ->  foreign key (AnneConcours) references  concour(Anne),
    -> foreign key (NomConcour) references  concour(NomConcours),
    ->  foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1072 (42000): Key column 'NomConcour' doesn't exist in table
mysql>  create table participation(
    ->  IdCheval int,
    ->  NomConcours varchar(30),
    ->  AnneConcours year,
    ->  score int  ,
    ->  primary key(IdCheval, NomConcours,AnneConcours),
    -> foreign key (AnneConcours) references  concour(Anne),
    -> foreign key (NomConcours) references  concour(NomConcours),
    -> foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_1' in the referenced table 'concour'
mysql> create table participation(
    ->  IdCheval int,
    -> NomConcours varchar(30),
    -> AnneConcours year,
    -> score int  ,
    ->  foreign key (AnneConcours) references  concour(Anne),
    ->  foreign key (NomConcours) references  concour(NomConcours),
    ->  foreign key (IdCheval) references  cheval(IdCheval));
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_1' in the referenced table 'concour'
mysql>  create table participation(
    ->  IdCheval int,
    ->  NomConcours varchar(30),
    ->  AnneConcours year,
    ->  score int  ,
    ->  primary key(IdCheval, NomConcours,AnneConcours));
Query OK, 0 rows affected (0.65 sec)

mysql> desc participation;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| IdCheval     | int         | NO   | PRI | NULL    |       |
| NomConcours  | varchar(30) | NO   | PRI | NULL    |       |
| AnneConcours | year        | NO   | PRI | NULL    |       |
| score        | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table participation
    -> add foreign key (IdCheval) references cheval(IdCheval);
Query OK, 0 rows affected (2.55 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> add foreign key (NomConcours) references concour(NomConcours);
Query OK, 0 rows affected (2.57 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> add foreign key (AnneConcours) references concour(Anne);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concour'
mysql> alter table participation
    -> rename column AnneConcours to Anne;
Query OK, 0 rows affected (2.48 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    ->  add foreign key (Anne) references concour(Anne);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concour'
mysql> desc participation;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| IdCheval    | int         | NO   | PRI | NULL    |       |
| NomConcours | varchar(30) | NO   | PRI | NULL    |       |
| Anne        | year        | NO   | PRI | NULL    |       |
| score       | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> insert into personne values
    ->  (1, 'wissal','loutfi', '0612345168','agadir','directrice',null)
    -> (2, 'farah','saiza', '0624251683','marrakech','caissiare',2),
    -> (3, 'marieme','amzil', '0745224468','tanger','eleveur',3),
    -> (4, 'kebbour','lfatmi', '0648771444','marrakech','proprietaire',4);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(2, 'farah','saiza', '0624251683','marrakech','caissiare',2),
(3, 'marieme','amz' at line 3
mysql> desc personne;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IdPersonne | int         | NO   | PRI | NULL    |       |
| NomPer     | varchar(30) | YES  |     | NULL    |       |
| telephone  | int         | YES  |     | NULL    |       |
| Adresse    | varchar(30) | YES  |     | NULL    |       |
| fonction   | varchar(30) | YES  |     | NULL    |       |
| IdPerSup   | int         | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.04 sec)

mysql>  insert into personne values
    ->  (1, 'wissal', '0612345168','agadir','directrice',null),
    -> (2, 'farah','saiza', '0624251683','marrakech','caissiare',2),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql>  insert into personne values
    ->  (1, 'wissal', '0612345168','agadir','directrice',null),
    -> (2, 'farah', '0624251683','marrakech','caissiare',2),
    -> (3, 'marieme','amz, '0745224468','tanger','eleveur',3),
    '> ;
    '> ^C
mysql>  insert into personne values
    ->  (1, 'wissal', '0612345168','agadir','directrice',null),
    ->  (2, 'farah', '0624251683','marrakech','caissiare',2),
    -> (3, 'marieme', '0745224468','tanger','eleveur',3),
    -> (4, 'kebbour', '0648771444','marrakech','proprietaire',4);
Query OK, 4 rows affected (0.39 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>  select * from personne;
+------------+---------+-----------+-----------+--------------+----------+
| IdPersonne | NomPer  | telephone | Adresse   | fonction     | IdPerSup |
+------------+---------+-----------+-----------+--------------+----------+
|          1 | wissal  | 612345168 | agadir    | directrice   |     NULL |
|          2 | farah   | 624251683 | marrakech | caissiare    |        2 |
|          3 | marieme | 745224468 | tanger    | eleveur      |        3 |
|          4 | kebbour | 648771444 | marrakech | proprietaire |        4 |
+------------+---------+-----------+-----------+--------------+----------+
4 rows in set (0.04 sec)

mysql> desc race;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdRace     | int   | NO   | PRI | NULL    |       |
| PoidType   | float | YES  |     | NULL    |       |
| TailleType | float | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> alter table race;
Query OK, 0 rows affected (0.12 sec)

mysql> alter table race
    -> modify column IdRace varchar(30);
ERROR 3780 (HY000): Referencing column 'IdRace' and referenced column 'IdRace' in foreign key constraint 'cheval_ibfk_3' are incompatible.
mysql>  alter table race
    ->  modify column IdRace varchar(30) primary  key;
ERROR 1068 (42000): Multiple primary key defined
mysql> alter table race
    ->  modify  IdRace varchar(30);
ERROR 3780 (HY000): Referencing column 'IdRace' and referenced column 'IdRace' in foreign key constraint 'cheval_ibfk_3' are incompatible.
mysql>  alter table race
    -> drop column IdRace;
ERROR 1829 (HY000): Cannot drop column 'IdRace': needed in a foreign key constraint 'cheval_ibfk_3' of table 'cheval'
mysql> drop table race;
ERROR 3730 (HY000): Cannot drop table 'race' referenced by a foreign key constraint 'cheval_ibfk_3' on table 'cheval'.
mysql>  alter table race
    -> add column NomRace varchar(30);
Query OK, 0 rows affected (2.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into Race values
    -> (1,100.0,1.6,'Arabian'),
    ->  (2,100.0,1.6,'Mustang'),
    -> (3,200.0,1.9,'Andalou');
Query OK, 3 rows affected (0.40 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into cheval values
    -> (1,'Bavan',12,'white',1,1,'Arabian',3),
    ->  (2,'cisco',32,'brown',3,2,'Mustang',2),
    -> (3,'picola',57,'black',4,3,'Andalou',1),
    -> (4,'chivay',94,'brown',2,3,'Arabian',4);
ERROR 1366 (HY000): Incorrect integer value: 'white' for column 'NumTatouage' at row 1
mysql> desc cheval'
    '> ;
    '> ^C
mysql> desc cheval;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| IdCheval     | int         | NO   | PRI | NULL    |       |
| NomCheval    | varchar(30) | YES  |     | NULL    |       |
| couleur      | varchar(30) | YES  |     | NULL    |       |
| NumTatouage  | int         | YES  |     | NULL    |       |
| IdChevalMere | int         | YES  | MUL | NULL    |       |
| IdChevalPere | int         | YES  | MUL | NULL    |       |
| IdRace       | int         | YES  | MUL | NULL    |       |
| IdPerEleveur | int         | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

mysql>  insert into cheval values
    ->  (1,'Bavan','white',12,1,1,'Arabian',3),
    ->  (2,'cisco','brown',32,3,2,'Mustang',2),
    ->  (3,'picola','black',57,4,3,'Andalou',1),
    -> (4,'chivay','brown',94,2,3,'Arabian',4);
ERROR 1366 (HY000): Incorrect integer value: 'Arabian' for column 'IdRace' at row 1
mysql> alter table cheval
    -> drop column IdRace;
ERROR 1828 (HY000): Cannot drop column 'IdRace': needed in a foreign key constraint 'cheval_ibfk_3'
mysql> alter table cheval
    -> drop foreign key  IdRace;
ERROR 1091 (42000): Can't DROP 'IdRace'; check that column/key exists
mysql>  alter table cheval
    -> drop constraintIdRace;
ERROR 1091 (42000): Can't DROP 'constraintIdRace'; check that column/key exists
mysql> alter table cheval
    ->  drop constraint  IdRace;
ERROR 3940 (HY000): Constraint 'IdRace' does not exist.
mysql> insert into cheval values
    -> (1,'Bavan','white',12,1,1,1,3),
    ->   (2,'cisco','brown',32,3,2,2,2),
    ->  (3,'picola','black',57,4,3,3,1);
Query OK, 3 rows affected (0.18 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from cheval;
+----------+-----------+---------+-------------+--------------+--------------+--------+--------------+
| IdCheval | NomCheval | couleur | NumTatouage | IdChevalMere | IdChevalPere | IdRace | IdPerEleveur |
+----------+-----------+---------+-------------+--------------+--------------+--------+--------------+
|        1 | Bavan     | white   |          12 |            1 |            1 |      1 |            3 |
|        2 | cisco     | brown   |          32 |            3 |            2 |      2 |            2 |
|        3 | picola    | black   |          57 |            4 |            3 |      3 |            1 |
+----------+-----------+---------+-------------+--------------+--------------+--------+--------------+
3 rows in set (0.00 sec)

mysql> des propriateire;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'des propriateire' at line 1
mysql> show tables;
+-----------------+
| Tables_in_ecuri |
+-----------------+
| cheval          |
| concour         |
| croissance      |
| participation   |
| personne        |
| proprietaire    |
| race            |
+-----------------+
7 rows in set (0.14 sec)

mysql> desc proprietaire;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| IdPersonne | int   | NO   | PRI | NULL    |       |
| IdCheval   | int   | NO   | PRI | NULL    |       |
| PrixAchat  | float | YES  |     | NULL    |       |
| date       | year  | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
4 rows in set (0.29 sec)

mysql> insert into proprietaire values
    -> (2,1,10000,20190111),
    -> (1,2,20500,20201122),
    -> (3,3,30400,20230313);
ERROR 1264 (22003): Out of range value for column 'date' at row 1
mysql>  insert into proprietaire values
    ->  (1,2,20500,2020),
    -> (2,1,10000,2019),
    ->  (3,3,30400,2023);
Query OK, 3 rows affected (0.39 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desc concours;
ERROR 1146 (42S02): Table 'ecuri.concours' doesn't exist
mysql> desc concour;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| NomConcours     | varchar(30) | NO   | PRI | NULL    |       |
| Anne            | year        | NO   | PRI | NULL    |       |
| lieu            | varchar(30) | YES  |     | NULL    |       |
| NbreParticipant | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.06 sec)

mysql> insert into concour values
    -> ('DRESSAGE',2022,'RABAT',10),
    -> ('JUMPING',2024,'CASA',20),
    -> ('Rodeo Show',2000,'MARRAKECH,30);
    '> ^C
mysql>  insert into concour values
    ->  ('DRESSAGE',2022,'RABAT',10),
    -> ('JUMPING',2024,'CASA',20),
    ->  ('Rodeo Show',2000,'MARRAKECH',30);
Query OK, 3 rows affected (1.19 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from concour;
+-------------+------+-----------+-----------------+
| NomConcours | Anne | lieu      | NbreParticipant |
+-------------+------+-----------+-----------------+
| DRESSAGE    | 2022 | RABAT     |              10 |
| JUMPING     | 2024 | CASA      |              20 |
| Rodeo Show  | 2000 | MARRAKECH |              30 |
+-------------+------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> desc participation;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| IdCheval    | int         | NO   | PRI | NULL    |       |
| NomConcours | varchar(30) | NO   | PRI | NULL    |       |
| Anne        | year        | NO   | PRI | NULL    |       |
| score       | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> insert into participation values
    -> (1,'JUMPING', 2024, 80),
    -> (2, 'DRESSAGE', 2022, 95),
    -> (3, 'Cross Country Event', 2019, 75),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4
mysql>  insert into participation values
    -> (1,'JUMPING', 2024, 80),
    ->  (2, 'DRESSAGE', 2022, 95),
    ->  (3, 'Cross Country Event', 2019, 75);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ecuri`.`participation`, CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`NomConcours`) REFERENCES `concour` (`NomConcours`))
mysql>

