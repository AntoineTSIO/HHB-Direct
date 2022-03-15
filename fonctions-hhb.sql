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

DROP FUNCTION getNbClientsParVille(une_ville varchar);
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


-- TD Introduction Langage PL/pgSQL  |  Exercice 7

DROP FUNCTION enregistrerUnNouveauClient(new_nom_client varchar, new_prenom_client varchar, new_adresse_client varchar, new_identifiant_internet varchar, new_mdp_internet varchar);
CREATE OR REPLACE FUNCTION enregistrerUnNouveauClient(new_nom_client varchar, new_prenom_client varchar, new_adresse_client varchar, new_identifiant_internet varchar, new_mdp_internet varchar) RETURNS varchar AS
$$
    DECLARE
        last_id integer;
        new_num_client integer;
        test_id integer;
    BEGIN
        SELECT INTO last_id max(client.num_client) FROM client ;
        new_num_client:=last_id+1;
        INSERT INTO client(num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (new_num_client, new_nom_client, new_prenom_client, new_adresse_client, new_identifiant_internet, new_mdp_internet);
        SELECT INTO test_id max(client.num_client) FROM client ;
        IF test_id = new_num_client THEN
            return 'Nouveau client bien enregistré';
        ELSE
            return 'Erreur lors de l`enregistrement du nouveau client';
        end if;
    END;
$$
LANGUAGE plpgsql;