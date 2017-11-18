CREATE OR REPLACE PROCEDURE RechercherVolsOuverts (
	ville1 Ville.NOM%TYPE,
	ville2 Ville.NOM%TYPE,
	date_depart Vol.DEPART%TYPE,
	date_arrivee VOL.ARRIVEE%TYPE
) IS
BEGIN
	SELECT V.*
	FROM VOL V, Ville_Desservie VD_depart, Ville V_depart, Ville_desservie VD_arrivee, ville V_arrivee
	WHERE V.DEPART >= date_depart AND V.ARRIVEE <= date_arrivee
	AND V.AEROPORT_DEPART = VD_depart.ID and VD_depart.VILLE = V.ID AND V.nom IN [ville1, ville2]
	AND V.AEROPORT_ARRIVEE = VD_ARRIVEE.ID and VD_ARRIVEE.VILLE = V.ID AND V.nom IN [ville1, ville2]
END;