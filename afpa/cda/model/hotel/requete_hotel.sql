/* 1- */ SELECT hot_nom, hot_ville FROM hotel;
/* 2- */ SELECT cli_nom, cli_prenom, cli_adresse, cli_ville from client where cli_nom = "White";
/* 3- */ SELECT sta_nom, sta_altitude from station WHERE sta_altitude < 1000;
/* 4- */ SELECT cha_numero, cha_capacite from chambre WHERE cha_capacite > 1;
/* 5- */ SELECT cli_nom, cli_prenom, cli_ville FROM client WHERE cli_ville != "londre"; 
/* 6- */ SELECT hot_nom, hot_ville, hot_categorie FROM hotel WHERE hot_ville = "Bretou" && hot_categorie > 3;
/* 7- */ SELECT s.sta_nom, h.hot_nom, h.hot_categorie, h.hot_ville FROM station AS s INNER JOIN hotel AS h ON s.sta_id = h.hot_sta_id
/* 8- */ SELECT c.cha_numero, h.hot_categorie, h.hot_nom, h.hot_ville, h.hot_adresse FROM chambre AS c INNER JOIN hotel AS h ON c.cha_id=h.hot_id; 
/* 9- */ SELECT c.cha_numero, c.cha_capacite, h.hot_nom, h.hot_categorie, h.hot_adresse, h.hot_ville from chambre AS c RIGHT JOIN hotel AS h ON c.cha_id=h.hot_id WHERE c.cha_capacite > 1 AND h.hot_ville = "Bretou";
/* 10- */ SELECT r.res_date, c.cli_prenom, c.cli_nom, h.hot_nom from reservation as r INNER JOIN client as c ON r.res_id=c.cli_id INNER JOIN hotel as h ON r.res_id=h.hot_id;
/* 11- */ SELECT s.sta_nom, h.hot_nom, c.cha_numero, c.cha_capacite from station AS s INNER JOIN hotel as h ON s.sta_id=h.hot_id INNER JOIN chambre as c ON h.hot_id=c.cha_id;
/* 12- */ SELECT r.res_date, r.res_date_debut, r.res_date_fin, c.cli_prenom, c.cli_nom, h.hot_nom from reservation as r INNER JOIN client as c ON r.res_id=c.cli_id INNER JOIN hotel as h ON r.res_id=h.hot_id;
/* 13- */ SELECT COUNT(*), hot_sta_id FROM hotel GROUP BY hot_sta_id;
/* 14- */ SELECT COUNT(*) FROM chambre INNER JOIN hotel ON hotel.hot_id = chambre.cha_hot_id GROUP BY hot_sta_id;
/* 15- */ SELECT COUNT(*) FROM chambre INNER JOIN hotel ON hotel.hot_id = chambre.cha_hot_id WHERE chambre.cha_capacite > 1 GROUP BY hot_sta_id
/* 16- */ SELECT hot_nom FROM hotel INNER JOIN reservation ON hotel.hot_id=reservation.res_id INNER JOIN client ON reservation.res_id=client.cli_id WHERE client.cli_nom = "Squire"; 
/* 17- */ SELECT AVG(DATEDIFF(res_date_fin, res_date_debut)) FROM reservation AS r INNER JOIN chambre AS c ON r.res_cha_id = c.cha_id INNER JOIN hotel AS h ON c.cha_hot_id = h.hot_id INNER JOIN station AS s ON h.hot_sta_id = s.sta_id GROUP BY sta_id;
