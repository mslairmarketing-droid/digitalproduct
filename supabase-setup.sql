-- Supabase > SQL Editor এ পেস্ট করে Run করুন (আগে পুরনো orders টেবিল বানিয়ে থাকলে আগে: drop table orders;)
create table orders (
  id bigint generated always as identity primary key,
  created_at timestamptz default now(),
  name text, email text, bkash_last4 text, sub_email text,
  package text, amount int, status text default 'pending'
);
alter table orders enable row level security;
create policy "public insert" on orders for insert to anon with check (true);
create policy "admin all" on orders for all to authenticated using (true) with check (true);
