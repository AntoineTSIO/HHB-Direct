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


-- TD Introduction Langage PL/pgSQL  |  Exercice 7

DROP FUNCTION getNbClientsParVille();
CREATE OR REPLACE FUNCTION getNbClientsParVille(une_ville varchar) RETURNS integer AS
$$
    DECLARE
        curseur CURSOR FOR select num_client,adresse_client FROM client ;
        resultat RECORD ;
        ville varchar;
        nbClientsDebiteurs integer := 0;
    BEGIN
        FOR resultat IN curseur LOOP
            ville := substring(resultat.adresse_client from '[A-Z][A-Z]+');
            IF ville = une_ville THEN
                nbClientsDebiteurs:=nbClientsDebiteurs+1;
            end if;
        end loop;
        return  nbClientsDebiteurs;
    END;
$$
LANGUAGE plpgsql;