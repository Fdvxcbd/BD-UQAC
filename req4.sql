CREATE TABLE Reservation_Place (
	VOL         INTEGER,
	CLASSE      INTEGER,
	PLACE       INTEGER,
	RESERVATION INTEGER,

	CONSTRAINT Reservation_Place_pk PRIMARY KEY (VOL, CLASSE, PLACE, RESERVATION)
);

ALTER TABLE Reservation_Place ADD CONSTRAINT Reservation_Place_Place_fk       FOREIGN KEY (VOL, CLASSE, PLACE)  REFERENCES Place(VOL, CLASSE, PLACE);
ALTER TABLE Reservation_Place ADD CONSTRAINT Reservation_Place_Reservation_fk FOREIGN KEY (RESERVATION)         REFERENCES Reservation(ID);

INSERT INTO Reservation_Place VALUES(16, 2, 3, 3);
INSERT INTO Reservation_Place VALUES(16, 1, 2, 4);

SELECT P.nom, P.prenom, pass.numero
FROM vol, aeroport a1, aeroport a2, ville_desservie v1, ville_desservie v2, ville vi1, ville vi2, Place pl, Reservation_Place rp, Reservation r, Reservation_Personne rpp,
Personne p, passport pass, Classe c, type_personne tpp
WHERE r.date>='2015/01/01' and pl.vol=vol.id and pl.classe = c.id and c.libelle='Première classe'
and rp.vol=pl.vol and pl.classe = rp.classe and rp.reservation = r.id and rpp.reservation=r.id
and rpp.personne = p.id and pass.id = p.passeport
and a1.id=vol.aeroport_depart and a2.id=vol.aeroport_arrive
and v1.aeroport = a1.id and v2.aeroport = a2.id and v1.ville=
vi1.id and v2.ville=vi2.id and ((vi1.nom='Paris' and vi2.nom='New York City') or (vi1.nom='New York City' and vi2.nom='Paris')) and tpp.type='Client' and tpp.id=p.type_personne;

DROP TABLE Reservation_Place;

