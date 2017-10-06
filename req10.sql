Select c.nom, vv.numero, SUM((Select count(*) from escale e, vol v where vv.id=v.id and e.vol=v.id and c.id=v.compagnie)) as nbEscale
from Compagnie_Aerienne c, Vol vv
where c.id=vv.compagnie
group by c.nom, vv.numero
order by nbEscale
