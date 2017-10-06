SELECT CODE_IATA, ae.nom
FROM aeroport ae, Ville_desservie vd, ville v, pays p
WHERE ae.id = vd.aeroport AND vd.ville=v.id AND v.Pays=P.id
and p.nom='Canada';