-- public.fontes definition

-- Drop table

-- DROP TABLE public.fontes;

CREATE TABLE public.fontes (
	id uuid DEFAULT gen_random_uuid() NULL,
	external_id varchar NULL,
	nome varchar NULL,
	external_created_at timestamptz NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL
);