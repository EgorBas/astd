create table hibernate_sequence
(
    next_val bigint
) engine = InnoDB;
insert into hibernate_sequence
values (2);

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

INSERT INTO users (id, active, email, firstname, lastname, password, patronymic, username)
VALUES (1, true, 'basinskii_gv@vitebsk.beltelecom.by', 'Басинский', 'Георгий',
        '$2a$08$toy8kwubCDpl9L2gxwa3SOe6EDWAaXYdf800mF1PT9WodjdAEROA.', 'Владимирович', 'egorbas');

INSERT INTO user_role (user_id, roles)
VALUES (1, 'ADMIN'),
       (1, 'SERVICE_MANAGER'),
       (1, 'OPERATOR');