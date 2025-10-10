-- public.contatos definition

-- Drop table

-- DROP TABLE public.contatos;

CREATE TABLE public.contatos (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	rd_id varchar NOT NULL,
	nome varchar NULL,
	title varchar NULL,
	organization_rd_id varchar NULL,
	created_at date DEFAULT now() NOT NULL,
	updated_at date DEFAULT now() NOT NULL,
	created_at_rd varchar NULL,
	oportunidades jsonb NULL,
	CONSTRAINT contatos_pkey PRIMARY KEY (id),
	CONSTRAINT contatos_rd_id_key UNIQUE (rd_id)
);
