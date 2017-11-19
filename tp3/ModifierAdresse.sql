CREATE OR REPLACE PROCEDURE ModifierAdresse (
	client      Personne.ID%TYPE,
	id_adresse  Adresse.ID%TYPE,
	p_numero      Adresse.NUMERO%TYPE,
	p_app         Adresse.APP%TYPE,
	p_rue         Adresse.RUE%TYPE,
	p_ville       Adresse.VILLE%TYPE,
	p_codepostal  Adresse.CODE_POSTAL%TYPE
) IS
	BEGIN
		-- check if adress binded by 2 or more persons
		-- if adress binded by 2 or more, create new one and point to the new
		-- if not, modify directly the adress

		UPDATE Adresse
		SET NUMERO = NVL(p_numero, NUMERO),
			APP = NVL(p_app, APP),
			RUE = NVL(p_rue, RUE),
			VILLE = NVL(p_ville, VILLE),
			CODE_POSTAL = NVL(p_codepostal, CODE_POSTAL)
		WHERE ID = id_adresse;
	END;
/

SHOW ERROR;

EXECUTE ModifierAdresse(8,8,NULL, NULL, 'toto rue', 'toto ville', NULL);

Select * from Adresse where id = 8;