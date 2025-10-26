-- public.external_etapas_funil definition

-- Drop table

-- DROP TABLE public.external_etapas_funil;

CREATE TABLE public.external_etapas_funil (
	id uuid DEFAULT gen_random_uuid() NULL,
	funil_id uuid NULL,
	external_id varchar NULL,
	nome varchar NULL,
	ordem int4 NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	canal_id uuid NULL,
	CONSTRAINT external_etapas_funil_external_id_key UNIQUE (external_id)
);