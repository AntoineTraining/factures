drop table article;
drop table ligne;
drop table facture;

create table article
       (
       art_id               number(10)    not null,
       art_nom              varchar2(40)  not null,
	   art_pu               number(10,2)    not null
       )
;

Create unique index i_art_id on article (art_id);
drop sequence seq_art_id;
create sequence seq_art_id start with 1 increment by 1;

create table facture
       (
	   fac_id               number(10)    not null,
       fac_date             date          not null,
       fac_nom              varchar2(40)  not null,
	   fac_montant          number(10,2)
       )
;

Create unique index i_fac_id on facture (fac_id);
drop sequence seq_fac_id;
create sequence seq_fac_id start with 1 increment by 1;


create table ligne
       (
	   fac_id               number(10)    not null,
       lig_id               number(10)    not null,
       lig_nom              varchar2(40)  not null,
	   lig_qte              number(10,2)  not null,	   
	   art_id               number(10)    not null
       )
;

Create unique index i_fac_lig_id on ligne (fac_id, lig_id);
Create index i_lig_art_id on ligne (art_id);

insert into article (art_id, art_nom, art_pu) values (1,'POMME',2);
insert into article (art_id, art_nom, art_pu) values (2,'POIRE',3.5);
insert into article (art_id, art_nom, art_pu) values (3,'ORANGE',2.7);
insert into article (art_id, art_nom, art_pu) values (4,'CAROTTE',2.1);
insert into article (art_id, art_nom, art_pu) values (5,'PATATE',1.2);
insert into article (art_id, art_nom, art_pu) values (6,'VIANDE',4.1);
insert into article (art_id, art_nom, art_pu) values (7,'POISSON',3.8);
insert into article (art_id, art_nom, art_pu) values (8,'LAIT',1.1);
insert into article (art_id, art_nom, art_pu) values (9,'EAU',0.7);
insert into article (art_id, art_nom, art_pu) values (10,'CAFE',5);
insert into article (art_id, art_nom, art_pu) values (11,'CHOCOLAT',3.5);
insert into article (art_id, art_nom, art_pu) values (12,'MANDARINE',1.9);
