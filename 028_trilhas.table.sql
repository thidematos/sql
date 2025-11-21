-- public.trilhas definition

-- Drop table

-- DROP TABLE public.trilhas;

CREATE TABLE public.trilhas (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	nome varchar(255) NOT NULL,
	descricao text NULL,
	icon varchar(32) NULL,
	color varchar(32) NULL,
	status varchar(30) DEFAULT 'to_be_completed'::character varying NOT NULL,
	"cluster" varchar(50) NOT NULL,
	priority int2 DEFAULT 0 NOT NULL,
	progress int2 DEFAULT 0 NOT NULL,
	required bool DEFAULT false NOT NULL,
	estimated_duration varchar(100) NULL,
	display_order int4 DEFAULT 0 NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilhas_pkey PRIMARY KEY (id),
	CONSTRAINT trilhas_progress_check CHECK (((progress >= 0) AND (progress <= 100))),
	CONSTRAINT trilhas_status_check CHECK (((status)::text = ANY (ARRAY[('locked'::character varying)::text, ('to_be_completed'::character varying)::text, ('in_progress'::character varying)::text, ('completed'::character varying)::text])))
);
CREATE INDEX idx_trilhas_empresa_cluster ON public.trilhas USING btree (empresa_id, cluster);


-- public.trilhas foreign keys

ALTER TABLE public.trilhas ADD CONSTRAINT trilhas_cluster_fk FOREIGN KEY (empresa_id,"cluster") REFERENCES public.trilha_clusters(empresa_id,slug) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public.trilhas ADD CONSTRAINT trilhas_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;

