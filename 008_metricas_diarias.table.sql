-- public.metricas_diarias definition

-- Drop table

-- DROP TABLE public.metricas_diarias;

CREATE TABLE public.metricas_diarias (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	"data" date NOT NULL,
	custo numeric(12, 2) DEFAULT 0 NOT NULL,
	dados_originais jsonb NULL,
	campanha_id uuid NULL,
	cliques int4 DEFAULT 0 NULL,
	impressoes int4 DEFAULT 0 NULL,
	conversoes int4 DEFAULT 0 NULL,
	CONSTRAINT custos_canais_pkey PRIMARY KEY (id),
	CONSTRAINT metricas_diarias_empresa_campanha_data_key UNIQUE (empresa_id, campanha_id, data)
);
CREATE INDEX idx_metricas_cliques ON public.metricas_diarias USING btree (cliques);
CREATE INDEX idx_metricas_data_campanha ON public.metricas_diarias USING btree (data, campanha_id);
CREATE INDEX idx_metricas_impressoes ON public.metricas_diarias USING btree (impressoes);


-- public.metricas_diarias foreign keys

ALTER TABLE public.metricas_diarias ADD CONSTRAINT custos_canais_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;
ALTER TABLE public.metricas_diarias ADD CONSTRAINT metricas_diarias_campanha_id_fkey FOREIGN KEY (campanha_id) REFERENCES public.campanhas(id) ON DELETE CASCADE;