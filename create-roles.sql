DO $$
    DECLARE
        r TEXT;
    BEGIN
        FOR r IN SELECT unnest(ARRAY['zbx_monitor','indicadores', 'pooler']) LOOP
                IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = r) THEN
                    EXECUTE format('CREATE ROLE %I NOLOGIN', r);
                END IF;
            END LOOP;
    END
$$;
