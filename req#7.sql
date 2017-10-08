SELECT prix, libelle
FROM vol, PLACE P, Classe c
WHERE P.vol = vol.id and P.classe = C.id 
and vol.numero = 'AF2306' and vol.depart='2018/02/12'
and prix = (Select max(prix) from vol, place
			where vol.id = place.vol and vol.numero='AF2306');