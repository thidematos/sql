-- public.atividades definition

-- Drop table

-- DROP TABLE public.atividades;

CREATE TABLE public.atividades (
	id uuid DEFAULT gen_random_uuid() NULL,
	vendedor_external_id varchar NULL,
	external_id varchar NULL,
	titulo varchar NULL,
	oportunidade_external_id varchar NULL,
	data_atividade timestamptz NULL,
	done_date timestamptz NULL,
	external_created_at timestamptz NULL,
	tipo varchar NULL,
	concluida bool NULL,
	organizacao_external_id varchar NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at varchar DEFAULT now() NULL,
	canal_id uuid NULL,
	contato_external_id varchar NULL,
	CONSTRAINT atividades_external_id_unique UNIQUE (external_id)
);