select * from planes

CREATE TABLE IF NOT EXISTS public.planes
(
    id integer NOT NULL DEFAULT nextval('planes_id_seq'::regclass),
    model character varying(50) COLLATE pg_catalog."default" NOT NULL,
    type_of character varying(10) COLLATE pg_catalog."default" NOT NULL,
    range_km integer NOT NULL,
    lifting_kg integer NOT NULL,
    engine character varying(50) COLLATE pg_catalog."default" NOT NULL,
    airframe character varying(12) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT planes_pkey PRIMARY KEY (id)
)

insert into planes (model, type_of, range_km, lifting_kg, engine, airframe)
	values ('boieng', '747', 5000, 10000, 'RR', 'passenger'),
		   ('tupolev', '154', 5500, 11000, 'TU', 'passenger'),
	       ('an', '218', 7000, 20000, 'AN', 'cargo'),
	       ('embraer', 'e-190', 4260, 8000, 'VNT', 'passenger'),
	       ('saab', '2000',  7000, 5000, 'VNT', 'passenger'),
	       ('airbus', 'a220', 8500, 5000, 'RR', 'passenger');


select * flights

CREATE TABLE IF NOT EXISTS public.flights
(
    id integer NOT NULL DEFAULT nextval('flights_id_seq'::regclass),
    from_airport character varying(50) COLLATE pg_catalog."default",
    to_airport character varying(50) COLLATE pg_catalog."default",
    distances double precision,
    cargo_kg double precision,
    plane_id integer,
    CONSTRAINT flights_pkey PRIMARY KEY (id),
    CONSTRAINT flights_plane_id_fkey FOREIGN KEY (plane_id)
        REFERENCES public.planes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


insert into flights (from_airport, to_airport, distances, cargo_kg, plane_id)
values ('Москва', 'Владивосток', 7500, 6000, 1),
       ('Москва', 'Самара', 2500, 9000, 2),
	   ('Москва', 'Минск', 1500, 19000, 6),
	   ('Санкт-Петербург', 'Москва', 850, 5000, 4),
	   ('Минск', 'Москва', 1500, 15000, 6);



select * from flights f
	join planes p on f.plane_id = p.id


