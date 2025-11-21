-- public.trilha_notifications definition

-- Drop table

-- DROP TABLE public.trilha_notifications;

CREATE TABLE public.trilha_notifications (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	empresa_id uuid NOT NULL,
	cluster_slug varchar(64) NULL,
	cluster_name varchar(255) NULL,
	task_ids _uuid NULL,
	requested_by_name varchar(255) NULL,
	requested_by_email varchar(255) NULL,
	message text NULL,
	status varchar(32) DEFAULT 'queued'::character varying NOT NULL,
	payload jsonb DEFAULT '{}'::jsonb NOT NULL,
	notified_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_notifications_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_trilha_notifications_cluster ON public.trilha_notifications USING btree (cluster_slug) WHERE (cluster_slug IS NOT NULL);
CREATE INDEX idx_trilha_notifications_empresa ON public.trilha_notifications USING btree (empresa_id, notified_at DESC);


-- public.trilha_notifications foreign keys

ALTER TABLE public.trilha_notifications ADD CONSTRAINT trilha_notifications_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;