-- supprime l'utilisateur quinella pour parrer l'érreur 1396 --
DROP USER IF EXISTS "quinella"@"localhost";
CREATE USER "quinella"@"localhost" IDENTIFIED BY "mot de passe";

-- création de l'utilisateur 2 --
DROP USER IF EXISTS"itezed"@"194.153.88.141";
CREATE USER "itezed"@"194.153.88.141" IDENTIFIED BY "just mè";

-- création de l'utilisateur 3 --
DROP USER IF EXISTS "bidule"@"194.153.88.142";
CREATE USER "bidule"@"194.153.88.142" IDENTIFIED BY "chouette";

-- attribution des prévilièges --
GRANT ALL PRIVILEGES ON "." TO "quinella"@"localhost";
GRANT SELECT ON papyrus.* TO "itezed"@"194.153.88.141";
GRANT SELECT ON papyrus.fournis TO "bidule"@"194.153.88.142";
flush PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO root@"localhost";
