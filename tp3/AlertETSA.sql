CREATE OR REPLACE TRIGGER AlertETSA
AFTER INSERT ON Reservation FOR EACH ROW
	DECLARE
		destUSA Vol%ROWTYPE;
	BEGIN
		SELECT V.* INTO destUSA
		FROM Reservation_Vol RV, Vol V, Ville_Desservie VD, Ville Vi, Pays P
		WHERE RV.RESERVATION = :new.ID
		      AND RV.VOL = V.ID
		      AND V.AEROPORT_ARRIVE = VD.AEROPORT
		      AND VD.VILLE = Vi.ID
		      AND Vi.PAYS = P.ID
		      AND P.NOM = 'USA';

		-- no exception == this record is in USA
		DBMS_OUTPUT.PUT_LINE('Il est necessaire au client de posseder l ETSA');

		EXCEPTION
		-- No data found == not in USA
		WHEN NO_DATA_FOUND THEN NULL;
	END;
/