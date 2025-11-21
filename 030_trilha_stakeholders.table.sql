-- public.trilha_stakeholders definition

-- Drop table

-- DROP TABLE public.trilha_stakeholders;

CREATE TABLE public.trilha_stakeholders (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	trilha_id uuid NOT NULL,
	"role" varchar(50) NOT NULL,
	nome varchar(255) NOT NULL,
	email varchar(255) NULL,
	telefone varchar(50) NULL,
	avatar_url text NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_stakeholders_pkey PRIMARY KEY (id),
	CONSTRAINT trilha_stakeholders_role_check CHECK (((role)::text = ANY (ARRAY[('beneficiary'::character varying)::text, ('petitioner'::character varying)::text, ('owner'::character varying)::text, ('observer'::character varying)::text])))
);
CREATE INDEX idx_trilha_stakeholders_trilha_role ON public.trilha_stakeholders USING btree (trilha_id, role);


-- public.trilha_stakeholders foreign keys

ALTER TABLE public.trilha_stakeholders ADD CONSTRAINT trilha_stakeholders_trilha_id_fkey FOREIGN KEY (trilha_id) REFERENCES public.trilhas(id) ON DELETE CASCADE;