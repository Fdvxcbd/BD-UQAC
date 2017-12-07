-- partie cachee
SET SERVEROUT ON;
CREATE OR REPLACE PACKAGE BODY Client AS

	PROCEDURE RechercherVolsOuverts(ville1 Ville.nom%TYPE, ville2 Ville.nom%TYPE, datemin DATE, datemax DATE) IS
	BEGIN
		FOR tcur IN (SELECT v.numero
		             FROM Vol v, Aeroport a1, ville_desservie vd1, ville v1, aeroport a2, ville_desservie vd2, ville v2, Statut s
		             WHERE v1.nom = ville1 AND v2.nom = ville2 AND v.depart >= datemin AND v.arrivee <= datemax AND v.aeroport_depart = a1.id AND a1.id = vd1.aeroport AND vd1.ville = v1.id AND v.aeroport_arrive = a2.id AND a2.id = vd2.aeroport AND vd2.ville = v2.id and s.id = v.statut and s.libelle = 'Ouvert Reservation') LOOP
			DBMS_OUTPUT.PUT_LINE('num vol: ' || tcur.numero);
		END LOOP;

	END RechercherVolsOuverts;
	----------------------------------------------------------------

	PROCEDURE EffectuerReservation(
		ppersonne Personne.ID%TYPE,
		pvol      Vol.NUMERO%TYPE,
		pclasse   Classe.LIBELLE%TYPE
	) IS
		idPlace Place%ROWTYPE;
		pasDePlace EXCEPTION;
	BEGIN

		SELECT
			pl.vol,
			pl.classe,
			pl.place,
			pl.prix
		INTO idPlace
		FROM Infos_Place p, Place pl, Classe c, Vol v
		WHERE c.libelle = pclasse AND v.numero = pvol AND v.id = pl.vol AND pl.classe = c.id AND pl.Place = p.id AND p.Disponible = 'T';

		-- exception if no place available
		IF (idPlace.vol IS NULL)
		THEN
			RAISE pasDePlace;
		END IF;
		-- Réserver vol
		UPDATE Infos_Place
		SET Disponible = 'F'
		WHERE idPlace.Place = Infos_Place.id;
		INSERT INTO Reservation VALUES ((Select max(id)+1 from Reservation), 'r5', TO_DATE('1/1/2017', 'DD/mm/YYYY'), 1);
		INSERT INTO Reservation_Vol VALUES (idPlace.vol, (Select max(id) from Reservation));
		INSERT INTO Reservation_Personne VALUES (ppersonne, (Select max(id) from Reservation));

		EXCEPTION
		WHEN pasDePlace THEN
		dbms_output.put_line('Pas de place sur ce vol');
	END EffectuerReservation;
	----------------------------------------------------------------

	PROCEDURE ModifierAdresse (
		client      Personne.ID%TYPE,
		id_adresse  Adresse.ID%TYPE,
		p_numero      Adresse.NUMERO%TYPE,
		p_app         Adresse.APP%TYPE,
		p_rue         Adresse.RUE%TYPE,
		p_ville       Adresse.VILLE%TYPE,
		p_codepostal  Adresse.CODE_POSTAL%TYPE
	) IS
	nbClient INTEGER;
	ppays Adresse.PAYS%TYPE;
	pprovince Adresse.PROVINCE%TYPE;
	BEGIN
		-- check if adress binded by 2 or more persons
		-- if adress binded by 2 or more, create new one and point to the new
		-- if not, modify directly the adress
		-- Pour le présent on fait le minimum
		Select count(*) into nbClient from Adresse A, Adresse_Personne AP where AP.Personne = client AND AP.Adresse = id_adresse;
		if (nbClient=1) then
			UPDATE Adresse
			SET NUMERO = NVL(p_numero, NUMERO),
				APP = NVL(p_app, APP),
				RUE = NVL(p_rue, RUE),
				VILLE = NVL(p_ville, VILLE),
				CODE_POSTAL = NVL(p_codepostal, CODE_POSTAL)
			WHERE ID = id_adresse;
		else
			Select pays, province into ppays, pprovince from Adresse A where id_adresse = A.id;
			INSERT INTO Adresse(NUMERO, APP, RUE, VILLE, CODE_POSTAL, PAYS, PROVINCE)
			VALUES (p_numero, p_app, p_rue, p_ville, p_codepostal, ppays, pprovince);
			UPDATE Adresse_Personne AP SET Adresse = (select max(id) from adresse) WHERE AP.adresse = id_adresse and AP.Personne = client;
		end if;
	END ModifierAdresse;

END Client;
/
EXECUTE Client.EffectuerReservation(1, 'zefzef', 'Business');
EXECUTE Client.ModifierAdresse (1,1,12, 'K','Ap #595-7594 Quam Rd.','Strona','Q8V9H1');
EXECUTE CLient.RechercherVolsOuverts('Cressa', 'Macerata', TO_DATE('01/01/2016', 'DD/mm/YYYY'), TO_DATE('01/01/2019', 'DD/mm/YYYY'));
SHOW ERRORS;

