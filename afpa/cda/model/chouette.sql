CREATE TABLE client(
   num_client INT AUTO_INCREMENT,
   nom_client VARCHAR(50) ,
   prenom_client VARCHAR(50) ,
   adresse_client VARCHAR(50) ,
   PRIMARY KEY(num_client)
);

CREATE TABLE station(
   num_station INT AUTO_INCREMENT,
   nom_station VARCHAR(50) ,
   PRIMARY KEY(num_station)
);

CREATE TABLE hotel(
   num_hotel INT AUTO_INCREMENT,
   capacite_hotel VARCHAR(50) ,
   categorie_hotel VARCHAR(50) ,
   nom_hotel VARCHAR(50) ,
   adresse_hotel VARCHAR(50) ,
   num_station INT NOT NULL,
   PRIMARY KEY(num_hotel),
   UNIQUE(num_station),
   FOREIGN KEY(num_station) REFERENCES station(num_station)
);

CREATE TABLE chambre(
   num_chambre VARCHAR(50) ,
   capacite_chambre VARCHAR(50) ,
   degre_confort VARCHAR(50) ,
   exposition VARCHAR(50) ,
   type_cgalbre VARCHAR(50) ,
   num_hotel INT,
   PRIMARY KEY(num_chambre),
   FOREIGN KEY(num_hotel) REFERENCES hotel(num_hotel)
);

CREATE TABLE reservation(
   num_client INT,
   num_chambre VARCHAR(50) ,
   PRIMARY KEY(num_client, num_chambre),
   FOREIGN KEY(num_client) REFERENCES client(num_client),
   FOREIGN KEY(num_chambre) REFERENCES chambre(num_chambre)
);

DECLARE @i int = 0
WHILE @i < 300 
BEGIN
    SET @i = @i + 1
    /* your code*/
END


CREATE TABLE nummer (ID INTEGER PRIMARY KEY, num, text, text2);
WITH RECURSIVE
  for(i) AS (VALUES(1) UNION ALL SELECT i+1 FROM for WHERE i < 1000000)
INSERT INTO nummer SELECT i, i+1, "text" || i, "otherText" || i FROM for;


INSERT INTO hotel(capacite_hotel, categorie_hotel, nom_hotel,adresse_hotel)
VALUES (2, "only itezed", "Quinella's hotel", "rue des koalaks");

INSERT INTO hotel(capacite_hotel, categorie_hotel, nom_hotel, adresse_hotel, num_station) VALUES(2, "Only for Itella", "Itezed's paradise", "Zaap des koalaks", 1);

SELECT num_station FROM `station` WHERE num_station > 0;

INSERT INTO hotel(capacite_hotel, categorie_hotel, nom_hotel, adresse_hotel, num_station) VALUES(?,?,?,?,?);
