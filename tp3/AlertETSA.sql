CREATE OR REPLACE TRIGGER AlertETSA
	AFTER INSERT ON Reservation FOR EACH ROW
	BEGIN
		SELECT :new.Ville INTO destUSA from reservation where PAYS = 'USA';
		IF destUSA > 0 THEN
			DBMS_OUTPUT.PUTLINE('Vous devez avoir un ETSA');
		END IF;
	END;
/
