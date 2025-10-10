-- public.funis definition

-- Drop table

-- DROP TABLE public.funis;

CREATE TABLE public.funis (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	nome varchar(255) NOT NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	"order" int4 NULL,
	external_id varchar NULL,
	CONSTRAINT funis_pkey PRIMARY KEY (id),
	CONSTRAINT funis_external_id_key UNIQUE (external_id)
);
