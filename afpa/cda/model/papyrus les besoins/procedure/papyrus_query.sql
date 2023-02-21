-- Créez la procédure stockée Lst_fournis correspondant à la requête n°2 afficher le code des fournisseurs pour lesquels une commande a été passée. --

DELIMITER !!
CREATE PROCEDURE liste_fournisseurs()
BEGIN
	SELECT f.nomfou, e.numcom, e.datcom FROM entcom AS e INNER JOIN fournis AS f ON e.numfou = f.numfou ORDER BY f.nomfou;

END !!
DELIMITER ;


-- Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom (cette requête sera construite à partir de la requête n°11). --

DELIMITER ??
CREATE PROCEDURE liste_commandes()
BEGIN
    SELECT * from entcom WHERE entcom.obscom = "Commande Urgente";
END ??
DELIMITER ;

-- Créer la procédure stockée CA_ Fournisseur, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée (cette requête sera construite à partir de la requête n°19).  --

DELIMITER //
CREATE PROCEDURE chiffre_affaire_fournisseur()
BEGIN
    SELECT nomfou, SUM(prix1 * qte1 + prix2 * qte2 + prix3 * qte3) * 1.2 AS chiffreAffairefou FROM fournis INNER JOIN vente ON fournis.numfou = vente.numfou GROUP BY vente.numfou;

END //
DELIMITER ;
