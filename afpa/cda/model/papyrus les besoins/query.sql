/* 1- */ SELECT e.obscom, e.datcom FROM entcom AS e WHERE e.numfou = 09120; 
/* 2- */ SELECT numfou, datcom, obscom from entcom; 
/* 3- */ SELECT count(DISTINCT numcom), COUNT(DISTINCT numfou) FROM entcom;
/* 4- */ SELECT codart, libart, stkphy, stkale, qteann FROM produit WHERE stkphy < stkale AND qteann < 1000; 
/* 5- */ SELECT SUBSTRING(posfou, 1, 2) AS depfou, nomfou FROM fournis HAVING depfou IN ('75', '78', '92', '77') ORDER BY depfou DESC, nomfou ASC;   
/* 6- */ SELECT * FROM ligcom WHERE MONTH(derliv) = 3 OR MONTH(derliv) = 4;
/* 7- */ 
/* 8- */ SELECT codart, priuni * qtecde AS total FROM ligcom ORDER BY total;
/* 9- */ SELECT numcom, SUM(priuni * qtecde) AS total FROM ligcom WHERE qtecde < 1000 GROUP BY numcom HAVING total > 10000;
/* 10- */ SELECT f.nomfou, e.numcom, e.datcom FROM entcom AS e INNER JOIN fournis AS f ON e.numfou = f.numfou ORDER BY f.nomfou;
/* 11- */ SELECT * from entcom WHERE entcom.obscom = "Commande Urgente";
/* 19- */ SELECT nomfou, SUM(prix1 * qte1 + prix2 * qte2 + prix3 * qte3) * 1.2 AS chiffreAffairefou FROM fournis INNER JOIN vente ON fournis.numfou = vente.numfou GROUP BY vente.numfou; 

