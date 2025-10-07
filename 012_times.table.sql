-- public.times definition

-- Drop table

-- DROP TABLE public.times;

CREATE TABLE public.times (
	id uuid NOT NULL,
	rd_station_id varchar(24) NOT NULL,
	nome varchar(255) NOT NULL,
	created_at_rd timestamptz NOT NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	empresa_id uuid NULL,
	canal_id uuid NULL,
	created_at_external timestamptz NULL,
	CONSTRAINT times_pkey PRIMARY KEY (id),
	CONSTRAINT times_rd_station_id_key UNIQUE (rd_station_id)
);