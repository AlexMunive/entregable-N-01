CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "gender" varchar NOT NULL DEFAULT 'masculino',
  "birthday" date NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "categories_id" uuid,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "editorial" varchar NOT NULL,
  "cost" money NOT NULL DEFAULT '450',
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL
);

CREATE TABLE "course_Video" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid,
  "title" varchar NOT NULL,
  "date_edition" varchar NOT NULL,
  "author" text DEFAULT 'anonimo',
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "name" varchar NOT NULL,
  "section" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "name" varchar NOT NULL,
  "status" bool DEFAULT false
);

-- table del reto opcional n1

CREATE TABLE "course_enrolled_percentage" (
  "id" uuid PRIMARY KEY,
  "id_courses" uuid,
  "attendance" int NOT NULL,
  "percentage" varchar NOT NULL
);

ALTER TABLE "roles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "course_Video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

-- Section users

insert into users (
 id,
 first_name,
 last_name,
 email,
 password,
 age,
 gender,
 birthday
) values (
'358f9e74-e936-41bd-b94b-5d8540dc74b8',
'Pedro Manuel',
'Rojas Torres',
'pedro_manuel13@gmail.com',
'12345',
23,
'Masculino',
'1998-10-13'
) , (
'69145904-fd6a-44e8-8d7c-ae58121dd84f',
'Maria Gracia',
'Perales Martines',
'maria_perales@gmail.com',
'maria',
25,
'Femenino',
'1996-08-06'
);

-- Section roles

insert into roles (
id,
users_id,
name,
status
) values (
'81fdc7f8-ebf9-41a1-80a0-589a7ec4ef12',
'358f9e74-e936-41bd-b94b-5d8540dc74b8',
'student',
true
) , (
'143351d2-a364-4da0-9413-3cf9c237e37b',
'69145904-fd6a-44e8-8d7c-ae58121dd84f',
'student',
true
);

-- section categories

insert into categories (
id,
users_id,
name,
section
) values (
'22cb6a83-ad6d-4a88-b474-ca1d9267a07b',
'358f9e74-e936-41bd-b94b-5d8540dc74b8',
'engineering',
'industrial'
) , (
'713cee9d-4cb7-48a2-a269-4f52b5bdb61c',
'69145904-fd6a-44e8-8d7c-ae58121dd84f',
'psychology',
'business'
);

-- section courses

insert into courses (
id,
categories_id,
title,
description,
editorial,
cost,
level,
teacher
) values (
'80b301be-186a-4520-8b72-e5c5b80a4e82',
'22cb6a83-ad6d-4a88-b474-ca1d9267a07b',
'Investigación de operaciones I',
'es una disciplina que se ocupa de la aplicación de métodos analíticos avanzados para ayudar a tomar mejores decisiones',
'fondo editorial',
500,
'principiante',
'Juan Carlos Gallardo Manrique'

), (
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
'22cb6a83-ad6d-4a88-b474-ca1d9267a07b',
'ingenieria de metodos I',
'se basa en el registro y examen crítico sistemático de la metodología existente',
'ecoe ediciones',
600,
'principiante',
'Alfredo Perez Salazar'

) , (

'54499241-1ab1-4b06-9903-52cf08f3e81d',
'713cee9d-4cb7-48a2-a269-4f52b5bdb61c',
'psicologia organizacional',
'estudia el comportamiento humano en el lugar de trabajo',
'Manual Moderno',
450,
'medio',
'Felipe Munoz Alvarado'

) , (
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
'713cee9d-4cb7-48a2-a269-4f52b5bdb61c',
'psicoterapeuta',
'proceso que ayuda a comprender y cambiar nuestra manera de pensar, percibir y hacer las cosas',
'Piramide',
550,
'avanzado',
'Maria Fernanda Palacios Torres'

);


-- section course_video

insert into "course_Video" (

id,
courses_id,
title,
date_edition,
author,
url
) values (
'7b944d08-e080-4cc9-ad41-8f2250284be0',
'80b301be-186a-4520-8b72-e5c5b80a4e82',
'Bienvenida al curso de Investigación de Operaciones (IO)',
'2021',
'Marcel Ruiz',
'https://www.youtube.com/watch?v=g8xEfPIB0JE&list=PLZmWVIAvUcmEgy8DB_1dilfCdyKRALUI1'

) , (

'1e2b697a-cfdc-4d4a-b602-da464bee8ec2',
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
'Ingeniería de Métodos 1',
'2020',
'anonimo',
'https://www.youtube.com/watch?v=RKt1qMmvIrU'

) , (

'a2916279-a64d-4f45-ac88-c45eb1067267',
'54499241-1ab1-4b06-9903-52cf08f3e81d',
'CURSO: PSICOLOGÍA ORGANIZACIONAL - 2022',
'2020',
'anonimo',
'https://www.youtube.com/watch?v=RKt1qMmvIrU'

) , (

'd1dd9cfb-9b0f-40ab-b43c-fe442c89e625',
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
'Qué es un PSICOTERAPEUTA,👩‍⚕️ y en que consiste la PSICOTERAPIA',
'2020',
'anonimo',
'https://www.youtube.com/watch?v=2x1zMMT071Y'

);


-- section courso_inscrito_porcentaje

insert into course_enrolled_percentage (

id,
id_courses,
attendance,
percentage
) values (
'dc47d58a-c6ab-4628-970e-4e705973c95f',
'80b301be-186a-4520-8b72-e5c5b80a4e82',
10,
30
) , (
'b241a213-faab-4d88-b27f-b5ff14b18a8e',
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
12,
35
) , (
'976297b7-e8ea-4fee-ad9f-140663d8f9b6',
'54499241-1ab1-4b06-9903-52cf08f3e81d',
12,
35
) , (
'735fea32-b2bb-4bb7-8649-74d1ac385a09',
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
15,
38
) ;

-- review del curso

create view curse_in_process as select * from course_enrolled_percentage;

-- select * from

select * from courses ;
select * from "course_Video" ;

-- en este join, la tabla A=courses B="course_Video", la tabla principal es courses

select * from courses left join "course_Video" on courses.id  = courses_id ;

select courses.id as courses_id_initial, courses.title, "course_Video".title  from courses left join "course_Video" on courses.id  = courses_id;

-- en este join, la tabla A="course_Video" B="courses, la tabla principal es "course_Video" (reto opcional n2)


select * from "course_Video" left join courses on courses_id  = courses.id ;





