SELECT numero, depart
FROM vol, aeroport a1, aeroport a2, ville_desservie v1, ville_desservie v2, ville vi1, ville vi2
WHERE vol.depart>='2017/12/25' AND vol.depart<='2018/01/12'
and a1.id=vol.aeroport_depart and a2.id=vol.aeroport_arrive
and v1.aeroport = a1.id and v2.aeroport = a2.id and v1.ville=
vi1.id and v2.ville=vi2.id and vi1.nom='Montréal' and vi2.nom='Paris';