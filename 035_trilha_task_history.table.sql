-- public.trilha_task_history definition

-- Drop table

-- DROP TABLE public.trilha_task_history;

CREATE TABLE public.trilha_task_history (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	task_id uuid NOT NULL,
	"action" varchar(100) NOT NULL,
	details text NULL,
	performed_by_user_id uuid NULL,
	performed_by_name varchar(255) NULL,
	performed_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_task_history_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_trilha_task_history_task ON public.trilha_task_history USING btree (task_id);


-- public.trilha_task_history foreign keys

ALTER TABLE public.trilha_task_history ADD CONSTRAINT trilha_task_history_user_fkey FOREIGN KEY (performed_by_user_id) REFERENCES public.usuarios(id) ON DELETE SET NULL;