drop table users, urls, sessions cascade;

create table if not exists users (
u_id serial primary key,
u_name varchar(60) not null,
email varchar(50) not null unique,
u_password varchar(20) not null,
createdAt timestamp default Now() not null
);

create table if not exists urls (
url_id serial primary key,
user_id integer not null,
url text not null,
short_url text,
visit_count integer default 0 not null,
createdAt timestamp default Now() not null,
foreign key(user_id) references users(u_id)
);

create table if not exists sessions (
id serial primary key,
user_id integer not null,
u_token text not null unique,
createdAt timestamp default now() not null,
foreign key(user_id) references users(u_id)
);