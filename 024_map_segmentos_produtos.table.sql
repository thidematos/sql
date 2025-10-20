-- public.map_segmentos_produtos definition

-- Drop table

-- DROP TABLE public.map_segmentos_produtos;

CREATE TABLE public.map_segmentos_produtos (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	segmento_id varchar NOT NULL,
	nome_segmento varchar NOT NULL,
	nome_categoria varchar NOT NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	CONSTRAINT map_segmentos_produtos_pkey PRIMARY KEY (id),
	CONSTRAINT map_segmentos_produtos_segmento_id_nome_segmento_key UNIQUE (segmento_id, nome_segmento)
);