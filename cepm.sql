create database if not exists cepm;

use cepm;

drop table if exists tbl_values;
drop table if exists regions;
drop table if exists sources;
drop table if exists components;

create table regions(
   reg_id int unsigned not null auto_increment primary key,
   region varchar(45) not null
);

insert into regions (region) values ('National'),
('Northeast'),('Midwest'),('South'),('West'),('Alabama'),('Alaska'),
('Arizona'),('Arkansas'),('California'),('Colorado'),('Connecticut'),
('Delaware'),('Florida'),('Georgia'),('Hawaii'),('Idaho'),('Illinois'),
('Indiana'),('Iowa'),('Kansas'),('Kentucky'),('Louisiana'),('Maine'),
('Maryland'),('Massachusetts'),('Michigan'),('Minnesota'),('Mississippi'),
('Missouri'),('Montana'),('Nebraska'),('Nevada'),('New Hampshire'),
('New Jersey'),('New Mexico'),('New York'),('North Carolina'),
('North Dakota'),('Ohio'),('Oklahoma'),('Oregon'),('Pennsylvania'),
('Rhode Island'),('South Carolina'),('South Dakota'),('Tennessee'),
('Texas'),('Utah'),('Vermont'),('Virginia'),('Washington'),
('West Virginia'),('Wisconsin'),('Wyoming');

create table sources(
    src_id int unsigned not null auto_increment primary key,
    source_desc varchar(45) not null,
    regional_data bit not null,
    regional_perc bit not null
);

insert into sources (source_desc, regional_data, regional_perc) values 
('Coal',1,1),('Natural Gas',1,1),('Petroleum',1,1),('Nuclear',1,0),('Hydro',1,0),
('Geothermal',1,0),('Solar/PV',1,0),('Wind',1,0),('Wood/Waste',1,0),('Fuel Ethanol',1,1),
('Biodiesel',0,0),('Index',1,1);

create table components(
   comp_id int unsigned not null auto_increment primary key,
   component varchar(45) not null
);

insert into components (component) values
('W&J Energy Index'),('W&J Energy Index (with Exports)'),
('Share of Energy Mix'),('Percent Sourced'),('Percent Sourced (with Exports)');

create table tbl_values(
    year_id year not null,
    reg_id int unsigned not null,
    src_id int unsigned not null,
    comp_id int unsigned not null,
    measurement decimal(24,20) unsigned not null,
    constraint tbl_values_pk primary key(year_id,reg_id,src_id,comp_id),
    constraint reg_fk foreign key (reg_id) references regions(reg_id),
    constraint src_fk foreign key (src_id) references sources(src_id),
    constraint comp_fk foreign key (comp_id) references components(comp_id)
);

