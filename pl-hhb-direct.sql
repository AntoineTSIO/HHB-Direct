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