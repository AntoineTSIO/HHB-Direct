-- TD HHB-Direct Langage PL/pgSQL  |  Exercice 1

DROP FUNCTION IF EXISTS verifierIntegriteSolde(numCompte integer, typeCompte integer);
CREATE OR REPLACE FUNCTION verifierIntegriteSolde(numCompte integer, typeCompte integer) RETURNS varchar AS
$$
    DECLARE
        curseur CURSOR FOR select id_type, num_compte, solde from compte ;
        curseur1 CURSOR FOR select id_type, num_compte, montant from operation ;
        res varchar := '[NoK]';
        resultat RECORD ;
        resultat1 RECORD ;
    BEGIN
        FOR resultat IN curseur LOOP
            FOR resultat1 IN curseur1 LOOP
                IF numCompte = resultat.num_compte AND typeCompte = resultat.id_type THEN
                    IF resultat.num_compte = resultat1.num_compte AND resultat.id_type = resultat1.id_type THEN
                        res := '[Ok]';
                        return res;
                    end if;
                end if;
            end loop;
        end loop;
        return res;
    END;
$$
LANGUAGE plpgsql;