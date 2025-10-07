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
	empresa_id uuid NULL,
	id uuid DEFAULT gen_random_uuid() NULL,
	funil_id uuid NULL
);

-- Unique indexes to support upsert per tenant and optional funnel
-- 1) Rows WITH funnel_id
CREATE UNIQUE INDEX IF NOT EXISTS metas_unique_with_funnel
ON public.metas (empresa_id, vendedor_id, indicador, tipo_venda, ano, mes, funil_id);

-- 2) Rows WITHOUT funnel_id (funil_id IS NULL)
CREATE UNIQUE INDEX IF NOT EXISTS metas_unique_without_funnel
ON public.metas (empresa_id, vendedor_id, indicador, tipo_venda, ano, mes)
WHERE funil_id IS NULL;

-- Table Triggers

create trigger metas_set_updated_at before
update
    on
    public.metas for each row execute function update_metas_updated_at();
