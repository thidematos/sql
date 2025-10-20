-- public.organizacoes definition

-- Drop table

-- DROP TABLE public.organizacoes;

CREATE TABLE public.organizacoes (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	external_id varchar NOT NULL,
	nome varchar NULL,
	won_count int4 NULL,
	lost_count int4 NULL,
	opened_count int4 NULL,
	paused_count int4 NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	segments jsonb NULL,
	potencial_anual float4 NULL,
	external_created_at timestamptz NULL,
	recorrencia int4 NULL,
	vendedor_responsavel_external_id varchar NULL,
	categoria varchar NULL,
	CONSTRAINT organizacoes_external_id_key UNIQUE (external_id),
	CONSTRAINT organizacoes_pkey PRIMARY KEY (id)
);