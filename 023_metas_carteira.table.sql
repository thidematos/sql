-- public.metas_carteira definition

-- Drop table

-- DROP TABLE public.metas_carteira;

CREATE TABLE public.metas_carteira (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	cliente_external_id varchar(255) NOT NULL,
	categoria varchar(255) NOT NULL,
	is_organizacao bool DEFAULT false NULL,
	potencial_anual numeric(15, 2) NOT NULL,
	meta_vendas_anual numeric(15, 2) NOT NULL,
	recorrencia_dias int4 NOT NULL,
	mes_ref int4 NOT NULL,
	meta_jan numeric(15, 2) DEFAULT 0.00 NULL,
	meta_fev numeric(15, 2) DEFAULT 0.00 NULL,
	meta_mar numeric(15, 2) DEFAULT 0.00 NULL,
	meta_abr numeric(15, 2) DEFAULT 0.00 NULL,
	meta_mai numeric(15, 2) DEFAULT 0.00 NULL,
	meta_jun numeric(15, 2) DEFAULT 0.00 NULL,
	meta_jul numeric(15, 2) DEFAULT 0.00 NULL,
	meta_ago numeric(15, 2) DEFAULT 0.00 NULL,
	meta_set numeric(15, 2) DEFAULT 0.00 NULL,
	meta_out numeric(15, 2) DEFAULT 0.00 NULL,
	meta_nov numeric(15, 2) DEFAULT 0.00 NULL,
	meta_dez numeric(15, 2) DEFAULT 0.00 NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	ano int4 NULL,
	CONSTRAINT metas_carteira_cliente_external_id_categoria_key UNIQUE (cliente_external_id, categoria),
	CONSTRAINT metas_carteira_pkey PRIMARY KEY (id)
);