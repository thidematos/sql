-- public.trilha_task_dependencies definition

-- Drop table

-- DROP TABLE public.trilha_task_dependencies;

CREATE TABLE public.trilha_task_dependencies (
	task_id uuid NOT NULL,
	depends_on_task_id uuid NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_task_dependencies_check CHECK ((task_id <> depends_on_task_id)),
	CONSTRAINT trilha_task_dependencies_pkey PRIMARY KEY (task_id, depends_on_task_id)
);


-- public.trilha_task_dependencies foreign keys

ALTER TABLE public.trilha_task_dependencies ADD CONSTRAINT trilha_task_dependencies_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.trilha_tasks(id) ON DELETE CASCADE;