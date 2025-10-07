-- public.leads definition

-- Drop table

-- DROP TABLE public.leads;

CREATE TABLE public.leads (
	id uuid DEFAULT gen_random_uuid() NULL,
	rd_id varchar NULL,
	nome varchar NULL,
	title varchar NULL,
	organization_rd_id varchar NULL,
	created_at date DEFAULT now() NULL,
	updated_at date DEFAULT now() NULL,
	created_at_rd varchar NULL,
	oportunidades jsonb NULL
);