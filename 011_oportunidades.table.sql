/* CREATE TABLE public.oportunidades (
	
	empresa_id uuid NOT NULL,
	vendedor_id uuid NULL,
	canal_id uuid NULL,
	etapa_funil_id uuid NULL,
	valor numeric(12, 2) DEFAULT 0 NOT NULL,
	status varchar(20) DEFAULT 'ABERTA'::character varying NOT NULL,
	nome_oportunidade text NULL,
	closed_at date NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	campanha_id uuid NULL,
	external_id varchar(255) NULL,
	funil_id uuid NULL,
	win bool NULL,
	"hold" bool NULL,
	utm_source varchar(255) NULL,
	utm_medium varchar(255) NULL,
	utm_campaign varchar(255) NULL,
	utm_content varchar(255) NULL,
	fonte_id uuid NULL,
	external_created_at timestamptz NULL,
	external_updated_at timestamptz NULL,
	lost_reason json NULL,
	external_etapa_id varchar NULL,
	external_funil_id varchar NULL,
	qualificacao int4 NULL,
	prediction_date date NULL,
	custom_fields json NULL,
	external_products_id varchar NULL,
	organizacao_external_id varchar NULL,
	CONSTRAINT oportunidades_pkey PRIMARY KEY (id),
	CONSTRAINT oportunidades_rd_station_id_key UNIQUE (external_id)
); */

-- public.oportunidades definition

-- Drop table

-- DROP TABLE public.oportunidades;

CREATE TABLE public.oportunidades (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	vendedor_id uuid NULL,
	canal_id uuid NULL,
	etapa_funil_id uuid NULL,
	valor numeric(12, 2) DEFAULT 0 NOT NULL,
	status varchar(20) DEFAULT 'ABERTA'::character varying NOT NULL,
	nome_oportunidade text NULL,
	closed_at date NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	external_id varchar(255) NULL,
	funil_id uuid NULL,
	win bool NULL,
	external_created_at timestamptz NULL,
	external_updated_at timestamptz NULL,
	external_etapa_id varchar NULL,
	external_funil_id varchar NULL,
	qualificacao int4 NULL,
	prediction_date date NULL,
	external_products_id jsonb NULL,
	organizacao_external_id varchar NULL,
	loss_reason_id uuid NULL,
	contato_external_id varchar NULL,
	custom_fields jsonb NULL,
	CONSTRAINT oportunidades_pkey PRIMARY KEY (id),
	CONSTRAINT oportunidades_rd_station_id_key UNIQUE (external_id)
);


-- public.oportunidades foreign keys

ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;