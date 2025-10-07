-- public.usuarios definition

-- Drop table

-- DROP TABLE public.usuarios;

CREATE TABLE public.usuarios (
	id uuid NOT NULL,
	empresa_id uuid NOT NULL,
	nome varchar(255) NULL,
	email varchar(255) NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT usuarios_email_key UNIQUE (email),
	CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);


-- public.usuarios foreign keys

ALTER TABLE public.usuarios ADD CONSTRAINT usuarios_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;