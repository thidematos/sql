-- public.contacts definition

-- Drop table

-- DROP TABLE public.contacts;

CREATE TABLE public.contacts (
	id uuid NULL,
	"name" varchar NULL,
	email varchar NULL,
	phone varchar NULL,
	website varchar NULL,
	"role" varchar NULL,
	segment varchar NULL,
	leads_volume varchar NULL,
	crm varchar NULL,
	tags varchar NULL,
	"source" varchar NULL,
	metadata jsonb NULL,
	created_at timestamptz NULL
);