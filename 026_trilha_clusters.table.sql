-- public.trilha_clusters definition

-- Drop table

-- DROP TABLE public.trilha_clusters;

CREATE TABLE public.trilha_clusters (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	slug varchar(64) NOT NULL,
	"name" varchar(255) NOT NULL,
	description text NULL,
	icon varchar(32) NULL,
	color varchar(32) NULL,
	display_order int4 DEFAULT 0 NOT NULL,
	is_active bool DEFAULT true NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_clusters_pkey PRIMARY KEY (id),
	CONSTRAINT trilha_clusters_slug_uniq UNIQUE (empresa_id, slug)
);
CREATE INDEX idx_trilha_clusters_empresa_order ON public.trilha_clusters USING btree (empresa_id, display_order, name);


-- public.trilha_clusters foreign keys

ALTER TABLE public.trilha_clusters ADD CONSTRAINT trilha_clusters_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;