-- Add Agendor external IDs to core tables

-- Vendedores: add agendor_id (nullable) with unique constraint
ALTER TABLE public.vendedores ADD COLUMN IF NOT EXISTS agendor_id varchar(255);
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'vendedores_agendor_id_key'
  ) THEN
    ALTER TABLE public.vendedores ADD CONSTRAINT vendedores_agendor_id_key UNIQUE (agendor_id);
  END IF;
END $$;

-- Oportunidades: add agendor_id (nullable) with unique constraint
ALTER TABLE public.oportunidades ADD COLUMN IF NOT EXISTS agendor_id varchar(255);
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'oportunidades_agendor_id_key'
  ) THEN
    ALTER TABLE public.oportunidades ADD CONSTRAINT oportunidades_agendor_id_key UNIQUE (agendor_id);
  END IF;
END $$;

-- Atividades: add agendor_id (nullable) with unique constraint
ALTER TABLE public.atividades ADD COLUMN IF NOT EXISTS agendor_id varchar(255);
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'atividades_agendor_id_key'
  ) THEN
    ALTER TABLE public.atividades ADD CONSTRAINT atividades_agendor_id_key UNIQUE (agendor_id);
  END IF;
END $$;