CREATE OR REPLACE PACKAGE Client AS
	PROCEDURE OuvrirVol(numero VOL.NUMERO%TYPE,	ville_depart Ville.NOM%TYPE, ville_arrivee Ville.NOM%TYPE, compagnie Compagnie_Aerienne.NOM%TYPE);
	PROCEDURE ListerVolsPlusChersAVG (classe Classe.LIBELLE%TYPE);
END Client;
/