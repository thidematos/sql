-- public.atividades definition

-- Drop table

-- DROP TABLE public.atividades;

CREATE TABLE public.atividades (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	vendedor_id uuid NULL,
	oportunidade_id uuid NULL,
	pipedrive_id int4 NULL,
	tipo varchar(50) NOT NULL,
	titulo text NULL,
	concluida bool DEFAULT false NULL,
	data_atividade timestamptz NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	dados_originais jsonb NULL,
	rd_station_id varchar(255) NULL,
	canal_id uuid NULL,
	CONSTRAINT atividades_pipedrive_id_key UNIQUE (pipedrive_id),
	CONSTRAINT atividades_pkey PRIMARY KEY (id),
	CONSTRAINT atividades_rd_station_id_key UNIQUE (rd_station_id)
);


-- public.atividades foreign keys

ALTER TABLE public.atividades ADD CONSTRAINT atividades_canal_id_fkey FOREIGN KEY (canal_id) REFERENCES public.canais(id) ON DELETE SET NULL;
ALTER TABLE public.atividades ADD CONSTRAINT atividades_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;
ALTER TABLE public.atividades ADD CONSTRAINT atividades_oportunidade_id_fkey FOREIGN KEY (oportunidade_id) REFERENCES public.oportunidades(id) ON DELETE SET NULL;