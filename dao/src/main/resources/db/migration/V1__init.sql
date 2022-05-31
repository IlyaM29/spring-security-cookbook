create table users (
  id                    bigserial,
  username              varchar(30) not null unique,
  password              varchar(80) not null,
  email                 varchar(50) unique,
  primary key (id)
);

create table roles (
  id                    serial,
  name                  varchar(50) not null,
  primary key (id)
);

create table authorities (
                       id                    serial,
                       name                  varchar(50) not null,
                       primary key (id)
);

CREATE TABLE users_roles (
  user_id               bigint not null,
  role_id               int not null,
  primary key (user_id, role_id),
  foreign key (user_id) references users (id),
  foreign key (role_id) references roles (id)
);

CREATE TABLE roles_authorities (
                             role_id               int not null,
                             authority_id               int not null,
                             primary key (role_id, authority_id),
                             foreign key (role_id) references roles (id),
                             foreign key (authority_id) references authorities (id)
);

insert into roles (name)
values
    ('ROLE_USER'),
    ('ROLE_ADMIN');

insert into authorities (name)
values
    ('READ'),
    ('WRITE'),
    ('UPDATE'),
    ('DELETE');

insert into users (username, password, email)
values
('user', '$2a$12$SElNLfiqG5eFHkXbWK61xOzYL.Jv5DwR5MX7voawbckN/dtiLBn7C', 'user@gmail.com');

insert into users_roles (user_id, role_id)
values
(1, 2);

insert into roles_authorities (role_id, authority_id)
values
    (1, 1),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4);