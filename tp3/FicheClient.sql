CREATE OR REPLACE VIEW FicheClient(nom, prenom, numpassport, adresse, telephone, nbReservation )
AS SELECT DISTINCT P.NOM, P.PRENOM, Passport.NUMERO, A.APP || ' ' || A.NUMERO || ' ' || A.RUE || ' ' || A.VILLE, count(RP.*)
FROM Personne P, Telephone_Personne TP, Telephone T,
	Adresse_Personne AP, Adresse A,
	Passport,
	Reservation_Personne RP, Resrvation R,  Etat_Reservation ER
WHERE P.ID = TP.PERSONNE AND TP.TELEPHONE = T.ID
	AND P.ID = AP.PERSONNE AND AP.ADRESSE = A.ID
	AND P.PASSPORT = Passport.ID
	AND P.ID = RP.PERSONNE AND RP.RESERVATION = R.ID AND R.ETAT = ER.ID AND ER.LIBELLE = 'Valide'
GROUP BY P.ID;

SELECT * FROM FicheClient;