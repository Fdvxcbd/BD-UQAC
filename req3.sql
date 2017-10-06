SELECT numero, compagnie_aerienne.nom, depart, P.prix
FROM vol, aeroport a1, aeroport a2, compagnie_aerienne,
ville_desservie v1, ville_desservie v2, 
ville vi1, ville vi2, PLACE P, Classe c, infos_place i, statut s
WHERE a1.id=vol.aeroport_depart and a2.id=vol.aeroport_arrive
and v1.aeroport = a1.id and v2.aeroport = a2.id and v1.ville=
vi1.id and v2.ville=vi2.id and vi1.nom='New York City' 
and vi2.nom='Montréal'
and s.id = vol.statut and s.libelle='Ouvert Reservation' and 
P.vol = vol.id and P.classe = C.id and C.libelle = 'Business'
and vol.compagnie=compagnie_aerienne.id
and P.place = i.id and i.disponible = 'T'
GROUP BY numero, compagnie_aerienne.nom, depart
ORDER BY P.prix;