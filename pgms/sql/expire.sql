-- set prem_packages_history.expire_date for the users expire2, expire15, expire30 and expired.
-- 7/3/7: added expire3years
-- 12/19/07: added update to last_purchase_date
update users set last_purchase_date= now() where username in  ('expire2','expire15','expire30','expired');

update prem_packages_history set expire_date = date_add(date(now()), interval 14 day) where customer_id = (select userid from users where username='expire15');
update prem_packages_history set expire_date = date_add(date(now()), interval 1 day) where customer_id = (select userid from users where username='expire2');
update prem_packages_history set expire_date = date_add(date(now()), interval 29 day) where customer_id = (select userid from users where username='expire30');
update prem_packages_history set expire_date = date_sub(date(now()), interval 55 day) where customer_id=(select userid from users where username='expired');
update prem_packages_history set expire_date = date_add(date(now()), interval 3 year) where customer_id = (select userid from users where username='expire3years');

select username, expire_date, userid, to_days(expire_date) - to_days(date(now())) as d  from users, prem_packages_history where userid=customer_id and username like 'expire%';