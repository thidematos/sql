-- public.produtos definition

-- Drop table

-- DROP TABLE public.produtos;

CREATE TABLE public.produtos (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	external_id varchar NOT NULL,
	visible bool NULL,
	"name" varchar NULL,
	base_price varchar NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	CONSTRAINT produtos_pkey PRIMARY KEY (id),
	CONSTRAINT produtos_external_id_key UNIQUE (external_id)
);
