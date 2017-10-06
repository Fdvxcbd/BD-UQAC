SELECT P.nom, prenom, pass.numero
FROM vol, aeroport a2, ville_desservie v2, ville vi2,
Reservation_Personne rp, Reservation r, reservation_vol rv, type_personne tp,
pays pa, Province_Pays pp, Personne P, Passport pass, adresse_Personne ap, adresse a
WHERE P.passeport = pass.id and p.id = ap.personne and ap.adresse=a.id 
and a.pays = pp.pays and a.province=pp.province
and pp.pays = pa.id and pa.nom='France'
and rp.personne = p.id and rp.reservation = r.id
and r.id = rv.reservation and rv.vol = vol.id
and a2.id=vol.aeroport_arrive and vol.AEROPORT_ARRIVE=a2.id
and v2.aeroport = a2.id and v2.ville=vi2.id  
and vi2.nom='Paris' and tp.id = P.type_personne and tp.type='Client'
GROUP BY nom, prenom, pass.numero;