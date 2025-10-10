-- public.oportunidades definition

-- Drop table

-- DROP TABLE public.oportunidades;

CREATE TABLE public.oportunidades (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
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
);
CREATE INDEX idx_oportunidades_funil_id ON public.oportunidades USING btree (funil_id);


-- public.oportunidades foreign keys

ALTER TABLE public.oportunidades ADD CONSTRAINT fk_oportunidades_campanhas FOREIGN KEY (campanha_id) REFERENCES public.campanhas(id) ON DELETE SET NULL;
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_campanha_id_fkey FOREIGN KEY (campanha_id) REFERENCES public.campanhas(id) ON DELETE SET NULL;
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_canal_id_fkey FOREIGN KEY (canal_id) REFERENCES public.canais(id);
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_etapa_funil_id_fkey FOREIGN KEY (etapa_funil_id) REFERENCES public.etapas_funil(id);
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_funil_id_fkey FOREIGN KEY (funil_id) REFERENCES public.funis(id) ON DELETE SET NULL;
ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;