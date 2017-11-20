EXECUTE Client.EffectuerReservation(1, 'zefzef', 'Business');
PL/SQL procedure successfully completed.
Suffit de faire un select pour voir que la requete a été effectué, ça apporte rien de le mettre dans le rapport imo...
type ça 
SELECT pl.vol,pl.classe,pl.place,pl.prix, Disponible FROM Infos_Place p, Place pl, Classe c, Vol v WHERE v.id = 8 AND v.id = pl.vol AND pl.classe = c.id AND pl.Place = p.id AND p.Disponible = 'F';
qui retourne :
       VOL     CLASSE	   PLACE       PRIX D
---------- ---------- ---------- ---------- -
	 8	    1	       2	125 F

------------------------------------------------------------------------------------------------------

EXECUTE Client.ModifierAdresse (1,1,12, 'K','Ap #595-7594 Quam Rd.','Strona','Q8V9H1');
PL/SQL procedure successfully completed.
Select * from adresse where id=1;


---------- ---------- -
RUE
--------------------------------------------------------------------------------
VILLE
--------------------------------------------------------------------------------
CODE_P	     PAYS   PROVINCE
------ ---------- ----------
	 1	   12 K
Ap #595-7594 Quam Rd.
Strona
Q8V9H1		3	  24

------------------------------------------------------------------------------------------------------

EXECUTE OuvrirVol('ifhihfz', TO_DATE('10/09/2017', 'DD/mm/YYYY'), TO_DATE('25/09/2017', 'DD/mm/YYYY'), 'Cressa', 'Macerata', 'Compagnie 1');

PL/SQL procedure successfully completed.

Select * from vol;

//wala le retour ets trop long

	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	 1 CA1520		    1 01-JAN-17 01-JAN-17		1
	      2 	 1

	 2 AF2306		    2 02-DEC-18 02-DEC-18		1
	      2 	 1

	 3 AC1520		    3 25-DEC-17 25-DEC-17		1
	      7 	 1


	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	 4 fezzef		    1 01-JAN-17 01-JAN-17		5
	      4 	 1

	 5 ezfzrg		    1 26-DEC-17 26-DEC-17		3
	      5 	 1

	 6 fzefgf		    2 12-JAN-18 12-JAN-18		3
	      5 	 1


	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	 7 ffpoiu		    2 01-JAN-17 01-JAN-17		6
	      4 	 1

	 8 zefzef		    3 01-JAN-17 01-JAN-17		4
	      3 	 1

	 9 zfehgf		    3 01-JAN-17 01-JAN-17		4
	      3 	 1


	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	10 eekuyn		    3 01-JAN-17 01-JAN-17		4
	      3 	 1

	11 yfghuk		    3 01-JAN-17 01-JAN-17		4
	      3 	 1

	12 yukyuk		    3 01-JAN-17 01-JAN-17		4
	      3 	 1


	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	13 tottoo		    3 01-JAN-17 01-JAN-17		4
	      3 	 1

	14 escale		    2 01-JAN-17 01-JAN-17		6
	      4 	 1

	15 vcvcvc		    2 01-JAN-17 01-JAN-17		6
	      4 	 1


	ID NUMERO	    COMPAGNIE DEPART	ARRIVEE   AEROPORT_DEPART
---------- --------------- ---------- --------- --------- ---------------
AEROPORT_ARRIVE     STATUT
--------------- ----------
	16 Paris NY		    2 01-JAN-17 01-JAN-17		5
	      4 	 1

	17 ifhihfz		    1 10-SEP-17 25-SEP-17		1
	      2 	 1

--------------------------------------------------------------------------------------------------------
Vol les plus chere

Prix 500 zfehgf 3 01-JAN-17 01-JAN-17 4 3 1
Prix 1000 eekuyn 3 01-JAN-17 01-JAN-17 4 3 1
Prix 666 tottoo 3 01-JAN-17 01-JAN-17 4 3 1
Prix 999 escale 2 01-JAN-17 01-JAN-17 6 4 1
Prix 550 Paris NY 2 01-JAN-17 01-JAN-17 5 4 1
---------------------------------------------------------------------------------------------------
EXECUTE CLient.RechercherVolsOuverts('Macerata', 'Abbotsford', TO_DATE('01/01/2016', 'DD/mm/YYYY'), TO_DATE('01/01/2019', 'DD/mm/YYYY'));

num vol: CA1520
num vol: AF2306



SELECT v.numero FROM Vol v, Aeroport a1, ville_desservie vd1, ville v1, aeroport a2, ville_desservie vd2, ville v2, Statut s WHERE v1.nom = 'Macerata' AND v2.nom = 'Abbotsford' AND v.depart >= TO_DATE('01/01/2016', 'DD/mm/YYYY') AND v.arrivee <= TO_DATE('01/01/2019', 'DD/mm/YYYY') AND v.aeroport_depart = a1.id AND a1.id = vd1.aeroport AND vd1.ville = v1.id AND v.aeroport_arrive = a2.id AND a2.id = vd2.aeroport AND vd2.ville = v2.id and s.id = v.statut and s.libelle = 'Ouvert Reservation';






