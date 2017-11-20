SET SERVEROUTPUT ON;

-- partie visible
CREATE OR REPLACE PACKAGE Client AS
	PROCEDURE RechercherVolsOuverts(ville1 Ville.nom%TYPE, ville2 Ville.nom%TYPE, datemin DATE, datemax DATE);
	PROCEDURE EffectuerReservation(ppersonne Personne.ID%TYPE, pvol Vol.NUMERO%TYPE, pclasse Classe.LIBELLE%TYPE);
	PROCEDURE ModifierAdresse (client Personne.ID%TYPE, id_adresse Adresse.ID%TYPE, p_numero Adresse.NUMERO%TYPE, p_app Adresse.APP%TYPE, p_rue Adresse.RUE%TYPE, p_ville Adresse.VILLE%TYPE, p_codepostal Adresse.CODE_POSTAL%TYPE);
END Client;
/