-- public.vendedor_funis definition

-- Drop table

-- DROP TABLE public.vendedor_funis;

CREATE TABLE public.vendedor_funis (
	id uuid DEFAULT gen_random_uuid() NULL,
	vendedor_id uuid NULL,
	funil_id uuid NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	CONSTRAINT time_vendedor_funis_uniq UNIQUE (vendedor_id, funil_id)
);