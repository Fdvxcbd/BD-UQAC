CREATE OR REPLACE PROCEDURE EffectuerReservation (
	personne    Personne.ID%TYPE,
	vol         Vol.NUMERO%TYPE,
	classe      Classe.LIBELLE%TYPE
) IS
	BEGIN

		-- recup class

		-- pick last num of seat that is not booked

		-- exception if no place available

	END;
/