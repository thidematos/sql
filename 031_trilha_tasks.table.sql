-- public.trilha_tasks definition

-- Drop table

-- DROP TABLE public.trilha_tasks;

CREATE TABLE public.trilha_tasks (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	trilha_id uuid NOT NULL,
	nome varchar(255) NOT NULL,
	descricao text NULL,
	status varchar(30) DEFAULT 'to_be_completed'::character varying NOT NULL,
	start_date date NULL,
	due_date date NULL,
	days_to_complete int4 NULL,
	guidance text NULL,
	last_updated timestamptz DEFAULT now() NOT NULL,
	order_index int4 DEFAULT 0 NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	updated_at timestamptz DEFAULT now() NOT NULL,
	CONSTRAINT trilha_tasks_days_check CHECK (((days_to_complete IS NULL) OR (days_to_complete >= 0))),
	CONSTRAINT trilha_tasks_pkey PRIMARY KEY (id),
	CONSTRAINT trilha_tasks_status_check CHECK (((status)::text = ANY (ARRAY[('locked'::character varying)::text, ('to_be_completed'::character varying)::text, ('in_progress'::character varying)::text, ('pending_approval'::character varying)::text, ('needs_revision'::character varying)::text, ('approved'::character varying)::text, ('completed'::character varying)::text])))
);
CREATE INDEX idx_trilha_tasks_trilha_id_order ON public.trilha_tasks USING btree (trilha_id, order_index);


-- public.trilha_tasks foreign keys

ALTER TABLE public.trilha_tasks ADD CONSTRAINT trilha_tasks_trilha_id_fkey FOREIGN KEY (trilha_id) REFERENCES public.trilhas(id) ON DELETE CASCADE;