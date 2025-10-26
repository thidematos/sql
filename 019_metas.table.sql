-- public.metas definition

-- Drop table

-- DROP TABLE public.metas;

CREATE TABLE public.metas (
	time_id uuid NULL,
	vendedor_id uuid NULL,
	indicador varchar(10) NOT NULL,
	tipo_venda varchar(10) NULL,
	valor numeric NOT NULL,
	ano int4 NOT NULL,
	mes int4 NOT NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	id uuid DEFAULT gen_random_uuid() NULL,
	funil_id uuid NULL
);
CREATE UNIQUE INDEX metas_unique_no_funil ON public.metas USING btree (vendedor_id, indicador, tipo_venda, ano, mes) WHERE (funil_id IS NULL);
CREATE UNIQUE INDEX metas_unique_with_funil ON public.metas USING btree (vendedor_id, indicador, tipo_venda, ano, mes, funil_id) WHERE (funil_id IS NOT NULL);