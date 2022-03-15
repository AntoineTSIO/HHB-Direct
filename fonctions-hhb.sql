-- TD Introduction Langage PL/pgSQL  |  Exercice 6

DROP FUNCTION getNbClientsDebiteurs();
CREATE OR REPLACE FUNCTION getNbClientsDebiteurs() RETURNS integer AS
$$
    DECLARE
        curseur CURSOR FOR select id_type,num_compte,date_fermer,date_ouvrir,solde FROM compte ;
        resultat RECORD ;
        nbClientsDebiteurs integer := 0;
    BEGIN
        FOR resultat IN curseur LOOP
            IF resultat.solde < 0 THEN
                nbClientsDebiteurs:=nbClientsDebiteurs+1;
            end if;
        end loop;
        return  nbClientsDebiteurs;
    END;
$$
LANGUAGE plpgsql;