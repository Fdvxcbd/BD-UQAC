SELECT P.nom, P.prenom, pass.numero
FROM pays pa, Province_Pays pp, Personne P, Passport pass, adresse_Personne ap, adresse a, Type_Personne tp
WHERE P.passeport = pass.id and p.id = ap.personne and ap.adresse
=a.id and a.pays = pp.pays and a.province=pp.province
and pp.pays = pa.id and pa.nom='USA' and tp.id = P.type_personne and tp.type='Client'
GROUP BY P.nom, P.prenom, pass.numero;