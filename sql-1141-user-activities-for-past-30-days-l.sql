# Approach 1- self
select activity_date as day, count(distinct user_id) as active_users from Activity
where activity_date between '2019-07-27' - interval 29 day and '2019-07-27'
group by activity_date

# Approach 2- leetcode discuss
select activity_date as day, count(distinct user_id) as active_users from Activity
where datediff('2019-07-27', activity_date) < 30
group by activity_date

