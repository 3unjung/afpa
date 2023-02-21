--  interdire la modification des réservations (on autorise l'ajout et la suppression). --
CREATE TRIGGER nomodif BEFORE UPDATE ON reservation
FOR EACH ROW
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "T'as fais chier le monde donc tu ne modifiera pas cette table.";

-- la requête de merde pour vérifier --
UPDATE  reservation SET res_id = 11, res_prix = 12.11;

-- insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations. --
CREATE TRIGGER cdelamerde BEFORE INSERT ON reservation
FOR EACH ROW
  
    INNER JOIN hotel ON res_id=hot_id;
    DECLARE i INT;
    SET i = (SELECT COUNT(*) AS nbReservation FROM reservation WHERE hot_id = '11111');

    if i = 10
    ROLLBACK TRANSACTION;
    END if;
END;
