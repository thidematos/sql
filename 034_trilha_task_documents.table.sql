-- public.trilha_task_documents definition

-- Drop table

-- DROP TABLE public.trilha_task_documents;

CREATE TABLE public.trilha_task_documents (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	task_id uuid NOT NULL,
	usuario_id uuid NULL,
	nome varchar(255) NOT NULL,
	url text NULL,
	status varchar(20) DEFAULT 'pending'::character varying NOT NULL,
	rejection_reason text NULL,
	metadata jsonb NULL,
	uploaded_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_task_documents_pkey PRIMARY KEY (id),
	CONSTRAINT trilha_task_documents_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('approved'::character varying)::text, ('rejected'::character varying)::text])))
);
CREATE INDEX idx_trilha_task_documents_task ON public.trilha_task_documents USING btree (task_id);


-- public.trilha_task_documents foreign keys

ALTER TABLE public.trilha_task_documents ADD CONSTRAINT trilha_task_documents_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE SET NULL;