SET SERVEROUTPUT ON;
SHOW ERRORS;
-- partie visible
CREATE OR REPLACE PACKAGE Client AS
PROCEDURE RechercherVolsOuverts(villeDep Ville.nom%type, villeAr Ville.nom%type, datemin date, datemax date);
END Client;
/
-- partie cachée
CREATE OR REPLACE PACKAGE BODY Client AS PROCEDURE RechercherVolsOuverts(villeDep Ville.nom%type, villeAr Ville.nom%type, datemin date, datemax date) IS
BEGIN

FOR tcur IN (SELECT v.numero
FROM Vol v, Aeroport a1, ville_desservie vd1, ville v1, aeroport a2, ville_desservie vd2, ville v2
WHERE v1.nom = villeDep AND v2.nom = villeAr AND v.depart >= datemin AND v.arrivee <= datemax AND v.aeroport_depart = a1.id AND a1.id = vd1.aeroport AND vd1.ville=v1.id AND v.aeroport_arrive = a2.id AND a2.id = vd2.aeroport AND vd2.ville=v2.id) LOOP
DBMS_OUTPUT.PUT_LINE('num vol: ' || tcur.numero);
END LOOP;


END RechercherVolsOuverts;
END Client;
/
