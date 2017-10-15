DROP TABLE Telephone_Personne;
DROP TABLE Reservation_Vol;
DROP TABLE Reservation_Personne;
DROP TABLE Reservation;
DROP TABLE Etat_Reservation;
DROP TABLE Adresse_Personne;
DROP TABLE Personne;
DROP TABLE Escale;
DROP TABLE Place;
DROP TABLE Vol;
DROP TABLE Adresse;
DROP TABLE Province_Pays;
DROP TABLE Telephone;
DROP TABLE Infos_Escale;
DROP TABLE Classe;
DROP TABLE Infos_Place;
DROP TABLE Statut;
DROP TABLE Type_Personne;
DROP TABLE Compte;
DROP TABLE Passport;
DROP TABLE Province;
DROP TABLE Ville_Desservie;
DROP TABLE Ville;
DROP TABLE Pays;
DROP TABLE Compagnie_Aerienne;
DROP TABLE Aeroport;



CREATE TABLE Aeroport (
	ID        INTEGER,
	CODE_IATA VARCHAR(3),
	NOM       VARCHAR(100) NOT NULL,

	CONSTRAINT Aeroport_pk PRIMARY KEY (ID),
	CONSTRAINT Aeroport_code_iata_un UNIQUE(CODE_IATA)
);

CREATE TABLE Compagnie_Aerienne (
	ID  INTEGER,
	NOM VARCHAR(100) NOT NULL,

	CONSTRAINT Compagnie_Aerienne_pk PRIMARY KEY (ID)
);

CREATE TABLE Pays (
	ID  INTEGER,
	NOM VARCHAR(100) NOT NULL,

	CONSTRAINT Pays_pk PRIMARY KEY (ID)
);

CREATE TABLE Ville (
	ID      INTEGER,
	PAYS    INTEGER,
	NOM     VARCHAR(100) NOT NULL,

	CONSTRAINT Ville_pk PRIMARY KEY (ID)
);

CREATE TABLE Ville_Desservie (
	AEROPORT INTEGER,
	VILLE    INTEGER,

	CONSTRAINT Ville_Desservie_PK PRIMARY KEY (AEROPORT, VILLE)
);

CREATE TABLE Province (
	ID  INTEGER,
	NOM VARCHAR(100) NOT NULL,

	CONSTRAINT Pays_pk PRIMARY KEY (ID)
);

CREATE TABLE Passport (
	ID     INTEGER,
	NUMERO VARCHAR(12) NOT NULL,

	CONSTRAINT Passport_pk PRIMARY KEY (ID),
	CONSTRAINT Passport_no_un UNIQUE (NUMERO)
);

CREATE TABLE Compte (
	ID       INTEGER,
	COURRIEL VARCHAR(100),
	PASSWORD VARCHAR(255),

	CONSTRAINT Compte_pk PRIMARY KEY (ID)
);

CREATE TABLE Type_Personne (
	ID      INTEGER,
	TYPE    VARCHAR(100) NOT NULL,

	CONSTRAINT Type_Personne_pk PRIMARY KEY(id)
);

CREATE TABLE Statut (
	ID      INTEGER,
	LIBELLE VARCHAR(100) NOT NULL,

	CONSTRAINT Statut_pk PRIMARY KEY(ID)
);

CREATE TABLE Infos_Place (
	ID          INTEGER,
	RANGEE      CHAR(1) NOT NULL,
	SIEGE       INTEGER(2) NOT NULL,
	DISPONIBLE  CHAR(1) NOT NULL,

	CONSTRAINT Infos_Place_pk PRIMARY KEY(ID),
	CONSTRAINT Infos_Place_siege_un UNIQUE (SIEGE)
);

CREATE TABLE Classe (
	ID          INTEGER,
	LIBELLE     VARCHAR(100) NOT NULL,

	CONSTRAINT Classe_pk PRIMARY KEY(ID)
);

CREATE TABLE Infos_Escale (
	ID      INTEGER,
	ARRIVEE DATE,
	DEPART  DATE,

	CONSTRAINT Infos_escale_pk PRIMARY KEY (ID)
);

CREATE TABLE Telephone (
	ID          INTEGER,
	CODE_PAYS   INTEGER(1),
	CODE_REGION INTEGER(3),
	NUMERO     INTEGER(7),

	CONSTRAINT Telephone_pk PRIMARY KEY (ID),
	CONSTRAINT Telephone_numero_un UNIQUE (NUMERO)
);

CREATE TABLE Province_Pays (
	PAYS        INTEGER,
	PROVINCE    INTEGER,

	CONSTRAINT Province_Pays_pk PRIMARY KEY (PAYS, PROVINCE)
);

CREATE TABLE Adresse (
	ID          INTEGER,
	NUMERO      INTEGER,
	APP         CHAR(1),
	RUE         VARCHAR(255),
	VILLE       VARCHAR(255),
	CODE_POSTAL VARCHAR(6),
	PAYS        INTEGER,
	PROVINCE    INTEGER,

	CONSTRAINT Adresse_pk PRIMARY KEY (ID)
);

CREATE TABLE Vol (
	ID              INTEGER,
	NUMERO          VARCHAR(15),
	COMPAGNIE       INTEGER,
	DEPART          DATE,
	ARRIVEE         DATE,
	AEROPORT_DEPART INTEGER,
	AEROPORT_ARRIVE INTEGER,
	STATUT          INTEGER,

	CONSTRAINT Vol_pk PRIMARY KEY (ID),
	CONSTRAINT Vol_numero_un UNIQUE (NUMERO)
);

CREATE TABLE Place (
	VOL         INTEGER,
	CLASSE      INTEGER,
	PLACE       INTEGER,
	PRIX        DECIMAL(7,2) NOT NULL,

	CONSTRAINT Adresse_Personne_pk PRIMARY KEY (VOL, CLASSE, PLACE)
);

CREATE TABLE Escale (
	VOL      INTEGER,
	AEROPORT INTEGER,
	ESCALE   INTEGER,

	CONSTRAINT Escale_pk PRIMARY KEY (VOL, AEROPORT)
);

CREATE TABLE Personne (
	ID            INTEGER,
	NOM           VARCHAR(100),
	PRENOM        VARCHAR(100),
	TYPE_PERSONNE INTEGER,
	PASSEPORT     INTEGER,
	COMPTE        INTEGER,

	CONSTRAINT Personne_pk PRIMARY KEY (ID),
	CONSTRAINT Personne_passport_un UNIQUE (PASSEPORT),
	CONSTRAINT Personne_compte_un UNIQUE (COMPTE)
);

CREATE TABLE Adresse_Personne (
	ADRESSE     INTEGER,
	PERSONNE    INTEGER,

	CONSTRAINT Adresse_Personne_pk PRIMARY KEY (ADRESSE, PERSONNE)
);

CREATE TABLE Etat_Reservation(
	ID      INTEGER,
	LIBELLE VARCHAR(100),

	CONSTRAINT Etat_Reservation_pk PRIMARY KEY(id)
);

CREATE TABLE Reservation (
	ID      INTEGER,
	NUMERO  VARCHAR(25),
	DATE    DATE,
	ETAT    INTEGER,

	CONSTRAINT Reservation_pk PRIMARY KEY (ID)
);

CREATE TABLE Reservation_Personne (
	PERSONNE    INTEGER,
	RESERVATION INTEGER,

	CONSTRAINT Reservation_Personne_pk PRIMARY KEY (PERSONNE, RESERVATION)
);

CREATE TABLE Reservation_Vol (
	VOL         INTEGER,
	RESERVATION INTEGER,

	CONSTRAINT Reservation_Vol_pk PRIMARY KEY (VOL, RESERVATION)
);

CREATE TABLE Telephone_Personne(
	PERSONNE    INTEGER,
	TELEPHONE   INTEGER,

	CONSTRAINT Telephone_Personne_pk PRIMARY KEY (PERSONNE, TELEPHONE)
);

ALTER TABLE Ville_Desservie ADD CONSTRAINT Ville_Desservie_Aeroport_fk  FOREIGN KEY (AEROPORT)          REFERENCES Aeroport(ID);
ALTER TABLE Ville_Desservie ADD CONSTRAINT Ville_Desservie_Ville_fk     FOREIGN KEY (VILLE)             REFERENCES Ville(ID);
ALTER TABLE Ville           ADD CONSTRAINT Ville_Pays_fk                FOREIGN KEY (PAYS)              REFERENCES Pays(ID);
ALTER TABLE Province_Pays   ADD CONSTRAINT Province_Pays_Pays_fk        FOREIGN KEY (PAYS)              REFERENCES Pays(ID);
ALTER TABLE Province_Pays   ADD CONSTRAINT Province_Pays_Province_fk    FOREIGN KEY (PROVINCE)          REFERENCES Province(ID);
ALTER TABLE Adresse         ADD CONSTRAINT Adresse_Province_Pays_fk     FOREIGN KEY (PAYS, PROVINCE)    REFERENCES Province_Pays(PAYS, PROVINCE);
ALTER TABLE Escale          ADD CONSTRAINT Escale_Vol_fk                FOREIGN KEY (VOL)               REFERENCES Vol(ID);
ALTER TABLE Escale          ADD CONSTRAINT Escale_Aeroport_fk           FOREIGN KEY (AEROPORT)          REFERENCES Aeroport(ID);
ALTER TABLE Escale          ADD CONSTRAINT Escale_Infos_Escale          FOREIGN KEY (ESCALE)            REFERENCES Infos_Escale(ID);
ALTER TABLE Vol             ADD CONSTRAINT Vol_Aeroport_Depart_fk       FOREIGN KEY (AEROPORT_DEPART)   REFERENCES Aeroport(ID);
ALTER TABLE Vol             ADD CONSTRAINT Vol_Aeroport_Arrive_fk       FOREIGN KEY (AEROPORT_ARRIVE)   REFERENCES Aeroport(ID);
ALTER TABLE Vol             ADD CONSTRAINT Vol_Compagnie_Aerienne_fk    FOREIGN KEY (COMPAGNIE)         REFERENCES Compagnie_Aerienne(ID);
ALTER TABLE Vol             ADD CONSTRAINT Vol_Statut_fk                FOREIGN KEY (STATUT)            REFERENCES Statut(ID);
ALTER TABLE Reservation_Vol ADD CONSTRAINT Reservation_Vol_Vol_fk       FOREIGN KEY (VOL)               REFERENCES Vol(ID);
ALTER TABLE Reservation_Vol ADD CONSTRAINT Reservation_Vol_Reservation_fk FOREIGN KEY (RESERVATION)     REFERENCES Reservation(ID);
ALTER TABLE Personne        ADD CONSTRAINT Personne_Type_Personne_fk    FOREIGN KEY (TYPE_PERSONNE)     REFERENCES Type_Personne(ID);
ALTER TABLE Personne        ADD CONSTRAINT Personne_Passport_fk         FOREIGN KEY (PASSEPORT)         REFERENCES Passport(ID);
ALTER TABLE Personne        ADD CONSTRAINT Personne_Compte_fk           FOREIGN KEY (COMPTE)            REFERENCES Compte(ID);
ALTER TABLE Place           ADD CONSTRAINT Place_Vol_fk                 FOREIGN KEY (VOL)               REFERENCES Vol(ID);
ALTER TABLE Place           ADD CONSTRAINT Place_Classe_fk              FOREIGN KEY (CLASSE)            REFERENCES Classe(ID);
ALTER TABLE Place           ADD CONSTRAINT Place_Infos_Place_fk         FOREIGN KEY (PLACE)             REFERENCES Infos_Place(ID);
ALTER TABLE Reservation     ADD CONSTRAINT Reservation_Etat_Reservation_fk FOREIGN KEY (ETAT)             REFERENCES Etat_Reservation(ID);
ALTER TABLE Reservation_Personne ADD CONSTRAINT Reservation_Personne_Personne_fk FOREIGN KEY (PERSONNE) REFERENCES Personne(ID);
ALTER TABLE Reservation_Personne ADD CONSTRAINT Reservation_Personne_Reservation_fk FOREIGN KEY (RESERVATION) REFERENCES Reservation(ID);

ALTER TABLE Vol             ADD CONSTRAINT Vol_dateorder_ck             CHECK (DEPART <  ARRIVEE);
ALTER TABLE Infos_Escale    ADD CONSTRAINT Infos_escale_dateorder_ck    CHECK (DEPART <  ARRIVEE);
ALTER TABLE Compte          ADD CONSTRAINT Compte_courriel_syntax_ck    CHECK (COURRIEL LIKE '%_@__%.__%');
ALTER TABLE Passport        ADD CONSTRAINT Passport_numero_syntax_ck    CHECK (NUMERO LIKE '%[^A-Z0-9]%');
ALTER TABLE Adresse         ADD CONSTRAINT Adress_codepostal_syntax_ck  CHECK (CODE_POSTAL LIKE '%[^A-Z0-9]%');
ALTER TABLE Place           ADD CONSTRAINT Place_price_positive_ck      CHECK (PRIX > 0);
ALTER TABLE Infos_Place     ADD CONSTRAINT Infos_place_rangee_ck        CHECK (RANGEE LIKE '[A-H]');
ALTER TABLE Infos_Place     ADD CONSTRAINT Infos_place_siege_ck         CHECK (SIEGE > 0);














