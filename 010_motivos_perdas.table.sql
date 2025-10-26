-- public.motivos_perdas definition

-- Drop table

-- DROP TABLE public.motivos_perdas;

CREATE TABLE public.motivos_perdas (
	id uuid DEFAULT gen_random_uuid() NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	external_id varchar NULL,
	"name" varchar NULL,
	CONSTRAINT motivos_perdas_external_id_unique UNIQUE (external_id)
);