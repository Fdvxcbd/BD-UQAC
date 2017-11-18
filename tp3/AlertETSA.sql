CREATE OR REPLACE TRIGGER AlertETSA
	AFTER INSERT ON Reservation FOR EACH ROW
	BEGIN
		SELECT V.* INTO destUSA
		FROM Reservation_Vol RV, Vol V, Ville_Desservie VD, Ville V, Pays P
		WHERE RV.RESERVATION = :new.ID
			AND RV.VOL = V.ID
			AND V.AEROPORT_ARRIVE = VD.AEROPORT
			AND VD. VILLE = V.ID
			AND V.PAYS = P.ID
			AND P.NOM = 'USA';

		-- no exception == this record is in USA
		DBMS_OUTPUT.PUTLINE('Il est necessaire au client de posseder l ETSA');

	EXCEPTION
		-- No data found == not in USA
		WHEN NO_DATA_FOUND THEN NULL;
	END;
/
