-- 1 - Liste des contacts français : --
SELECT CompanyName, ContactName,ContactTitle, phone FROM customers WHERE customers.Country = "France"; 

-- 2 - Produits vendus par le fournisseur « Exotic Liquids » : --
SELECT products.productName, UnitPrice FROM products INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID WHERE companyName = "Exotic Liquids";


-- 3- Produits vendus par les fournisseurs Français dans l’ordre décroissant-- 
SELECT suppliers.CompanyName, COUNT(DISTINCT products.ProductID) FROM order_details JOIN products ON order_details.ProductID=products.ProductID JOIN suppliers ON products.SupplierID=suppliers.SupplierID WHERE suppliers.Country = "France" SORT ORDER BY suppliers.SupplierID DESC; 


-- 4 - Liste des clients Français ayant plus de 10 commandes : --
SELECT customers.CompanyName AS client, COUNT(orders.OrderID) AS nombre_commandes FROM customers JOIN orders ON customers.CustomerID=orders.CustomerID WHERE customers.Country = "France" GROUP BY customers.CompanyName HAVING nombre_commandes > 10;


-- 5- Liste des clients ayant un chiffre d’affaires > 30.000 --
SELECT customers.CompanyName as Client, SUM(order_details.UnitPrice*order_details.Quantity) AS CA, customers.Country as Pays FROM customers INNER JOIN orders ON customers.CustomerID=orders.CustomerID INNER JOIN order_details ON orders.OrderID=order_details.OrderID GROUP BY customers.CustomerID HAVING CA > 30000 ORDER BY CA DESC;

-- 6- Liste des pays dont les clients ont passé commande de produits fournis par « Exotic --
SELECT DISTINCT customers.Country FROM customers JOIN orders ON customers.CustomerID=orders.CustomerID WHERE orders.orderID IN
(SELECT OrderID FROM order_details WHERE ProductID IN (SELECT ProductID FROM suppliers JOIN products ON suppliers.SupplierID = products.SupplierID WHERE CompanyName = "Exotic Liquids"))
ORDER BY customers.Country;


-- 8 – Montant des ventes de 1997 : --
SELECT MONTH(orders.OrderDate) AS Mois, SUM(UnitPrice*Quantity) AS Montant_Ventes FROM order_details
INNER JOIN orders ON order_details.OrderId=orders.OrderID WHERE YEAR(orders.OrderDate) = 1997 GROUP BY MOIS;


-- 9- Depuis quelle date le client « Du monde entier » n’a plus commandé ? --
SELECT MAX(orderDate) AS "Date de la dernière commande" FROM orders INNER JOIN customers ON orders.CustomerID=customers.CustomerID;


--10 – Quel est le délai moyen de livraison en jours ? --
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) FROM orders;
