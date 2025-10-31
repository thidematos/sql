-- public.custom_fields definition

-- Drop table

-- DROP TABLE public.custom_fields;

CREATE TABLE public.custom_fields (
	id uuid DEFAULT gen_random_uuid() NULL,
	external_id varchar NULL,
	"for" varchar NULL,
	field varchar NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL
);