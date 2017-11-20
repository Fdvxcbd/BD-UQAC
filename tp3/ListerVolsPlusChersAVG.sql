!clear

CREATE OR REPLACE FUNCTION avgVol(classe Classe.LIBELLE%TYPE)
	RETURN FLOAT IS
	moyenne FLOAT;
	BEGIN
		SELECT AVG(P.PRIX) INTO moyenne
		FROM Place P, Vol V, Statut S, Classe C
		WHERE P.VOL = V.ID AND V.STATUT = S.ID AND S.LIBELLE LIKE '%Ouvert%'
			AND P.CLASSE = C.ID AND C.LIBELLE = classe;
		RETURN moyenne;
	END;
/
SHOW ERROR;


CREATE OR REPLACE PROCEDURE ListerVolsPlusChersAVG (
	classe Classe.LIBELLE%TYPE
) AS
	moyenne FLOAT;
	BEGIN
		moyenne := avgVol(classe);
		dbms_output.put_line(moyenne);
		FOR rec IN (
			SELECT DISTINCT V.*
			FROM Vol V, PLACE P, STATUT S, CLASSE C
			WHERE V.ID = P.VOL AND P.CLASSE = C.ID AND C.LIBELLE = classe
		      AND V.STATUT = S.ID AND S.LIBELLE LIKE '%Ouvert%'
		      AND P.Prix > moyenne
		) LOOP
		dbms_output.put_line(rec.NUMERO || ' ' || rec.COMPAGNIE || ' ' || rec.DEPART || ' ' || rec.ARRIVEE
		                     || ' ' || rec.AEROPORT_DEPART || ' ' || rec.AEROPORT_ARRIVE || ' ' || rec.STATUT);
		END LOOP;

	END;
/

SHOW ERROR;

EXECUTE ListerVolsPlusChersAVG('Business');