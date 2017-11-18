CREATE OR REPLACE PROCEDURE ModifierAdresse (
	client      Personne.ID%TYPE,
	id_adresse  Adresse.ID%TYPE,
	numero      Adresse.NUMERO%TYPE,
	app         Adresse.APP%TYPE,
	rue         Adresse.RUE%TYPE,
	ville       Adresse.VILLE%TYPE,
	codepostal  Adresse.CODE_POSTAL%TYPE
) IS
	BEGIN
		-- check if adress binded by 2 or more persons
		-- if adress binded by 2 or more, create new one and point to the new
		-- if not, modify directly the adress

		UPDATE Adresse
		SET NUMERO = numero, APP = app, RUE = rue, VILLE = ville, CODE_POSTAL = codepostal
		WHERE ID = id_adresse;
	END;
/