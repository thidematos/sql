-- public.vendedores definition

-- Drop table

-- DROP TABLE public.vendedores;

CREATE TABLE public.vendedores (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	nome varchar(255) NOT NULL,
	email varchar(255) NULL,
	pipedrive_id int4 NULL,
	rd_station_id varchar(255) NULL,
	ativo bool DEFAULT true NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT vendedores_pipedrive_id_key UNIQUE (pipedrive_id),
	CONSTRAINT vendedores_pkey PRIMARY KEY (id),
	CONSTRAINT vendedores_rd_station_id_key UNIQUE (rd_station_id)
);


-- public.vendedores foreign keys

ALTER TABLE public.vendedores ADD CONSTRAINT vendedores_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;