-- public.empresas definition

-- Drop table

-- DROP TABLE public.empresas;

CREATE TABLE public.empresas (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	nome varchar(255) NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT empresas_nome_key UNIQUE (nome),
	CONSTRAINT empresas_pkey PRIMARY KEY (id)
);