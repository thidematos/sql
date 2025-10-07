-- public.etapas_funil definition

-- Drop table

-- DROP TABLE public.etapas_funil;

CREATE TABLE public.etapas_funil (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	nome varchar(255) NOT NULL,
	ordem int4 NOT NULL,
	external_funil_id varchar NULL,
	external_id varchar NULL,
	funil_id uuid NULL,
	CONSTRAINT etapas_funil_pkey PRIMARY KEY (id)
);