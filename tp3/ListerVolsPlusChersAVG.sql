!clear

SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION avgVol(p_classe Classe.LIBELLE%TYPE)
	RETURN PLS_INTEGER IS
	moyenne PLS_INTEGER;
	BEGIN
		SELECT AVG(P.PRIX) INTO moyenne
		FROM Place P, Vol V, Statut S, Classe C
		WHERE P.VOL = V.ID AND V.STATUT = S.ID AND S.LIBELLE LIKE '%Ouvert%'
			AND P.CLASSE = C.ID AND C.LIBELLE = p_classe;
		RETURN moyenne;
	END;
/

CREATE OR REPLACE PROCEDURE ListerVolsPlusChersAVG (
	p_classe Classe.LIBELLE%TYPE
) AS
	moyenne PLS_INTEGER;
	BEGIN
		moyenne := avgVol(p_classe);
		FOR rec IN (
			SELECT V.*, P.Prix
			FROM Vol V, PLACE P, STATUT S, CLASSE C
			WHERE V.ID = P.VOL AND P.CLASSE = C.ID AND C.LIBELLE = p_classe
		      AND V.STATUT = S.ID AND S.LIBELLE LIKE '%Ouvert%'
		      AND P.Prix > moyenne
		) LOOP
		dbms_output.put_line('Prix ' ||rec.Prix ||' '||rec.NUMERO || ' ' || rec.COMPAGNIE || ' ' || rec.DEPART || ' ' || rec.ARRIVEE
		                     || ' ' || rec.AEROPORT_DEPART || ' ' || rec.AEROPORT_ARRIVE || ' ' || rec.STATUT);
		END LOOP;

	END;
/

SHOW ERROR;

EXECUTE ListerVolsPlusChersAVG('Business');
