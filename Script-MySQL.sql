CREATE DATABASE cocheskeepcoding;
show databases;
USE cocheskeepcoding;

CREATE TABLE aseguradora (
	id_aseguradora INT NOT NULL AUTO_INCREMENT,
    nombre_aseguradora VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_aseguradora)
);

INSERT INTO aseguradora(nombre_aseguradora)
VALUES ('Allianz'), ('Axa'), ('Mapfre'), ('Generali');

CREATE TABLE seguro (
	id_seguro INT NOT NULL AUTO_INCREMENT,
	n_poliza INT NOT NULL,
    id_aseguradora INT NOT NULL,
    fecha_alta_seguro DATE NOT NULL,
    PRIMARY KEY(id_seguro),
    FOREIGN KEY(id_aseguradora) REFERENCES aseguradora(id_aseguradora)
);

CREATE TABLE color (
	id_color INT NOT NULL AUTO_INCREMENT,
	nombre_color VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_color)
);

CREATE TABLE grupo (
	id_grupo INT NOT NULL AUTO_INCREMENT,
	nombre_grupo VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_grupo)
);

CREATE TABLE marca (
	id_marca INT NOT NULL AUTO_INCREMENT,
	nombre_marca VARCHAR(100) NOT NULL,
    id_grupo INT NOT NULL,
    PRIMARY KEY(id_marca),
    FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE modelo (
	id_modelo INT NOT NULL AUTO_INCREMENT,
	nombre_modelo VARCHAR(50) NOT NULL,
    id_marca INT NOT NULL,
    PRIMARY KEY(id_modelo),
    FOREIGN KEY(id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE coche (
	matricula VARCHAR(10) NOT NULL,
    id_modelo INT NOT NULL,
	id_color INT NOT NULL,
    fecha_compra DATE NOT NULL,
    kms_totales INT NOT NULL,
    PRIMARY KEY(matricula),
    FOREIGN KEY(id_modelo) REFERENCES modelo(id_modelo),
    FOREIGN KEY(id_color) REFERENCES color(id_color)
);

CREATE TABLE moneda (
	id_moneda INT NOT NULL AUTO_INCREMENT,
	nombre_moneda VARCHAR(100) NOT NULL,
    simbolo_moneda VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_moneda)
);

CREATE TABLE revision (
	id_revision INT NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(10) NOT NULL,
    kms_revision INT NOT NULL,
    fecha_revision DATE NOT NULL,
	importe_revision FLOAT NOT NULL,
    id_moneda INT NOT NULL,
    PRIMARY KEY(id_revision),
	FOREIGN KEY(matricula) REFERENCES coche(matricula),
    FOREIGN KEY(id_moneda) REFERENCES moneda(id_moneda)
);

INSERT INTO grupo(nombre_grupo)
VALUES ('Renault-Nissan-Mitsubishi Alliance'), ('PSA Peugeot S.A.'), ('Hyundai Motor Group');

INSERT INTO marca(nombre_marca, id_grupo)
VALUES
('Kia', 3),
('Hyundai', 3),
('Citroën', 2),
('Peugeot', 2),
('Renault', 1),
('Nissan', 1),
('Dacia', 1);

-- SELECT * FROM marca;

INSERT INTO modelo(nombre_modelo, id_marca)
VALUES
('Clio', 5),
('DS4', 3),
('Leaf', 6),
('Ceed', 1),
('206', 4),
('Qashqai', 6),
('Rio', 1),
('Megane', 5),
('Duster', 7),
('Tucson', 2),
('i30', 2),
('Berlingo', 3),
('5008', 4),
('Kangoo', 5),
('Lodgy', 7);

-- SELECT * FROM modelo;

ALTER TABLE moneda
ADD codigo VARCHAR(3);

INSERT INTO moneda(nombre_moneda, simbolo_moneda, codigo)
VALUES ('Euro', '€', 'EUR'), ('Dólar', '$', 'USD'), ('Peso Colombiano', '$', 'COP'), ('Peso Mexicano', '$', 'MXN');

INSERT INTO color(nombre_color)
VALUES ('Rojo'), ('Gris Plateado'), ('Blanco'), ('Negro'), ('Verde'), ('Azul');

SELECT * FROM color;

INSERT INTO coche(matricula, id_modelo, id_color, fecha_compra, kms_totales)
VALUES
('0007HHR', 7, 5, '2014-03-30', 37686),
('0326HRM', 13, 2, '2014-06-28', 105374),
('0366CKQ', 13, 2, '2003-04-10', 118687),
('0390DRK', 2, 5, '2007-03-27', 38651),
('0393DWY', 13, 1, '2007-08-02', 41340),
('0827DBB', 8, 2, '2006-07-24', 39061),
('0922JVF', 13, 4, '2017-07-06', 97321),
('1323DQL', 14, 4, '2006-01-22', 107492),
('1567JPK', 4, 2, '2016-12-03', 54278),
('1621CSY', 2, 1, '2004-10-12', 42218),
('1970BLH', 3, 1, '2002-04-18', 47354),
('2066BYF', 12, 2, '1999-03-14', 57697),
('2428HYB', 8, 5, '2014-12-04', 87006),
('2430FDP', 12, 4, '2008-06-23', 91570),
('2438GSV', 2, 2, '2010-04-17', 52349),
('2633GJF', 5, 1, '2011-02-19', 41129),
('2684FZV', 2, 4, '2008-05-10', 36859),
('2835JQN', 14, 1, '2016-11-16', 61510),
('2874BRD', 11, 6, '2000-10-01', 46794),
('2890DSR', 4, 2, '2006-07-13', 28530),
('2907GNT', 11, 4, '2012-11-08', 51508),
('3122DZN', 9, 3, '2007-12-01', 50250),
('3187KKM', 11, 1, '2019-01-14', 69946),
('3212HJW', 7, 2, '2014-08-04', 28986),
('3230KTX', 6, 4, '2019-04-16', 69200),
('3242GQG', 8, 1, '2013-03-06', 77662),
('3272JJJ', 7, 5, '2018-06-03', 27503),
('3274CYM', 6, 4, '2004-03-13', 31210),
('3306GYM', 3, 5, '2011-12-19', 76024),
('3313GGW', 2, 1, '2013-04-01', 35823),
('3883DSH', 1, 3, '2007-02-27', 35949),
('3960JYB', 14, 4, '2017-09-15', 30810),
('4221JXR', 7, 6, '2018-03-19', 50166),
('4315JKL', 9, 2, '2017-08-27', 46145),
('4325KMF', 2, 3, '2020-04-13', 49476),
('4366GZX', 10, 5, '2013-11-03', 44510),
('4389KSN', 5, 1, '2019-02-14', 30862),
('4761CVL', 10, 1, '2003-04-08', 35224),
('4896HCC', 6, 4, '2014-05-19', 45887),
('4916HJG', 6, 6, '2015-03-29', 64638),
('5022JZD', 11, 5, '2016-03-07', 63426),
('5047FJK', 2, 3, '2009-10-26', 90641),
('5188DWK', 11, 6, '2007-12-07', 74494),
('5205DFJ', 4, 2, '2006-03-04', 50972),
('5303DCG', 2, 2, '2007-08-30', 35530),
('5426HDG', 4, 4, '2015-04-01', 46759),
('5572DHP', 7, 3, '2007-06-06', 42143),
('5648JTZ', 4, 5, '2016-04-14', 61124),
('5751FCL', 4, 1, '2008-07-30', 40662),
('5851CSB', 11, 2, '2004-06-21', 39717),
('5865JKB', 10, 6, '2016-01-24', 30495),
('5899CLW', 10, 5, '2003-03-02', 35922),
('5954DWX', 6, 4, '2007-10-25', 39775),
('6010JXB', 4, 4, '2017-06-30', 46520),
('6016FWX', 15, 2, '2008-04-29', 27713),
('6231KKQ', 9, 1, '2019-04-10', 39563),
('6335BFK', 9, 5, '1999-06-06', 53657),
('6532KNR', 11, 6, '2019-03-24', 35831),
('6640FPQ', 13, 6, '2008-02-12', 38454),
('6642GZP', 10, 5, '2010-04-21', 97183),
('6708BTB', 14, 1, '2001-07-17', 44027),
('6743DYG', 7, 2, '2007-06-25', 76387),
('6756GXW', 5, 4, '2011-07-19', 112881),
('6788DRX', 11, 3, '2007-11-15', 36066),
('6850KZW', 4, 3, '2020-05-11', 25227),
('7136BCS', 5, 3, '2001-02-09', 43363),
('7221BJG', 4, 3, '1999-09-30', 70197),
('7224FDF', 13, 4, '2008-04-29', 28796),
('7295DHG', 3, 6, '2006-10-17', 34938),
('7343FRT', 1, 1, '2009-06-01', 47644),
('7457BFT', 6, 4, '2000-11-24', 39949),
('7466DMG', 1, 2, '2007-03-31', 85722),
('7489HBJ', 14, 1, '2014-10-11', 37783),
('7561CND', 11, 3, '2004-09-22', 71901),
('7631GCM', 2, 4, '2011-09-17', 31372),
('7710HMZ', 5, 5, '2014-04-09', 45773),
('7764GTD', 10, 5, '2012-10-01', 54522),
('7792CKF', 10, 5, '2003-03-02', 59984),
('7905HMT', 11, 6, '2015-10-31', 38622),
('7938HXH', 10, 2, '2015-10-24', 53342),
('7987FXL', 7, 3, '2009-01-23', 24726),
('8177JPM', 1, 2, '2016-11-27', 77082),
('8217BCW', 2, 1, '2001-12-18', 43385),
('8540DXG', 10, 2, '2007-03-13', 27722),
('8563JCM', 3, 6, '2017-10-11', 45745),
('8627FRY', 10, 3, '2008-04-02', 30083),
('8706FTV', 10, 5, '2008-05-16', 53733),
('8718CJT', 6, 4, '2005-08-23', 46682),
('8802GQX', 9, 3, '2013-04-23', 34941),
('8926GPQ', 9, 3, '2012-09-29', 42989),
('9024CVP', 6, 5, '2004-01-15', 25161),
('9157JVM', 12, 3, '2017-09-18', 41539),
('9209KGR', 13, 1, '2020-03-02', 58260),
('9281BNK', 10, 2, '2002-04-06', 35517),
('9314JHS', 6, 4, '2017-10-10', 41064),
('9412DTS', 2, 4, '2007-01-31', 54013),
('9428BCQ', 4, 5, '2002-11-12', 33451),
('9666FZC', 3, 3, '2008-03-03', 39533),
('9729KXJ', 8, 5, '2020-09-06', 76972),
('9775BVC', 11, 2, '2001-03-14', 29962);


-- SELECT * FROM moneda;

INSERT INTO revision(matricula, kms_revision, fecha_revision, importe_revision, id_moneda)
VALUES
('7343FRT',29564,'2020-07-07',1076030,3),
('2438GSV',12028,'2010-05-13',734.7,2),
('2438GSV',28312,'2016-05-17',460,1),
('9666FZC',19543,'2017-12-13',344330,3),
('7221BJG',12066,'2000-05-18',1162120,3),
('7221BJG',41764,'2008-05-24',800,1),
('6756GXW',21955,'2012-01-19',3615470,3),
('6756GXW',50738,'2012-04-02',697.5,2),
('6756GXW',74499,'2012-06-28',11869.2,4),
('6756GXW',94670,'2013-06-24',3579.6,4),
('9314JHS',24441,'2019-09-04',14695.2,4),
('7987FXL',11140,'2021-12-04',730,1),
('4325KMF',20410,'2022-07-08',7912.8,4),
('3883DSH',19245,'2014-05-16',570,1),
('3242GQG',16209,'2014-02-10',120.9,2),
('3242GQG',27845,'2014-04-27',80,1),
('3242GQG',38072,'2014-06-07',1695.6,4),
('3242GQG',49153,'2021-11-30',16767.6,4),
('4315JKL',20263,'2017-11-02',15825.6,4),
('5426HDG',16879,'2015-09-27',437.1,2),
('5426HDG',34964,'2019-08-24',2883770,3),
('6231KKQ',13755,'2021-04-04',632.4,2),
('7457BFT',16226,'2018-09-24',90,1),
('5205DFJ',23043,'2022-05-24',14883.6,4),
('3212HJW',14526,'2023-04-14',170,1),
('3313GGW',17187,'2017-12-13',1884,4),
('6642GZP',21563,'2011-01-06',3228100,3),
('6642GZP',49405,'2011-05-04',83.7,2),
('6642GZP',6945,'2023-03-11',1507.2,4),
('3306GYM',18060,'2012-04-17',1463400,3),
('3306GYM',37513,'2013-01-10',16767.6,4),
('3306GYM',58378,'2019-06-16',14883.6,4),
('5303DCG',14181,'2022-05-31',11492.4,4),
('0827DBB',24407,'2019-02-23',325.5,2),
('5047FJK',18053,'2010-02-22',5086.8,4),
('5047FJK',40390,'2010-05-03',399.9,2),
('5047FJK',63099,'2010-12-08',232420,3),
('4366GZX',21132,'2017-08-27',306.9,2),
('7561CND',13171,'2006-01-18',12622.8,4),
('7561CND',29474,'2006-02-27',2926810,3),
('7561CND',42110,'2021-04-19',74.4,2),
('5954DWX',25110,'2016-05-30',440,1),
('9157JVM',21421,'2020-12-29',390.6,2),
('0366CKQ',24801,'2003-04-28',13941.6,4),
('0366CKQ',51615,'2003-07-26',590,1),
('0366CKQ',74997,'2004-04-27',83.7,2),
('0366CKQ',90943,'2009-06-04',548.7,2),
('2907GNT',25366,'2016-03-09',753.3,2),
('2428HYB',17526,'2014-12-09',269.7,2),
('2428HYB',40875,'2015-09-05',610,1),
('2428HYB',59896,'2015-09-23',290,1),
('2428HYB',72001,'2016-05-24',399.9,2),
('6743DYG',22761,'2008-01-13',8101.2,4),
('6743DYG',34009,'2008-03-17',9608.4,4),
('6743DYG',60377,'2012-11-14',450,1),
('8706FTV',25843,'2011-12-07',3658510,3),
('1567JPK',28259,'2017-05-12',301289,3),
('8802GQX',22523,'2015-06-15',820,1),
('0922JVF',25300,'2018-11-25',602578,3),
('0922JVF',49167,'2018-12-06',6594,4),
('0922JVF',76863,'2023-05-08',8478,4),
('5022JZD',11715,'2016-05-13',430413,3),
('5022JZD',35020,'2021-04-19',539.4,2),
('8177JPM',19822,'2017-01-24',1678610,3),
('8177JPM',41924,'2017-11-25',483.6,2),
('8177JPM',57202,'2021-05-04',387372,3),
('8627FRY',16181,'2020-04-28',120.9,2),
('7938HXH',20157,'2016-09-08',186,2),
('7938HXH',34833,'2017-10-23',590,1),
('3230KTX',25879,'2019-05-13',4898.4,4),
('3230KTX',44068,'2023-02-02',688.2,2),
('7710HMZ',22300,'2022-08-28',3391.2,4),
('4221JXR',18380,'2018-06-08',50,1),
('4221JXR',38809,'2022-05-22',204.6,2),
('3272JJJ',11209,'2022-10-04',210,1),
('2633GJF',25614,'2023-07-13',3055930,3),
('5648JTZ',22988,'2017-11-12',16390.8,4),
('5648JTZ',47336,'2019-06-20',946909,3),
('1621CSY',29407,'2022-08-18',4898.4,4),
('9428BCQ',14720,'2022-05-03',16956,4),
('9412DTS',24707,'2015-05-30',46.5,2),
('9729KXJ',14348,'2020-10-11',110,1),
('9729KXJ',36512,'2021-09-13',632.4,2),
('9729KXJ',52881,'2022-04-12',3873720,3),
('2890DSR',13864,'2014-07-23',213.9,2),
('2066BYF',14097,'1999-09-04',1162120,3),
('2066BYF',28378,'2014-05-14',559537,3),
('7466DMG',19536,'2007-06-16',200,1),
('7466DMG',39863,'2007-09-26',325.5,2),
('7466DMG',56109,'2018-10-08',270,1),
('0390DRK',22339,'2015-12-01',6594,4),
('6850KZW',15206,'2023-03-05',10173.6,4),
('3960JYB',17211,'2018-08-22',158.1,2),
('9209KGR',12808,'2021-08-15',2637.6,4),
('9209KGR',31259,'2023-08-16',210,1),
('1323DQL',26924,'2006-02-11',3012890,3),
('1323DQL',49644,'2006-12-02',590,1),
('1323DQL',62371,'2007-01-03',3701550,3),
('1323DQL',90278,'2007-11-23',3572430,3),
('2684FZV',17713,'2008-06-07',455.7,2),
('6010JXB',19345,'2018-07-09',8854.8,4),
('9281BNK',15082,'2003-10-06',9043.2,4),
('0393DWY',22765,'2020-02-03',50,1),
('7792CKF',16746,'2003-05-06',560,1),
('7792CKF',37787,'2009-05-25',3830680,3),
('7905HMT',11937,'2020-07-14',590,1),
('3274CYM',17619,'2022-04-15',11869.2,4),
('5751FCL',16314,'2010-08-06',446.4,2),
('9775BVC',11436,'2001-04-27',1936860,3),
('3122DZN',27367,'2022-05-06',16202.4,4),
('7295DHG',20272,'2009-06-01',850,1),
('2874BRD',27678,'2021-12-22',232.5,2),
('8718CJT',25928,'2005-09-11',460,1),
('8563JCM',17322,'2018-05-24',720,1),
('6640FPQ',14565,'2022-10-14',350,1),
('6788DRX',15306,'2015-12-29',840,1),
('2430FDP',29114,'2009-07-10',530,1),
('2430FDP',53723,'2009-08-21',3228100,3),
('2430FDP',66643,'2011-11-06',770,1),
('5851CSB',20756,'2011-03-09',780,1),
('6708BTB',27720,'2007-01-18',7347.6,4),
('4916HJG',17802,'2015-12-22',100,1),
('4916HJG',28533,'2015-12-27',516496,3),
('4916HJG',39243,'2023-08-26',46.5,2),
('5899CLW',18724,'2013-09-10',2109020,3),
('6016FWX',15657,'2014-02-25',817785,3),
('0007HHR',23034,'2021-02-22',817785,3),
('8540DXG',15249,'2014-01-12',530.1,2),
('6335BFK',19109,'1999-09-27',9985.2,4),
('6335BFK',34682,'2009-04-14',279,2),
('3187KKM',20293,'2019-12-20',602578,3),
('3187KKM',33325,'2020-01-25',1979900,3),
('3187KKM',43580,'2021-01-15',14318.4,4),
('7631GCM',15837,'2021-11-16',830,1),
('9024CVP',13470,'2014-03-18',2668560,3),
('4761CVL',21369,'2016-08-16',2109020,3),
('7489HBJ',22207,'2019-08-02',316.2,2),
('5188DWK',23426,'2008-06-16',3572430,3),
('5188DWK',37800,'2008-09-25',670,1),
('5188DWK',60028,'2023-08-20',4898.4,4),
('7764GTD',16201,'2013-10-25',510,1),
('7764GTD',39865,'2015-03-30',1162120,3),
('7136BCS',22625,'2003-10-29',595.2,2),
('2835JQN',18893,'2018-05-05',1695.6,4),
('2835JQN',45588,'2021-08-01',669.6,2),
('4896HCC',27814,'2020-05-01',7536,4),
('5865JKB',11276,'2016-07-17',620,1),
('8926GPQ',25569,'2016-11-01',330,1),
('7224FDF',16890,'2008-11-20',3228100,3),
('1970BLH',21660,'2010-04-07',2238150,3),
('8217BCW',25009,'2020-05-08',620,1),
('0326HRM',20625,'2015-05-30',827.7,2),
('0326HRM',46451,'2015-06-11',548.7,2),
('0326HRM',62529,'2015-06-18',350,1),
('0326HRM',90819,'2016-08-25',241.8,2),
('6532KNR',19344,'2022-03-26',13753.2,4),
('4389KSN',19885,'2021-12-06',559537,3),
('5572DHP',22437,'2014-05-29',186,2);

-- SELECT * FROM aseguradora;

ALTER TABLE seguro
ADD COLUMN matricula VARCHAR(10);

ALTER TABLE seguro
ADD CONSTRAINT fk_matricula
FOREIGN KEY (matricula) REFERENCES coche(matricula);

INSERT INTO seguro(matricula,n_poliza,id_aseguradora,fecha_alta_seguro)
VALUES
('2066BYF',105112,2,'1999-03-14'),
('6335BFK',190383,2,'1999-06-06'),
('7221BJG',112320,1,'1999-09-30'),
('2066BYF',126373,4,'2000-01-12'),
('6335BFK',177717,1,'2000-05-01'),
('7457BFT',35103,3,'2000-11-24'),
('7136BCS',6062,4,'2001-02-09'),
('9775BVC',64092,4,'2001-03-14'),
('7221BJG',135515,3,'2001-04-05'),
('2874BRD',115392,3,'2002-01-17'),
('9281BNK',88106,3,'2002-04-06'),
('9428BCQ',96367,1,'2002-11-12'),
('6708BTB',124038,4,'2002-12-12'),
('7792CKF',139949,1,'2003-03-02'),
('1970BLH',102441,4,'2003-03-27'),
('4761CVL',94565,1,'2003-04-08'),
('0366CKQ',172546,2,'2003-04-10'),
('0366CKQ',172546,2,'2003-04-10'),
('0366CKQ',172546,2,'2003-04-10'),
('8217BCW',194490,3,'2003-07-13'),
('9024CVP',62061,1,'2004-01-15'),
('7792CKF',126578,3,'2004-01-30'),
('3274CYM',39780,2,'2004-03-13'),
('5899CLW',187586,1,'2004-05-18'),
('0366CKQ',111429,1,'2004-05-29'),
('5851CSB',73547,4,'2004-06-21'),
('7561CND',170914,3,'2004-09-22'),
('7561CND',170914,3,'2004-09-22'),
('1621CSY',89394,3,'2004-10-12'),
('8718CJT',20640,1,'2005-08-23'),
('1323DQL',172309,3,'2006-01-22'),
('1323DQL',172309,3,'2006-01-22'),
('1323DQL',172309,3,'2006-01-22'),
('5205DFJ',41930,1,'2006-03-04'),
('7561CND',172754,3,'2006-03-23'),
('2890DSR',16848,1,'2006-07-13'),
('0827DBB',40647,4,'2006-07-24'),
('7295DHG',55403,3,'2006-10-17'),
('1323DQL',176268,4,'2007-01-07'),
('9412DTS',82043,4,'2007-01-31'),
('3883DSH',54632,3,'2007-02-27'),
('8540DXG',71232,2,'2007-03-13'),
('7466DMG',145462,1,'2007-03-31'),
('7466DMG',145462,1,'2007-03-31'),
('5572DHP',75790,2,'2007-06-06'),
('6743DYG',116336,2,'2007-06-25'),
('6743DYG',116336,2,'2007-06-25'),
('0393DWY',73097,1,'2007-08-02'),
('5303DCG',79203,1,'2007-08-30'),
('6788DRX',7094,2,'2007-11-15'),
('5188DWK',161477,2,'2007-12-07'),
('5188DWK',161477,2,'2007-12-07'),
('6640FPQ',85627,2,'2008-02-12'),
('9666FZC',79841,1,'2008-03-03'),
('8627FRY',51353,3,'2008-04-02'),
('6016FWX',54681,3,'2008-04-29'),
('7224FDF',48113,3,'2008-04-29'),
('0390DRK',121129,2,'2008-05-01'),
('7466DMG',190418,1,'2008-05-10'),
('2684FZV',50387,3,'2008-05-10'),
('8706FTV',91503,3,'2008-05-16'),
('2430FDP',118284,4,'2008-06-23'),
('2430FDP',118284,4,'2008-06-23'),
('5751FCL',4341,1,'2008-07-30'),
('5954DWX',121919,1,'2008-08-21'),
('6743DYG',116398,3,'2008-09-16'),
('3122DZN',113718,2,'2008-11-19'),
('7987FXL',32844,4,'2009-01-23'),
('5188DWK',157749,4,'2009-03-12'),
('7343FRT',25786,1,'2009-06-01'),
('2430FDP',137325,4,'2009-10-14'),
('5047FJK',172625,3,'2009-10-26'),
('5047FJK',172625,3,'2009-10-26'),
('2438GSV',195443,1,'2010-04-17'),
('6642GZP',151249,3,'2010-04-21'),
('6642GZP',151249,3,'2010-04-21'),
('5047FJK',161701,3,'2010-10-16'),
('6756GXW',142266,3,'2011-07-19'),
('6756GXW',142266,3,'2011-07-19'),
('6756GXW',142266,3,'2011-07-19'),
('2438GSV',110761,2,'2011-08-23'),
('7631GCM',63946,1,'2011-09-17'),
('6642GZP',169829,2,'2011-12-01'),
('3306GYM',174969,4,'2011-12-19'),
('3306GYM',174969,4,'2011-12-19'),
('2633GJF',124027,3,'2012-04-19'),
('8926GPQ',26976,1,'2012-09-29'),
('7764GTD',125045,4,'2012-10-01'),
('6756GXW',159753,4,'2012-10-22'),
('2907GNT',92532,3,'2012-11-08'),
('3306GYM',173030,2,'2013-02-18'),
('3242GQG',183813,3,'2013-03-06'),
('3242GQG',183813,3,'2013-03-06'),
('3242GQG',183813,3,'2013-03-06'),
('3313GGW',85225,3,'2013-04-01'),
('4366GZX',40977,2,'2013-11-03'),
('7764GTD',136882,1,'2014-01-28'),
('8802GQX',167291,4,'2014-05-02'),
('4896HCC',8576,4,'2014-05-19'),
('0326HRM',179156,2,'2014-06-28'),
('0326HRM',179156,2,'2014-06-28'),
('0326HRM',179156,2,'2014-06-28'),
('3242GQG',187526,4,'2014-07-14'),
('7489HBJ',82585,2,'2014-10-11'),
('2428HYB',181054,4,'2014-12-04'),
('2428HYB',181054,4,'2014-12-04'),
('2428HYB',181054,4,'2014-12-04'),
('4916HJG',136600,2,'2015-03-29'),
('4916HJG',136600,2,'2015-03-29'),
('5426HDG',144573,2,'2015-04-01'),
('0326HRM',187973,4,'2015-06-19'),
('7710HMZ',190446,1,'2015-09-03'),
('0007HHR',131987,1,'2015-10-03'),
('2428HYB',161471,2,'2015-10-15'),
('7938HXH',163498,3,'2015-10-24'),
('7905HMT',56264,2,'2015-10-31'),
('3212HJW',117277,2,'2015-12-19'),
('5865JKB',86600,2,'2016-01-24'),
('4916HJG',163789,1,'2016-01-31'),
('5022JZD',173686,3,'2016-03-07'),
('5648JTZ',189152,1,'2016-04-14'),
('5426HDG',186297,4,'2016-08-24'),
('7938HXH',105002,2,'2016-10-04'),
('2835JQN',144448,1,'2016-11-16'),
('8177JPM',119373,1,'2016-11-27'),
('8177JPM',119373,1,'2016-11-27'),
('1567JPK',19347,4,'2016-12-03'),
('0922JVF',104210,3,'2017-07-06'),
('0922JVF',104210,3,'2017-07-06'),
('5022JZD',191842,2,'2017-08-09'),
('4315JKL',9482,3,'2017-08-27'),
('3960JYB',8307,3,'2017-09-15'),
('9157JVM',96770,1,'2017-09-18'),
('9314JHS',67577,1,'2017-10-10'),
('8563JCM',84213,3,'2017-10-11'),
('5648JTZ',117439,2,'2017-11-21'),
('4221JXR',174298,4,'2018-03-19'),
('8177JPM',192389,3,'2018-04-19'),
('2835JQN',108872,1,'2018-05-12'),
('3272JJJ',89739,3,'2018-06-03'),
('6010JXB',117329,3,'2018-06-05'),
('0922JVF',182094,3,'2019-01-02'),
('3187KKM',196487,4,'2019-01-14'),
('3187KKM',196487,4,'2019-01-14'),
('4221JXR',109846,4,'2019-03-11'),
('6532KNR',45918,4,'2019-03-24'),
('6231KKQ',34218,1,'2019-04-10'),
('3230KTX',146739,4,'2019-04-16'),
('9209KGR',174043,4,'2020-03-02'),
('4325KMF',12534,3,'2020-04-13'),
('6850KZW',66942,3,'2020-05-11'),
('3187KKM',189761,1,'2020-08-03'),
('9729KXJ',184039,1,'2020-09-06'),
('9729KXJ',184039,1,'2020-09-06'),
('3230KTX',127909,2,'2020-09-18'),
('4389KSN',112290,2,'2020-09-21'),
('9209KGR',118686,2,'2021-09-02'),
('9729KXJ',131978,4,'2021-12-21');

use cocheskeepcoding;

SELECT * FROM coche;

SELECT
  c.matricula AS Matricula,
  c.fecha_compra AS Fecha_Compra,
  m.nombre_modelo AS Modelo,
  ma.nombre_marca AS Marca,
  g.nombre_grupo AS Grupo,
  col.nombre_color AS Color,
  c.kms_totales AS Kms_Totales,
  s.n_poliza AS Numero_Poliza,
  a.nombre_aseguradora AS Aseguradora
FROM
  coche AS c
INNER JOIN modelo AS m ON c.id_modelo = m.id_modelo
INNER JOIN marca AS ma ON m.id_marca = ma.id_marca
INNER JOIN grupo AS g ON ma.id_grupo = g.id_grupo
INNER JOIN color AS col ON c.id_color = col.id_color
INNER JOIN (
  SELECT
    s1.matricula,
    MAX(s1.fecha_alta_seguro) AS ultima_fecha_alta_seguro
  FROM seguro AS s1
  GROUP BY s1.matricula
) AS s_max ON s_max.matricula = c.matricula
INNER JOIN seguro AS s ON s_max.matricula = s.matricula AND s_max.ultima_fecha_alta_seguro = s.fecha_alta_seguro
INNER JOIN aseguradora AS a ON s.id_aseguradora = a.id_aseguradora
ORDER BY c.matricula, c.fecha_compra DESC;
