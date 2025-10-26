-- public.integration_sync definition

-- Drop table

-- DROP TABLE public.integration_sync;

CREATE TABLE public.integration_sync (
	id uuid DEFAULT gen_random_uuid() NULL,
	last_full_sync_at timestamptz NULL,
	last_delta_sync_at timestamptz NULL,
	canal_id uuid NULL,
	empresa_id uuid NULL
);