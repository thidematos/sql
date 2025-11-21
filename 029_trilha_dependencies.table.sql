-- public.trilha_dependencies definition

-- Drop table

-- DROP TABLE public.trilha_dependencies;

CREATE TABLE public.trilha_dependencies (
	trilha_id uuid NOT NULL,
	depends_on_trilha_id uuid NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_dependencies_check CHECK ((trilha_id <> depends_on_trilha_id)),
	CONSTRAINT trilha_dependencies_pkey PRIMARY KEY (trilha_id, depends_on_trilha_id)
);


-- public.trilha_dependencies foreign keys

ALTER TABLE public.trilha_dependencies ADD CONSTRAINT trilha_dependencies_trilha_id_fkey FOREIGN KEY (trilha_id) REFERENCES public.trilhas(id) ON DELETE CASCADE;