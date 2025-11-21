-- public.trilha_task_assignees definition

-- Drop table

-- DROP TABLE public.trilha_task_assignees;

CREATE TABLE public.trilha_task_assignees (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	task_id uuid NOT NULL,
	usuario_id uuid NULL,
	nome varchar(255) NULL,
	email varchar(255) NULL,
	avatar_url text NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_task_assignees_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_trilha_task_assignees_task ON public.trilha_task_assignees USING btree (task_id);
CREATE UNIQUE INDEX idx_trilha_task_assignees_unique_user ON public.trilha_task_assignees USING btree (task_id, usuario_id) WHERE (usuario_id IS NOT NULL);


-- public.trilha_task_assignees foreign keys

ALTER TABLE public.trilha_task_assignees ADD CONSTRAINT trilha_task_assignees_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE SET NULL;