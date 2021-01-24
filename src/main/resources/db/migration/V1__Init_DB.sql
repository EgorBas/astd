create table hibernate_sequence
(
    next_val bigint
) engine = InnoDB;
insert into hibernate_sequence
values (1);

create table stations
(
    id             bigint       not null,
    stationnumber  integer      not null,
    stationcode    varchar(255) not null,
    stationname    varchar(255) not null,
    stationtype    varchar(255) not null,
    stationaddress varchar(255) not null,
    active         bit          not null,
    primary key (id)
) engine = InnoDB;

create table user_role
(
    user_id bigint not null,
    roles   varchar(255)
) engine = InnoDB;

create table users
(
    id         bigint       not null,
    active     bit          not null,
    email      varchar(255),
    firstname  varchar(255) not null,
    lastname   varchar(255) not null,
    password   varchar(255) not null,
    patronymic varchar(255) not null,
    username   varchar(255) not null,
    primary key (id)
) engine = InnoDB;

alter table user_role
    add constraint user_role_user_fk foreign key (user_id) references users (id);