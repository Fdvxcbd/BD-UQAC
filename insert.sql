DELETE FROM Telephone_Personne;
DELETE FROM Reservation_Vol;
DELETE FROM Reservation_Personne;
DELETE FROM Reservation;
DELETE FROM Etat_Reservation;
DELETE FROM Adresse_Personne;
DELETE FROM Personne;
DELETE FROM Escale;
DELETE FROM Place;
DELETE FROM Vol;
DELETE FROM Adresse;
DELETE FROM Province_Pays;
DELETE FROM Telephone;
DELETE FROM Infos_Escale;
DELETE FROM Classe;
DELETE FROM Infos_Place;
DELETE FROM Statut;
DELETE FROM Type_Personne;
DELETE FROM Compte;
DELETE FROM Passport;
DELETE FROM Province;
DELETE FROM Ville_Desservie;
DELETE FROM Ville;
DELETE FROM Pays;
DELETE FROM Compagnie_Aerienne;
DELETE FROM Aeroport;

INSERT INTO Compagnie_Aerienne(ID, NOM) VALUES(1, 'Compagnie 1');
INSERT INTO Compagnie_Aerienne(ID, NOM) VALUES(2, 'Compagnie 2');
INSERT INTO Compagnie_Aerienne(ID, NOM) VALUES(3, 'Compagnie 3');

INSERT INTO Infos_Escale VALUES(1, '1950/02/13', '1950/02/13');
INSERT INTO Infos_Escale VALUES(2, '1950/02/13', '1950/02/13');

INSERT INTO Statut VALUES(1, 'Ouvert Reservation');
INSERT INTO Statut VALUES(2, 'Fermée Reservation');

INSERT INTO Classe VALUES(1, 'Business');
INSERT INTO Classe VALUES(2, 'Première classe');
INSERT INTO Classe VALUES(3, 'Economique');

INSERT INTO Infos_Place VALUES(1, 'A', 10, 'T');
INSERT INTO Infos_Place VALUES(2, 'B', 11, 'T');
INSERT INTO Infos_Place VALUES(3, 'C', 12, 'T');
INSERT INTO Infos_Place VALUES(4, 'D', 13, 'T');
INSERT INTO Infos_Place VALUES(5, 'E', 14, 'T');
INSERT INTO Infos_Place VALUES(6, 'F', 15, 'F');
INSERT INTO Infos_Place VALUES(7, 'G', 42, 'F');

INSERT INTO Aeroport VALUES(1, 'TLS', 'Toulouse');
INSERT INTO Aeroport VALUES(2, 'QBC', 'Québec');
INSERT INTO Aeroport VALUES(3, 'MTR', 'Montréal');
INSERT INTO Aeroport VALUES(4, 'NYC', 'New York City');
INSERT INTO Aeroport VALUES(5, 'PRS', 'Paris');
INSERT INTO Aeroport VALUES(6, 'VCV', 'Vancouver');
INSERT INTO Aeroport VALUES(7, 'LHV', 'La Havane');

INSERT INTO Vol VALUES(1, 'CA1520', 1, '2017/01/01', '2017/01/01', 1, 2, 1);
INSERT INTO Vol VALUES(2, 'AF2306', 2, '2018/02/12', '2018/02/12', 1, 2, 1);
INSERT INTO Vol VALUES(3, 'AC1520', 3, '2017/12/25', '2017/12/25', 1, 7, 1);
INSERT INTO Vol VALUES(4, 'fezzef', 1, '2017/01/01', '2017/01/01', 5, 4, 1);
INSERT INTO Vol VALUES(5, 'ezfzrg', 1, '2017/12/26', '2017/12/26', 3, 5, 1);
INSERT INTO Vol VALUES(6, 'fzefgf', 2, '2018/01/12', '2018/01/12', 3, 5, 1);
INSERT INTO Vol VALUES(7, 'ffpoiu', 2, '2017/01/01', '2017/01/01', 6, 4, 1);
INSERT INTO Vol VALUES(8, 'zefzef', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(9, 'zfehgf', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(10, 'eekuyn', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(11, 'yfghuk', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(12, 'yukyuk', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(13, 'tottoo', 3, '2017/01/01', '2017/01/01', 4, 3, 1);
INSERT INTO Vol VALUES(14, 'escale', 2, '2017/01/02', '2017/01/01', 6, 4, 1);
INSERT INTO Vol VALUES(15, 'vcvcvc', 2, '2017/01/02', '2017/01/01', 6, 4, 1);
INSERT INTO Vol VALUES(16, 'Paris NY', 2, '2017/01/02', '2017/01/01', 5, 4, 1);

INSERT INTO Place VALUES(8, 1, 2, 125);
INSERT INTO Place VALUES(9, 1, 2, 500);
INSERT INTO Place VALUES(10, 1, 2, 1000);
INSERT INTO Place VALUES(11, 1, 2, 5);
INSERT INTO Place VALUES(12, 1, 2, 666);
INSERT INTO Place VALUES(12, 1, 3, 999);
INSERT INTO Place VALUES(2, 1, 3, 1);
INSERT INTO Place VALUES(2, 2, 3, 99999);
INSERT INTO Place VALUES(3, 2, 1, 550);
INSERT INTO Place VALUES(3, 2, 2, 550);
INSERT INTO Place VALUES(3, 2, 3, 550);
INSERT INTO Place VALUES(16, 2, 3, 550);
INSERT INTO Place VALUES(16, 1, 2, 550);

INSERT INTO Escale VALUES(13, 1, 1);
INSERT INTO Escale VALUES(14, 1, 1);
INSERT INTO Escale VALUES(7, 1, 1);
INSERT INTO Escale VALUES(6, 1, 1);
INSERT INTO Escale VALUES(5, 1, 1);
INSERT INTO Escale VALUES(1, 1, 1);
INSERT INTO Escale VALUES(14, 5, 2);

INSERT INTO Pays VALUES(1, 'Pays 1');
INSERT INTO Pays VALUES(2, 'Pays 2');
INSERT INTO Pays VALUES(3, 'France');
INSERT INTO Pays VALUES(4, 'USA');
INSERT INTO Pays VALUES(5, 'Canada');

INSERT INTO Ville VALUES(1, 1, 'Ville 1 pays 1');
INSERT INTO Ville VALUES(2, 2, 'Toulouse');
INSERT INTO Ville VALUES(3, 5, 'Québec');
INSERT INTO Ville VALUES(4, 5, 'Montréal');
INSERT INTO Ville VALUES(5, 1, 'New York City');
INSERT INTO Ville VALUES(6, 1, 'Paris');
INSERT INTO Ville VALUES(7, 4, 'Vancouver');
INSERT INTO Ville VALUES(8, 4, 'La Havane');

INSERT INTO Ville_Desservie VALUES(1, 2);
INSERT INTO Ville_Desservie VALUES(2, 3);
INSERT INTO Ville_Desservie VALUES(3, 4);
INSERT INTO Ville_Desservie VALUES(4, 5);
INSERT INTO Ville_Desservie VALUES(5, 6);
INSERT INTO Ville_Desservie VALUES(6, 7);
INSERT INTO Ville_Desservie VALUES(7, 8);

INSERT INTO Province VALUES(1, 'Province 1');
INSERT INTO Province VALUES(2, 'Province 2');

INSERT INTO Province_Pays VALUES(4, 2);
INSERT INTO Province_Pays VALUES(3, 1);

INSERT INTO Adresse VALUES(1, 666, 'A', 'Rue 1', 'Ville X', 'ezf', 4, 2);
INSERT INTO Adresse VALUES(2, 999, 'B', 'Rue 1', 'Ville X', 'ezf', 3, 1);

INSERT INTO Adresse_Personne VALUES(1, 1);
INSERT INTO Adresse_Personne VALUES(1, 3);
INSERT INTO Adresse_Personne VALUES(2, 3);

INSERT INTO Passport VALUES(1, 'Passeport 1');
INSERT INTO Passport VALUES(2, 'Passeport 2');
INSERT INTO Passport VALUES(3, 'Passeport 3');
INSERT INTO Passport VALUES(4, 'Passeport 4');
INSERT INTO Passport VALUES(5, 'Passeport 5');
INSERT INTO Passport VALUES(6, 'Passeport 6');

INSERT INTO Compte VALUES(1, 'courriel 1', 'password 1');
INSERT INTO Compte VALUES(2, 'courriel 2', 'password 2');
INSERT INTO Compte VALUES(3, 'courriel 3', 'password 3');
INSERT INTO Compte VALUES(4, 'courriel 4', 'password 4');
INSERT INTO Compte VALUES(5, 'courriel 5', 'password 5');
INSERT INTO Compte VALUES(6, 'courriel 6', 'password 6');

INSERT INTO Type_Personne VALUES(1, 'Client');
INSERT INTO Type_Personne VALUES(2, 'Esclave');

INSERT INTO Personne VALUES(1, 'Personne', '1', 1, 1, 1);
INSERT INTO Personne VALUES(2, 'Personne', '2', 2, 2, 2);
INSERT INTO Personne VALUES(3, 'Personne', '3', 1, 3, 3);
INSERT INTO Personne VALUES(4, 'Personne', '4', 1, 4, 4);
INSERT INTO Personne VALUES(5, 'Personne', '5', 1, 5, 5);
INSERT INTO Personne VALUES(6, 'Personne', '6', 1, 6, 6);

INSERT INTO Telephone VALUES(1, 1, 1, 321);

INSERT INTO Telephone_Personne VALUES(1, 1);

INSERT INTO Etat_Reservation VALUES(1, 'Valide');
INSERT INTO Etat_Reservation VALUES(2, 'Non Valide');

INSERT INTO Reservation VALUES(1, 'r1', '2016/01/25', 1);
INSERT INTO Reservation VALUES(2, 'r2', '2016/01/25', 1);
INSERT INTO Reservation VALUES(3, 'r3', '2016/01/26', 1);
INSERT INTO Reservation VALUES(4, 'r4', '2014/01/25', 1);

INSERT INTO Reservation_Personne VALUES(6, 1);
INSERT INTO Reservation_Personne VALUES(3, 2);
INSERT INTO Reservation_Personne VALUES(5, 3);
INSERT INTO Reservation_Personne VALUES(6, 4);

INSERT INTO Reservation_Vol VALUES(10, 1);
INSERT INTO Reservation_Vol VALUES(3, 1);
INSERT INTO Reservation_Vol VALUES(3, 2);
INSERT INTO Reservation_Vol VALUES(5, 2);
