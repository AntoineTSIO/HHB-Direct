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