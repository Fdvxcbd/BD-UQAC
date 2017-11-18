CREATE OR REPLACE PROCEDURE OuvrirVol (
	numero VOL.NUMERO%TYPE,
	ville_depart Ville.NOM%TYPE,
	ville_arrivee Ville.NOM%TYPE,
	compagnie Compagnie_Aerienne.NOM%TYPE
) IS
	BEGIN

		-- Check if compagnie doesn't exist, we create a new one
		BEGIN
			SELECT ID into id_compagnie FROM Compagnie_Aerienne WHERE NOM = compagnie;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				INSERT INTO Compagnie_Aerienne(NOM) VALUES (compagnie);
				SELECT ID into id_compagnie FROM Compagnie_Aerienne WHERE NOM = compagnie;
		END;

		SELECT ID INTO statut_ouvert FROM STATUT WHERE LIBELLE = 'Ouvert Reservation';
		INSERT INTO VOL(NUMERO, COMPAGNIE, DEPART, ARRIVEE, AEROPORT_DEPART, AEROPORT_ARRIVE, STATUT)
			VALUES (numero, id_compagnie, ville_depart, ville_arrivee, ..., statut_ouvert);

	END;
/