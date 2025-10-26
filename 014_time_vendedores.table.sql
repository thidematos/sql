-- public.time_vendedores definition

-- Drop table

-- DROP TABLE public.time_vendedores;

CREATE TABLE public.time_vendedores (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	time_id uuid NOT NULL,
	vendedor_id uuid NOT NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	canal_id uuid NULL,
	CONSTRAINT time_vendedores_pkey PRIMARY KEY (id),
	CONSTRAINT time_vendedores_time_id_vendedor_id_key UNIQUE (time_id, vendedor_id)
);


-- public.time_vendedores foreign keys

ALTER TABLE public.time_vendedores ADD CONSTRAINT time_vendedores_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.times(id);
ALTER TABLE public.time_vendedores ADD CONSTRAINT time_vendedores_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id);