create table users
(
    user_id     integer generated by default as identity
        constraint users_pkey
            primary key,
    name        varchar(250) not null,
    last_name   varchar(250) not null,
    email       varchar(250) not null,
    id_document integer      not null,
    username    varchar(250) not null,
    password    varchar(250) not null,
    created_at  date,
    updated_at  date
);

alter table users
    owner to postgres;

create table rol
(
    rol_id  integer generated by default as identity
        constraint rol_pkey
            primary key,
    name    varchar(250),
    user_id integer
        constraint fk_user_role
            references users
);

alter table rol
    owner to postgres;

create table country
(
    country_id integer generated by default as identity
        constraint country_pkey
            primary key,
    name       varchar(250),
    created_at date,
    updated_at date
);

alter table country
    owner to postgres;

create table institution
(
    institution_id integer generated by default as identity
        constraint institution_pkey
            primary key,
    name           varchar(250),
    created_at     date,
    updated_at     date
);

alter table institution
    owner to postgres;

create table donation
(
    donation_id      integer generated by default as identity
        constraint donation_pkey
            primary key,
    donation_amount  numeric(15, 2) not null,
    date_of_donation date,
    user_id          integer
        constraint fk_user_donation
            references users,
    country_id       integer
        constraint fk_country_donation
            references country,
    institution_id   integer
        constraint fk_institution_donation
            references institution,
    currency         varchar(255)
);

alter table donation
    owner to postgres;


