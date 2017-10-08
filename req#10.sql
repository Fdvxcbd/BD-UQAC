SELECT c.nom, vv.numero, SUM((Select count(*) from escale e, vol v where vv.id=v.id and e.vol=v.id and c.id=v.compagnie)) as nbEscale
FROM Compagnie_Aerienne c, Vol vv
WHERE c.id=vv.compagnie
GROUP BY c.nom, vv.numero
ORDER BY nbEscale
