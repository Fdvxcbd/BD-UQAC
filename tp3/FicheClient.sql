CREATE OR REPLACE VIEW FicheClient(nom, prenom, numpassport, adresse, telephone, nbReservation )
	AS SELECT DISTINCT P.NOM, P.PRENOM, Passeport.NUMERO, '(' || T.CODE_PAYS || ') ' || T.CODE_REGION || '-' || T.NUMERO,A.APP || ' ' || A.NUMERO || ' ' || A.RUE || ' ' || A.VILLE , count(RP.PERSONNE)
	   FROM Personne P, Telephone_Personne TP, Telephone T,
		   Adresse_Personne AP, Adresse A,
		   Passeport,
		   Reservation_Personne RP, Reservation R,  Etat_Reservation ER
	   WHERE P.ID = TP.PERSONNE AND TP.TELEPHONE = T.ID
	         AND P.ID = AP.PERSONNE AND AP.ADRESSE = A.ID
	         AND P.PASSEPORT = Passeport.ID
	         AND P.ID = RP.PERSONNE AND RP.RESERVATION = R.ID AND R.ETAT = ER.ID AND ER.LIBELLE LIKE '%Valide%'
	   GROUP BY P.NOM, P.PRENOM, Passeport.NUMERO, T.CODE_PAYS , T.CODE_REGION , T.NUMERO , A.APP , A.NUMERO , A.RUE , A.VILLE;
/

SELECT * FROM FicheClient;