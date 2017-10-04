-- set serveroutput on format wrapped;
--
-- DBMS_OUTPUT.put_line('Drop table if exist');

/*======================== tables without foreign key ========================*/
CREATE TABLE Aeroport (
	ID        NUMBER,
	CODE_IATA VARCHAR(3),
	NOM       VARCHAR(100),

	CONSTRAINT Aeroport_pk PRIMARY KEY (ID),
	CONSTRAINT Aeroport_code_iata_un UNIQUE(CODE_IATA)
);

CREATE TABLE Ville (
	ID      NUMBER,
	PAYS    NUMBER,
	NOM     VARCHAR2(100),

	CONSTRAINT Ville_pk PRIMARY KEY (ID)
);

CREATE TABLE Ville_Desservie (
	AEROPORT NUMBER,
	VILLE    NUMBER,

	CONSTRAINT Ville_Desservie_PK PRIMARY KEY (AEROPORT, VILLE)
);

CREATE TABLE Compagnie_Aerienne (
	ID  NUMBER,
	NOM VARCHAR2(100),

	CONSTRAINT Compagnie_Aerienne_pk PRIMARY KEY (ID)
);

CREATE TABLE Pays (
	ID  NUMBER,
	NOM VARCHAR2(100),

	CONSTRAINT Pays_pk PRIMARY KEY (ID)
);

CREATE TABLE Province (
	ID  NUMBER,
	NOM VARCHAR2(100),

	CONSTRAINT Pays_pk PRIMARY KEY (ID)
);

CREATE TABLE Passport (
	ID     NUMBER,
	NUMERO VARCHAR2(12),

	CONSTRAINT Passport_pk PRIMARY KEY (ID),
	CONSTRAINT Passport_no_un UNIQUE (NUMERO)
);

CREATE TABLE Compte (
	ID       NUMBER,
	COURRIEL VARCHAR2(100),
	PASSWORD VARCHAR2(255),

	CONSTRAINT Compte_pk PRIMARY KEY (ID)
);

CREATE TABLE Type_Personne (
	ID      NUMBER,
	TYPE    VARCHAR2(100),

	CONSTRAINT Type_Personne_pk PRIMARY KEY(id)
);

CREATE TABLE Etat_Reservation(
	ID      NUMBER,
	LIBELLE VARCHAR2(100),

	CONSTRAINT Etat_Reservation_pk PRIMARY KEY(id)
);

CREATE TABLE Statut (
	ID      NUMBER,
	LIBELLE VARCHAR2(100),

	CONSTRAINT Statut_pk PRIMARY KEY(ID)
);

CREATE TABLE Infos_Place (
	ID          NUMBER,
	RANGEE      CHAR(1),
	SIEGE       NUMBER(2),
	DISPONIBLE  CHAR(1),

	CONSTRAINT Infos_Place_pk PRIMARY KEY(ID),
	CONSTRAINT Infos_Place_siege_un UNIQUE (SIEGE)
);

CREATE TABLE Classe (
	ID          NUMBER,
	LIBELLE     VARCHAR2(100),

	CONSTRAINT Classe_pk PRIMARY KEY(ID)
);

CREATE TABLE Infos_Escale (
	ID      NUMBER,
	ARRIVEE DATE,
	DEPART  DATE,

	CONSTRAINT Infos_escale_pk PRIMARY KEY (ID)
);

CREATE TABLE Telephone (
	ID          NUMBER,
	CODE_PAYS   NUMBER(1),
	CODE_REGION NUMBER(3),
	NUMERO     NUMBER(7),

	CONSTRAINT Telephone_pk PRIMARY KEY (ID),
	CONSTRAINT Telephone_numero_un UNIQUE (NUMERO)
);

/*======================== tables with foreign key ========================*/

CREATE TABLE Province_Pays (
	PAYS        NUMBER,
	PROVINCE    NUMBER,

	CONSTRAINT Province_Pays_pk PRIMARY KEY (PAYS, PROVINCE)
);

CREATE TABLE Adresse (
	ID          NUMBER,
	NUMERO      NUMBER,
	APP         CHAR(1),
	RUE         VARCHAR2(255),
	VILLE       VARCHAR2(255),
	CODE_POSTAL VARCHAR2(6),
	PAYS        NUMBER,
	PROVINCE    NUMBER,

	CONSTRAINT Adresse_pk PRIMARY KEY (ID)
);

CREATE TABLE Adresse_Personne (
	ADRESSE     NUMBER,
	PERSONNE    NUMBER,

	CONSTRAINT Adresse_Personne_pk PRIMARY KEY (ADRESSE, PERSONNE)
);

CREATE TABLE Place (
	VOL         NUMBER,
	CLASSE      NUMBER,
	PLACE       NUMBER,
	PRIX        NUMBER(7,2),

	CONSTRAINT Adresse_Personne_pk PRIMARY KEY (VOL, CLASSE, PLACE)
);

CREATE TABLE Escale (
	VOL      NUMBER,
	AEROPORT NUMBER,
	ESCALE   NUMBER,

	CONSTRAINT Escale_pk PRIMARY KEY (VOL, AEROPORT)
);

CREATE TABLE Vol (
	ID              NUMBER,
	NUMERO         VARCHAR2(15),
	COMPAGNIE       NUMBER,
	DEPART          DATE,
	ARRIVEE         DATE,
	AEROPORT_DEPART NUMBER,
	AEROPORT_ARRIVE NUMBER,
	STATUT          NUMBER,

	CONSTRAINT Vol_pk PRIMARY KEY (ID),
	CONSTRAINT Vol_numero_un UNIQUE (NUMERO)
);

CREATE TABLE Personne (
	ID            NUMBER,
	NOM           VARCHAR2(100),
	PRENOM        VARCHAR2(100),
	TYPE_PERSONNE NUMBER,
	PASSEPORT     NUMBER,
	COMPTE        NUMBER,

	CONSTRAINT Personne_pk PRIMARY KEY (ID),
	CONSTRAINT Personne_passport_un UNIQUE (PASSEPORT),
	CONSTRAINT Personne_compte_un UNIQUE (COMPTE)
);

CREATE TABLE Reservation_Personne (
	PERSONNE    NUMBER,
	RESERVATION NUMBER,

	CONSTRAINT Reservation_Personne_pk PRIMARY KEY (PERSONNE, RESERVATION)
);

CREATE TABLE Reservation (
	ID      NUMBER,
	NUMERO  VARCHAR2(25),
	DATE    DATE,
	ETAT    NUMBER,

	CONSTRAINT Reservation_pk PRIMARY KEY (ID)
);

CREATE TABLE Reservation_Vol (
	VOL         NUMBER,
	RESERVATION NUMBER,

	CONSTRAINT Reservation_Vol_pk PRIMARY KEY (VOL, RESERVATION)
);

CREATE TABLE Telephone_Personne(
	PERSONNE    NUMBER,
	TELEPHONE   NUMBER,

	CONSTRAINT Telephone_Personne_pk PRIMARY KEY (PERSONNE, TELEPHONE)
);

/*======================== constraints foreign keys ========================*/

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

