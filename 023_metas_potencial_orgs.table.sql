-- public.metas_potencial_orgs definition

-- Drop table

-- DROP TABLE public.metas_potencial_orgs;

CREATE TABLE public.metas_potencial_orgs (
	id uuid DEFAULT gen_random_uuid() NULL,
	ano int4 NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	valor float4 NULL,
	organizacao_id uuid NULL,
	organizacao_external_id varchar NULL,
	CONSTRAINT unique_organizacao_ano UNIQUE (organizacao_id, ano)
);