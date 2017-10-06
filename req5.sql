SELECT numero, compagnie, depart, COUNT(RS.VOL) AS Solution
FROM vol, aeroport a2, ville_desservie v2, ville vi2, 
reservation_vol RS
WHERE vol.depart='2017/12/25' AND vol.numero='AC1520'
and a2.id=vol.aeroport_arrive
and v2.aeroport = a2.id and v2.ville=vi2.id  
and vi2.nom='La Havane' and RS.vol = vol.id
GROUP BY numero, compagnie, depart;