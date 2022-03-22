-- TD HHB-Direct Langage PL/pgSQL  |  Exercice 1

DROP FUNCTION IF EXISTS getOneTuple();
CREATE OR REPLACE FUNCTION getOneTuple() RETURNS record AS
$$
    DECLARE
        res record;
    BEGIN
        select into res * from client ;
        return res ;
    END;
$$
LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getOneTupleTable();
CREATE OR REPLACE FUNCTION getOneTupleTable() RETURNS SETOF client AS
$$
    BEGIN
        return query select * from client ;
    END;
$$
LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS  lesClients();
CREATE OR REPLACE FUNCTION lesClients() RETURNS SETOF client AS
$$
    DECLARE
        res client%ROWTYPE;
    BEGIN
        for res in select * from client loop
            return next res;
        end loop;
        return;
    END;
$$
LANGUAGE plpgsql;

-- TD HHB-Direct Langage PL/pgSQL  |  Exercice 2

DROP FUNCTION IF EXISTS nb_operation_compte_mois(mois int, annee int, numcompte int, typecompte int);
CREATE OR REPLACE FUNCTION nb_operation_compte_mois(mois int, annee int, numcompte int, typecompte int) RETURNS integer AS
$$
    DECLARE
        curseur CURSOR FOR select num_compte, id_type, date from operation ;
        resultat RECORD ;
        unMois int;
        uneAnnee int;
        res integer := 0;
    BEGIN
        FOR resultat IN curseur LOOP
            unMois := extract(month from resultat.date);
            uneAnnee := extract(year from resultat.date);
            IF uneAnnee = annee AND unMois = mois AND resultat.num_compte = numcompte AND resultat.id_type = typecompte THEN
                res:=res+1;
            end if;
        end loop;
        return res ;
    END;
$$
LANGUAGE plpgsql;

-- TD HHB-Direct Langage PL/pgSQL  |  Exercice 3

DROP FUNCTION IF EXISTS creer_id_internet(nom varchar, prenom varchar);
CREATE OR REPLACE FUNCTION creer_id_internet(nom varchar, prenom varchar) RETURNS varchar AS
$$
    DECLARE
        curseur CURSOR FOR select count(num_client) as num_client,identifiant_internet from client group by identifiant_internet;
        resultat RECORD ;
        newID integer:=0;
        idInternet varchar;
        mdpInternet varchar;
    BEGIN
        idInternet := substring(prenom from '^[A-Z]')|| lower(nom);
        FOR resultat IN curseur LOOP
            newID:= count(resultat.num_client);
            IF resultat.identifiant_internet = idInternet THEN
                idInternet := idInternet||newID;
            end if;
        end loop;
        mdpInternet := idInternet;
        return idInternet ||'/'|| mdpInternet ;
    END;
$$
LANGUAGE plpgsql;

-- TD HHB-Direct Langage PL/pgSQL  |  Exercice 4

DROP FUNCTION IF EXISTS creer_date(mois integer, annee integer);
CREATE OR REPLACE FUNCTION creer_date(mois integer, annee integer) RETURNS void AS
$$
    DECLARE
        nbJours integer;
        jour integer := 01;
        uneDate date;
    BEGIN
        IF mois=04 or mois=06 or mois=09 or mois=11 THEN
            nbJours := 30;
        ELSIF mois=01 or mois=03 or mois=05 or mois=07 or mois=08 or mois=10 or mois=12 THEN
            nbJours := 31;
        ELSIF mois = 02 and annee%4 = 0 THEN
            nbJours := 29;
        ELSE
            nbJours := 28;
        END IF;
        WHILE jour <= nbJours LOOP
            uneDate := annee||'-'||mois||'-'||jour;
            INSERT INTO date(date) VALUES (uneDate);
            jour:=jour+1;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;