INSERT INTO date (date) VALUES ('2021-01-15');
INSERT INTO date (date) VALUES ('2021-01-17');
INSERT INTO date (date) VALUES ('2021-01-18');
INSERT INTO date (date) VALUES ('2021-01-20');
INSERT INTO date (date) VALUES ('2021-01-21');
INSERT INTO date (date) VALUES ('2021-01-22');
INSERT INTO date (date) VALUES ('2021-01-23');
INSERT INTO date (date) VALUES ('2021-01-25');
INSERT INTO date (date) VALUES ('2021-01-30');
INSERT INTO date (date) VALUES ('2021-01-31');


INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet)
VALUES (10, 'LU', 'Jean-Louis', '3 rue Jacques Noury, 14650 CARPIQUET', 'Jlu', 'Jlu');

INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet)
VALUES (11, 'KORBI', 'Hayette', '21 rue de la mer, 14880 COLLEVILLETTE', 'Hkorbi', 'Hkorbi');


INSERT INTO affecter (num_client, date, num_agence)
VALUES (10, '2021-01-15', 1);

INSERT INTO affecter (num_client, date, num_agence)
VALUES (11, '2021-01-15', 1);


INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde)
VALUES (1, 20, NULL, '2021-01-15', -300);

INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde)
VALUES (1, 30, NULL, '2021-01-15', 7000);


INSERT INTO posseder (num_client, id_type, num_compte)
VALUES (10, 1, 20);

INSERT INTO posseder (num_client, id_type, num_compte)
VALUES (11, 1, 30);


INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (200, 20, '2021-01-15', 1, NULL, NULL, 'Ouverture compte', 'CREDIT', 50);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (201, 20, '2021-01-17', 1, NULL, NULL, 'Dépôt Chèque', 'CREDIT', 300);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (202, 20, '2021-01-18', 1, NULL, NULL, 'Retrait DAB', 'DEBIT', 100);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (203, 20, '2021-01-20', 1, NULL, NULL, 'Dépôt Chèque', 'CREDIT', 200);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (204, 20, '2021-01-21', 1, NULL, NULL, 'Retrait DAB', 'DEBIT', 100);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (205, 20, '2021-01-25', 1, NULL, NULL, 'Chèque', 'DEBIT', 850);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (208, 20, '2021-01-30', 1, NULL, NULL, 'Pension', 'CREDIT', 1000);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (209, 20, '2021-01-30', 1, NULL, NULL, 'Pension', 'DEBIT', 800);


INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (300, 30, '2021-01-15', 1, NULL, NULL, 'Ouverture compte', 'CREDIT', 200);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (301, 30, '2021-01-20', 1, NULL, NULL, 'Dépôt Chèque', 'CREDIT', 1500);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (302, 30, '2021-01-22', 1, NULL, NULL, 'Achat CB', 'DEBIT', 300);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (303, 30, '2021-01-22', 1, NULL, NULL, 'Achat CB', 'DEBIT', 720);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (304, 30, '2021-01-22', 1, NULL, NULL, 'Dépôt Chèque', 'CREDIT', 2000);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (310, 30, '2021-01-23', 1, NULL, NULL, 'Achat CB', 'DEBIT', 120);

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant)
VALUES (311, 30, '2021-01-31', 1, NULL, NULL, 'Salaire', 'CREDIT', 4500);

















