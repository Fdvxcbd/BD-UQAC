SET SERVEROUTPUT ON;

-- partie visible
CREATE OR REPLACE PACKAGE Client AS
	PROCEDURE RechercherVolsOuverts(ville1 Ville.nom%TYPE, ville2 Ville.nom%TYPE, datemin DATE, datemax DATE);
	PROCEDURE EffectuerReservation(ppersonne Personne.ID%TYPE, pvol Vol.NUMERO%TYPE, pclasse Classe.LIBELLE%TYPE);
END Client;
/