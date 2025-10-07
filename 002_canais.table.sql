-- public.canais definition

-- Drop table

-- DROP TABLE public.canais;

CREATE TABLE public.canais (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	nome varchar(255) NOT NULL,
	tipo varchar(50) NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	config_api jsonb NULL,
	is_integration bool DEFAULT false NOT NULL,
	CONSTRAINT canais_empresa_id_nome_key UNIQUE (empresa_id, nome),
	CONSTRAINT canais_pkey PRIMARY KEY (id)
);


-- public.canais foreign keys

ALTER TABLE public.canais ADD CONSTRAINT canais_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;