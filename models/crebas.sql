/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     31.03.2021 12:46:41                          */
/*==============================================================*/


drop table if exists commercial;

drop table if exists contract_detail;

drop table if exists organization_type;

drop table if exists payment;

drop table if exists rentel_space;

drop table if exists renter;

drop table if exists ñontract;

/*==============================================================*/
/* Table: commercial                                            */
/*==============================================================*/
create table commercial
(
   organization_INN     varchar(12) not null,
   organization_type_id int not null,
   organization_name    varchar(255) not null,
   organization_address varchar(1024),
   organization_phone   varchar(10),
   organization_account varchar(12),
   organization_bank    varchar(255),
   organization_bank_BIC varchar(9),
   organization_caccount varchar(20),
   organization_contact varchar(255),
   primary key (organization_INN)
);

/*==============================================================*/
/* Table: contract_detail                                       */
/*==============================================================*/
create table contract_detail
(
   area_code            varchar(10) not null,
   contract_number      varchar(10) not null,
   contract_date        date not null,
   rentel_start_date    date,
   rentel_end_date      date,
   primary key (area_code, contract_number, contract_date)
);

/*==============================================================*/
/* Table: organization_type                                     */
/*==============================================================*/
create table organization_type
(
   organization_type_id int not null auto_increment,
   organization_type_name varchar(255) not null,
   primary key (organization_type_id)
);

/*==============================================================*/
/* Table: payment                                               */
/*==============================================================*/
create table payment
(
   contract_number      varchar(10) not null,
   contract_date        date not null,
   payment_date         date not null,
   payment_sum          float(8,2) not null,
   primary key (contract_number, contract_date, payment_date)
);

/*==============================================================*/
/* Table: rentel_space                                          */
/*==============================================================*/
create table rentel_space
(
   area_code            varchar(10) not null,
   floor                int not null,
   area                 int not null,
   has_ac               bool not null,
   price                float(8,2) not null,
   primary key (area_code)
);

/*==============================================================*/
/* Table: renter                                                */
/*==============================================================*/
create table renter
(
   rental_id            int not null auto_increment,
   organization_INN     varchar(12) not null,
   is_active            bool not null,
   primary key (rental_id)
);

/*==============================================================*/
/* Table: ñontract                                              */
/*==============================================================*/
create table ñontract
(
   contract_number      varchar(10) not null,
   contract_date        date not null,
   rental_id            int not null,
   primary key (contract_number, contract_date)
);

alter table commercial add constraint FK_apply_to foreign key (organization_type_id)
      references organization_type (organization_type_id) on delete restrict on update restrict;

alter table contract_detail add constraint FK_contract_detail foreign key (area_code)
      references rentel_space (area_code) on delete restrict on update restrict;

alter table contract_detail add constraint FK_contract_detail2 foreign key (contract_number, contract_date)
      references ñontract (contract_number, contract_date) on delete restrict on update restrict;

alter table payment add constraint FK_has_detail foreign key (contract_number, contract_date)
      references ñontract (contract_number, contract_date) on delete restrict on update restrict;

alter table renter add constraint FK_is foreign key (organization_INN)
      references commercial (organization_INN) on delete restrict on update restrict;

alter table ñontract add constraint FK_negootiate foreign key (rental_id)
      references renter (rental_id) on delete restrict on update restrict;

