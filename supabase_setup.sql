-- Carlitos Strong V3 cloud storage (run in Supabase SQL Editor as project owner).
-- Each authenticated account can access ONLY its own workout records.
-- The GitHub-hosted app uses the PUBLIC publishable/anon key; never a service_role key.

create table if not exists public.carlitos_records (
  user_id uuid not null references auth.users(id) on delete cascade,
  record_id text not null,
  payload jsonb not null,
  updated_at timestamptz not null default now(),
  constraint carlitos_records_pk primary key (user_id, record_id),
  constraint carlitos_record_id_length check (char_length(record_id) between 1 and 160)
);

alter table public.carlitos_records enable row level security;
revoke all on public.carlitos_records from anon;
grant select, insert, update, delete on public.carlitos_records to authenticated;

drop policy if exists "Carlitos user selects own rows" on public.carlitos_records;
create policy "Carlitos user selects own rows" on public.carlitos_records
  for select to authenticated using ((select auth.uid()) = user_id);

drop policy if exists "Carlitos user inserts own rows" on public.carlitos_records;
create policy "Carlitos user inserts own rows" on public.carlitos_records
  for insert to authenticated with check ((select auth.uid()) = user_id);

drop policy if exists "Carlitos user updates own rows" on public.carlitos_records;
create policy "Carlitos user updates own rows" on public.carlitos_records
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "Carlitos user deletes own rows" on public.carlitos_records;
create policy "Carlitos user deletes own rows" on public.carlitos_records
  for delete to authenticated using ((select auth.uid()) = user_id);

-- Optional, inspect security in Supabase Table Editor -> carlitos_records -> RLS policies.
