-- public.mapeamento_etapas definition

-- Drop table

-- DROP TABLE public.mapeamento_etapas;

CREATE TABLE public.mapeamento_etapas (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	external_id varchar(255) NOT NULL,
	etapa_funil_id uuid NOT NULL,
	funil_id uuid NULL,
	CONSTRAINT mapeamento_etapas_pkey PRIMARY KEY (id)
);


-- public.mapeamento_etapas foreign keys

ALTER TABLE public.mapeamento_etapas ADD CONSTRAINT mapeamento_etapas_etapa_funil_id_fkey FOREIGN KEY (etapa_funil_id) REFERENCES public.etapas_funil(id) ON DELETE CASCADE;