-- public.campanhas definition

-- Drop table

-- DROP TABLE public.campanhas;

CREATE TABLE public.campanhas (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	canal_id uuid NOT NULL,
	id_externo varchar(255) NOT NULL,
	nome varchar(255) NOT NULL,
	status varchar(50) NULL,
	dados_originais jsonb NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT campanhas_empresa_id_canal_id_id_externo_key UNIQUE (empresa_id, canal_id, id_externo),
	CONSTRAINT campanhas_pkey PRIMARY KEY (id)
);


-- public.campanhas foreign keys

ALTER TABLE public.campanhas ADD CONSTRAINT campanhas_canal_id_fkey FOREIGN KEY (canal_id) REFERENCES public.canais(id) ON DELETE CASCADE;
ALTER TABLE public.campanhas ADD CONSTRAINT campanhas_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;