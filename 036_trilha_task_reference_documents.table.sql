-- public.trilha_task_reference_documents definition

-- Drop table

-- DROP TABLE public.trilha_task_reference_documents;

CREATE TABLE public.trilha_task_reference_documents (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	task_id uuid NOT NULL,
	"label" text NOT NULL,
	url text NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_task_reference_documents_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_trilha_task_reference_documents_task ON public.trilha_task_reference_documents USING btree (task_id);


-- public.trilha_task_reference_documents foreign keys

ALTER TABLE public.trilha_task_reference_documents ADD CONSTRAINT trilha_task_reference_documents_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.trilha_tasks(id) ON DELETE CASCADE;