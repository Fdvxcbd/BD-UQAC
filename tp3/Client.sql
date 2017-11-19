SET SERVEROUTPUT ON;

-- partie visible
CREATE OR REPLACE PACKAGE Client AS
    PROCEDURE RechercherVolsOuverts(ville1 Ville.nom%type, ville2 Ville.nom%type, datemin date, datemax date);
    PROCEDURE EffectuerReservation(ppersonne Personne.ID%TYPE, pvol Vol.NUMERO%TYPE, pclasse Classe.LIBELLE%TYPE);
END Client;
/

-- partie cachee
CREATE OR REPLACE PACKAGE BODY Client AS PROCEDURE RechercherVolsOuverts(ville1 Ville.nom%type, ville2 Ville.nom%type, datemin date, datemax date) IS
BEGIN
FOR tcur IN (SELECT v.numero
FROM Vol v, Aeroport a1, ville_desservie vd1, ville v1, aeroport a2, ville_desservie vd2, ville v2
WHERE v1.nom = ville1 AND v2.nom = ville2 AND v.depart >= datemin AND v.arrivee <= datemax AND v.aeroport_depart = a1.id AND a1.id = vd1.aeroport AND vd1.ville=v1.id AND v.aeroport_arrive = a2.id AND a2.id = vd2.aeroport AND vd2.ville=v2.id) LOOP
DBMS_OUTPUT.PUT_LINE('num vol: ' || tcur.numero);
END LOOP;


END RechercherVolsOuverts;
----------------------------------------------------------------
PROCEDURE EffectuerReservation (
    ppersonne    Personne.ID%TYPE,
    pvol         Vol.NUMERO%TYPE,
    pclasse      Classe.LIBELLE%TYPE
) IS
idPlace Place%ROWTYPE;
pasDePlace EXCEPTION;
    BEGIN

        Select pl.vol, pl.classe, pl.place, pl.prix into idPlace from Infos_Place p, Place pl, Classe c, Vol v where c.libelle=pclasse AND v.numero = pvol AND v.id = pl.vol and pl.classe = c.id and pl.Place = p.id and p.Disponible = 'T';

        -- exception if no place available
        if (idPlace.vol is null) then
            RAISE pasDePlace;
        end if;
        -- Réserver vol
        UPDATE Infos_Place set Disponible = 'F' WHERE idPlace.Place = Infos_Place.id;
        INSERT INTO Reservation VALUES(5, 'r5', TO_DATE('1/1/2017', 'DD/mm/YYYY'), 1);
        INSERT INTO Reservation_Vol VALUES(idPlace.vol, 5);
        INSERT INTO Reservation_Personne VALUES(ppersonne, 5);

EXCEPTION
    when pasDePlace then
        dbms_output.put_line('Pas de place sur ce vol');
END EffectuerReservation;



END Client;
/
SHOW ERRORS;

