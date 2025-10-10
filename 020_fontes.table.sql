-- public.fontes definition

-- Drop table

-- DROP TABLE public.fontes;

CREATE TABLE public.fontes (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	external_id varchar NOT NULL,
	nome varchar NULL,
	external_created_at timestamptz NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	CONSTRAINT fontes_pkey PRIMARY KEY (id),
	CONSTRAINT fontes_external_id_key UNIQUE (external_id)
);
