-- set mpa_club_memberships.expire_date for the users expire2, expire15, expire30 and expired.
-- 7/3/7: added expire3years
-- 12/19/07: added update to last_purchase_date
-- 7/18/08: updated to use the mpa_club_memberships table.

update users set last_purchase_date= now() where username in  ('expire2','expire15','expire30','expired');

update mpa_club_memberships set expire_date = date_add(date(now()), interval 14 day) where mpa_userid = (select userid from users where username='expire15');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 1 day)  where mpa_userid = (select userid from users where username='expire2');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 29 day) where mpa_userid = (select userid from users where username='expire30');
update mpa_club_memberships set expire_date = date_sub(date(now()), interval 55 day) where mpa_userid = (select userid from users where username='expired');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 3 year) where mpa_userid = (select userid from users where username='expire3years');

select username, expire_date, userid, to_days(expire_date) - to_days(date(now())) as d  from users, mpa_club_memberships where userid=mpa_userid and username like 'expire%';