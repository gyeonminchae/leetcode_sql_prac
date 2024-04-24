# Write your MySQL query statement below
SELECT contest_id, IFNULL(ROUND(COUNT(distinct user_id) * 100 / (select count(user_id) from Users),2),0) as percentage  
FROM Register
GROUP BY contest_id
ORDER BY percentage desc, contest_id;