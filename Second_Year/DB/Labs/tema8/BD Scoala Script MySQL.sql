-- Baza de date SCOALA --

-- Ajuta la re-crearea tabelelor (cand deja exista)
DROP TABLE Nota;
DROP TABLE Student;
DROP TABLE Examen;
DROP TABLE Adresa;
-- -------------------------------------------------

CREATE TABLE Adresa (
	CODA double NOT NULL ,
	FEL varchar (7) NOT NULL ,
	LOCALITATE varchar (20) NOT NULL ,
	STRADA varchar (20) NOT NULL ,
	NUMAR varchar (5) NOT NULL);

CREATE TABLE Examen (
	CODE double NOT NULL ,
	TITLU_MAT varchar (20) NOT NULL ,
	NUME_P varchar (40) NOT NULL ,
FEL_EXAMEN varchar (8) NOT NULL);

CREATE TABLE Student (
	NR_MATR double NOT NULL ,
	NUME varchar (20) NOT NULL ,
	PRENUME varchar (20) NOT NULL ,
	DATA_N datetime NULL ,
	GEN char (1) NOT NULL ,
	GRUPA double NULL ,
	SOT double NULL ,
	RESP_GRUPA double NULL ,
	CODA double NOT NULL );

CREATE TABLE Nota (
	NR_MATR double NOT NULL ,
	CODE double NOT NULL ,
	NOTA double NOT NULL );

Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('1','Parinti','Cluj-Napoca','Herculane','00010');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('2','Camin','Cluj-Napoca','Observator','00007');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('3','Gazda','Cluj-Napoca','13 Septembrie','00005');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('4','Parinti','Cluj-Napoca','Bizusa','00002');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('5','Camin','Cluj-Napoca','Hasdeu','00003');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('6','Gazda','Cluj-Napoca','Snagov','00001');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('7','Parinti','Cluj-Napoca','D. Cantemir','00020');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('8','Camin','Cluj-Napoca','Observator','00010');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('9','Gazda','Cluj-Napoca','Horea','00042');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('10','Parinti','Cluj-Napoca','N. Balcescu','00003');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('11','Parinti','Cluj-Napoca','Turzii','00103');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('12','Parinti','Cluj-Napoca','Borsec','00003');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('13','Parinti','Cluj-Napoca','Ciucas','00024');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('14','Parinti','Cluj-Napoca','Rodna','00120');
Insert into ADRESA (CODA,FEL,LOCALITATE,STRADA,NUMAR) values ('15','Parinti','Cluj-Napoca','Florilor','00018');

Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('1','Baze de Date','Lelutiu','Examen');
Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('2','Baze de Date','Ungureanu','Proiect');
Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('3','Pedagogie','Ignat','Colocviu');
Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('4','Istorie','Nistor','Colocviu');
Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('5','Baze de Date','Dollinger','Proiect');
Insert into EXAMEN (CODE,TITLU_MAT,NUME_P,FEL_EXAMEN) values ('6','Sisteme de Operare','Ignat','Examen');

Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('1','Aiben','Angela',str_to_date('12/20/2002','%m/%d/%Y'),'F','3241','7','10','3');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('2','Belc','Viorel',str_to_date('05/27/2002','%m/%d/%Y'),'M','3241',null,'10','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('3','Berindean','Coralia',str_to_date('03/21/2001','%m/%d/%Y'),'F','3241',null,'10','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('4','Butmalai','Catalin',str_to_date('02/26/2002','%m/%d/%Y'),'M','3241','15','10','1');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('5','Brad','Marilena',str_to_date('05/14/2004','%m/%d/%Y'),'F','3241',null,'10','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('6','Costin','Ovidiu',str_to_date('07/27/2004','%m/%d/%Y'),'M','3241',null,'10','4');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('7','Costin','Radu',str_to_date('11/04/2004','%m/%d/%Y'),'M','3241','1','10','3');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('8','Demian','Calin',str_to_date('08/04/2004','%m/%d/%Y'),'M','3241','21','10','6');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('9','Dragan','Teodora',str_to_date('09/23/2004','%m/%d/%Y'),'F','3241','12','10','6');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('10','Kiss','Zoltan',str_to_date('01/27/2004','%m/%d/%Y'),'M','3241',null,null,'7');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('11','Tabirta','Vadim',str_to_date('07/30/2004','%m/%d/%Y'),'M','3241',null,'10','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('12','Harangus','Dan',str_to_date('01/20/2004','%m/%d/%Y'),'M','3241','9','20','6');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('13','Muresan','Mirel',str_to_date('01/23/2004','%m/%d/%Y'),'M','3241',null,'20','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('14','Pacurar','Gheorghe',str_to_date('07/24/2004','%m/%d/%Y'),'M','3241',null,'20','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('15','Prata','Adriana',str_to_date('12/26/2004','%m/%d/%Y'),'F','3241','4','20','1');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('16','Sasebes','Claudiu',str_to_date('10/04/2004','%m/%d/%Y'),'M','3241',null,'20','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('17','Roman','Adrian',str_to_date('10/27/2004','%m/%d/%Y'),'M','3241',null,'20','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('18','Tocaciu','Radu',str_to_date('03/28/2004','%m/%d/%Y'),'M','3241',null,'20','10');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('19','Toderici','Leontin',str_to_date('07/03/2000','%m/%d/%Y'),'M','3241',null,'20','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('20','Tudor','Dan',str_to_date('03/22/2004','%m/%d/%Y'),'M','3241',null,null,'5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('21','Vonica','Cosmina',str_to_date('10/02/2004','%m/%d/%Y'),'F','3241','8','20','6');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('22','Rus','Mircea',str_to_date('06/26/2004','%m/%d/%Y'),'M','3241',null,'20','9');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('23','Alexandru','Mihai',str_to_date('06/23/2000','%m/%d/%Y'),'M','3242',null,null,'8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('24','Babota','Radu',str_to_date('07/29/2004','%m/%d/%Y'),'M','3242',null,'23','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('25','Ceuca','Dana',str_to_date('09/03/2004','%m/%d/%Y'),'F','3242','40','23','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('26','Cornea','Stelian',str_to_date('11/16/2000','%m/%d/%Y'),'M','3242',null,'23','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('27','Cristea','Titus',str_to_date('09/22/2004','%m/%d/%Y'),'F','3242',null,'23','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('28','Galea','Gabriela',str_to_date('10/21/2004','%m/%d/%Y'),'M','3242',null,'23','6');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('29','Iosivas','Mihai',str_to_date('06/26/2004','%m/%d/%Y'),'M','3242',null,'23','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('30','Lupu','Cristian',str_to_date('12/25/2004','%m/%d/%Y'),'M','3242',null,'23','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('31','Petrescu','Amelia',str_to_date('05/21/2004','%m/%d/%Y'),'F','3242',null,'23','11');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('32','Mirza','Narcis',str_to_date('09/26/2004','%m/%d/%Y'),'M','3242',null,'23','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('33','Cistelecan','Dana',str_to_date('07/02/2004','%m/%d/%Y'),'F','3242',null,'23','12');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('34','Mindru','Adrian',str_to_date('01/23/2004','%m/%d/%Y'),'M','3242',null,'36','14');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('35','Moldovan','Steliana',str_to_date('03/18/2004','%m/%d/%Y'),'F','3242',null,'36','13');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('36','Muresan','Ovidiu',str_to_date('07/20/2004','%m/%d/%Y'),'M','3242',null,null,'10');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('37','Paius','Radu',str_to_date('02/28/2004','%m/%d/%Y'),'M','3242',null,'36','5');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('38','Plesca','Miana',str_to_date('09/22/2004','%m/%d/%Y'),'F','3242',null,'36','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('39','Preda','Razvan',str_to_date('09/25/2004','%m/%d/%Y'),'M','3242',null,'36','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('40','Rusu','Ovidiu',str_to_date('10/07/2004','%m/%d/%Y'),'M','3242','25','36','2');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('41','Schillo','Alexandru',str_to_date('06/02/2004','%m/%d/%Y'),'M','3242',null,'36','14');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('42','Topircean','Ioan',str_to_date('12/19/2004','%m/%d/%Y'),'M','3242',null,'36','8');
Insert into STUDENT (NR_MATR,NUME,PRENUME,DATA_N,GEN,GRUPA,SOT,RESP_GRUPA,CODA) values ('43','Zetea','Tudor',str_to_date('02/19/2004','%m/%d/%Y'),'M','3242',null,'36','15');

Insert into NOTA (NR_MATR,CODE,NOTA) values ('1','1','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('2','1','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('3','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('4','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('5','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('6','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('7','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('8','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('9','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('10','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('11','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('12','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('13','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('14','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('15','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('16','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('17','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('18','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('19','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('20','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('21','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('22','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('23','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('24','1','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('25','1','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('26','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('27','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('28','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('29','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('30','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('31','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('32','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('33','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('34','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('35','1','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('36','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('37','1','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('38','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('39','1','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('40','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('41','1','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('42','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('43','1','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('1','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('2','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('3','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('4','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('6','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('7','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('8','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('9','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('10','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('11','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('12','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('13','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('14','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('15','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('16','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('17','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('18','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('19','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('20','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('21','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('22','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('23','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('24','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('25','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('26','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('27','2','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('28','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('29','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('30','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('31','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('32','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('33','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('34','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('36','2','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('37','2','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('38','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('39','2','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('40','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('41','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('42','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('43','2','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('1','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('2','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('3','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('4','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('5','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('6','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('7','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('8','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('9','3','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('10','3','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('11','3','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('12','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('13','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('14','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('15','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('16','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('17','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('18','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('19','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('20','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('21','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('22','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('23','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('24','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('25','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('26','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('27','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('28','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('29','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('30','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('31','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('32','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('33','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('34','3','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('35','3','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('36','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('37','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('38','3','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('39','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('40','3','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('41','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('42','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('43','3','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('1','4','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('2','4','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('3','4','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('4','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('5','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('6','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('7','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('8','4','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('9','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('10','4','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('11','4','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('12','4','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('13','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('14','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('15','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('16','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('17','4','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('18','4','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('19','4','5');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('20','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('21','4','6');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('22','4','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('23','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('24','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('25','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('26','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('27','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('28','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('29','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('30','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('31','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('32','5','9');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('33','5','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('34','5','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('35','5','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('36','5','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('37','5','7');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('38','5','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('39','5','8');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('40','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('41','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('42','5','10');
Insert into NOTA (NR_MATR,CODE,NOTA) values ('43','5','10');

ALTER TABLE Adresa ADD CONSTRAINT PK_Adresa PRIMARY KEY (CODA);

ALTER TABLE Examen ADD CONSTRAINT PK_Examen PRIMARY KEY (CODE);

ALTER TABLE Student ADD CONSTRAINT PK_Student PRIMARY KEY (NR_MATR);

ALTER TABLE Nota ADD CONSTRAINT PK_Nota PRIMARY KEY (NR_MATR, CODE);

ALTER TABLE Student ADD 
	CONSTRAINT FK_student_adresa FOREIGN KEY (CODA) REFERENCES Adresa (CODA);
ALTER TABLE Student ADD 
  CONSTRAINT FK_student_resp_grupa FOREIGN KEY (RESP_GRUPA) REFERENCES Student (NR_MATR);
ALTER TABLE Student ADD 
	CONSTRAINT FK_student_sot FOREIGN KEY (SOT)
        REFERENCES Student (NR_MATR);

ALTER TABLE Nota ADD 
	CONSTRAINT FK_nota_examen FOREIGN KEY (CODE)
        REFERENCES Examen (CODE);
ALTER TABLE Nota ADD 
	CONSTRAINT FK_nota_student FOREIGN KEY (NR_MATR)
        REFERENCES Student (NR_MATR);

ALTER TABLE adresa ADD
  CONSTRAINT CK_adresa_coda_pozitiv CHECK (CODA > 0);
ALTER TABLE adresa ADD
	CONSTRAINT CK_adresa_fel CHECK (FEL = 'Camin' or
                          FEL = 'Gazda' or FEL = 'Parinti');

ALTER TABLE Examen ADD CONSTRAINT CK_Examen_CODE_pozitiv CHECK (CODE > 0);

ALTER TABLE Student ADD 
	CONSTRAINT CK_Student_GRUPA CHECK (GRUPA > 0);
ALTER TABLE Student ADD 
	CONSTRAINT CK_Student_NR_MATR_pozitiv CHECK (NR_MATR > 0);
ALTER TABLE Student ADD 
  CONSTRAINT CK_Student_GEN CHECK (GEN IN ('M', 'F'));

ALTER TABLE Nota ADD CONSTRAINT CK_Nota_NOTA CHECK (NOTA >= 4
                                              and NOTA <= 10);

