use [Dating]
------1
Select age as 'Min age'
from users
where age = (Select MIN(age)from users)
-----
Select age as 'Max age'
from users
where age = (Select MAX(age)from users)
-----
Select rost as 'Rost Min'
from users
where rost = (Select MIN(rost)from users)
-----
Select rost as 'Rost Max'
from users
where rost = (Select MAX(rost)from users)
-----
Select sex as 'Pol'
from users
-----
select nick as 'Nik'
from users


------2
SELECT * FROM users
WHERE my_build = 2 AND eyes_color = 4 AND hair_color = 1 AND sex = 2
UNION ALL
SELECT * FROM users
WHERE my_build = 4 AND eyes_color = 2 AND hair_color = 4 AND sex = 1;

------4
SELECT us.user_id as 'ID', us.nick as 'Nik person', COUNT(gs.id_to) as 'Count'
FROM users us
JOIN gift_service gs ON us.user_id = gs.id_to
WHERE us.id_zodiak = 12
GROUP BY us.user_id, us.nick;

------3
SELECT *
FROM users
JOIN users_interes us ON users.user_id = us.user_id
JOIN interes inter ON inter.id = us.interes_id
JOIN users_moles usm ON users.user_id = usm.user_id
JOIN moles m ON m.id = usm.moles_id
WHERE id_framework = 1 AND inter.id = 23 AND m.id = 1

------5
SELECT us.id, us.nick, r.name as status, us.like_kitchen
FROM users us
JOIN richness r ON us.my_rich = r.id
JOIN (
    SELECT user_id, COUNT(languages_id) as lang_count
    FROM users_languages
    GROUP BY user_id
    HAVING COUNT(languages_id) > 5
) ul ON us.user_id = ul.user_id
WHERE us.like_kitchen = 2;
