SELECT numero, Compagnie_Aerienne.nom, depart
FROM vol, aeroport a1, aeroport a2, ville_desservie v1, ville_desservie v2, ville vi1, ville vi2, Compagnie_Aerienne, Statut
WHERE vol.depart<'2018/01/01'
and a1.id=vol.aeroport_depart and a2.id=vol.aeroport_arrive
and v1.aeroport = a1.id and v2.aeroport = a2.id and v1.ville=vi1.id and v2.ville=vi2.id and vi1.nom='Vancouver' and vi2.nom='New York City' and vol.compagnie=Compagnie_Aerienne.id
and vol.id not in(Select vol from Escale) and statut.id = vol.statut and statut.libelle = 'Ouvert Reservation'