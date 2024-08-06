CREATE DATABASE ODIPlayerStatsIndia

USE ODIPlayerStatsIndia;

-- 1. Total Number of Players:
SELECT COUNT(DISTINCT Player_Name) AS Total_Players 
FROM listodplayersindia;

-- 2. Total Matches Played:
SELECT SUM(Matches_Played) AS Total_Matches 
FROM listodplayersindia;

-- 3. Total Runs Scored:
SELECT SUM(Runs) AS Total_Runs 
FROM listodplayersindia;

-- 4. Total Wickets Taken:
SELECT SUM(Wickets) AS Total_Wickets 
FROM listodplayersindia;

-- 5. Player with Highest Runs:
SELECT Player_Name, Runs 
FROM listodplayersindia
ORDER BY Runs DESC LIMIT 1;

-- 6. Player with Most Wickets:
SELECT Player_Name, Wickets 
FROM listodplayersindia
ORDER BY Wickets DESC LIMIT 1;

-- 7. Player with Highest Highest Score:
SELECT Player_Name, Highest_Score 
FROM listodplayersindia
ORDER BY Highest_Score DESC LIMIT 1;

-- 8. Player with Most Matches:
SELECT Player_Name, Matches_Played 
FROM listodplayersindia 
ORDER BY Matches_Played DESC LIMIT 1;

-- 9. Average Runs per Player:
SELECT AVG(Runs) AS Avg_Runs 
FROM listodplayersindia;

-- 10. Average Wickets per Player:
SELECT AVG(Wickets) AS Avg_Wickets 
FROM listodplayersindia;

-- 11. Average Highest Score per Player:
SELECT AVG(Highest_Score) AS Avg_Highest_Score 
FROM listodplayersindia;

-- 12. Players with No Runs Recorded:
SELECT Player_Name 
FROM listodplayersindia
WHERE Runs = 0;

-- 13. Players with Highest Runs and Wickets:
SELECT Player_Name, Runs, Wickets 
FROM listodplayersindia 
ORDER BY Runs DESC, Wickets DESC LIMIT 10;

-- 14. Average Runs and Wickets by Matches Played:
SELECT AVG(Runs) AS Avg_Runs, AVG(Wickets) AS Avg_Wickets 
FROM listodplayersindia 
WHERE Matches_Played BETWEEN 50 AND 100;

-- 15. Top Performers by Career Length:
SELECT Player_Name, MAX(Last_Match) - MIN(First_Match) AS Career_Length 
FROM listodplayersindia
GROUP BY Player_Name 
ORDER BY Career_Length DESC LIMIT 10;

-- 16. Players with Highest Score and Runs:
SELECT Player_Name, Highest_Score, Runs 
FROM listodplayersindia 
ORDER BY Highest_Score DESC, Runs DESC LIMIT 10;

-- 17. Players with Most Matches in the Last 5 Years:
SELECT Player_Name, SUM(Matches_Played) AS Total_Matches_Last_5_Years 
FROM listodplayersindia
WHERE Last_Match >= '2019-01-01' 
GROUP BY Player_Name 
ORDER BY Total_Matches_Last_5_Years DESC LIMIT 10;

-- 18. Performance Comparison: Early Career vs. Late Career:
SELECT Player_Name, AVG(Runs) AS Avg_Early_Runs 
FROM listodplayersindia 
WHERE First_Match < '2015-01-01' 
GROUP BY Player_Name
UNION ALL
SELECT Player_Name, AVG(Runs) AS Avg_Late_Runs 
FROM listodplayersindia
WHERE First_Match >= '2015-01-01' 
GROUP BY Player_Name;

-- 19. Top 5 Players by Average Runs per Match:
SELECT Player_Name, (SUM(Runs) / SUM(Matches_Played)) AS Runs_Per_Match 
FROM listodplayersindia
GROUP BY Player_Name 
ORDER BY Runs_Per_Match DESC LIMIT 5;

-- 20. Top 5 Players by Wickets per Balls Bowled:
SELECT Player_Name, (SUM(Wickets) / SUM(Balls_Bowled)) AS Wickets_Per_Ball 
FROM listodplayersindia
GROUP BY Player_Name 
ORDER BY Wickets_Per_Ball DESC LIMIT 5;

-- 21. Players with Most Improvement in Runs Over Time:
SELECT Player_Name, 
       AVG(CASE WHEN First_Match < '2015-01-01' THEN Runs ELSE NULL END) AS Avg_Early_Runs,
       AVG(CASE WHEN First_Match >= '2015-01-01' THEN Runs ELSE NULL END) AS Avg_Late_Runs
FROM listodplayersindia
GROUP BY Player_Name
ORDER BY (Avg_Late_Runs - Avg_Early_Runs) DESC;

-- 22. Players with No Balls Bowled vs. Runs Scored:
SELECT Player_Name, Runs 
FROM listodplayersindia
WHERE Balls_Bowled = 0 
ORDER BY Runs DESC;

-- 23. Top 10 Players by Average Highest Score per Match:
SELECT Player_Name, (AVG(Highest_Score) / AVG(Matches_Played)) AS Avg_Highest_Score_Per_Match 
FROM listodplayersindia 
GROUP BY Player_Name 
ORDER BY Avg_Highest_Score_Per_Match DESC LIMIT 10;
 
-- 24. Impact of Number of Not Outs on Runs:
SELECT AVG(Runs) AS Avg_Runs, AVG(NotOuts) AS Avg_NotOuts 
FROM listodplayersindia 
GROUP BY Player_Name 
ORDER BY Avg_Runs DESC;

-- 25. Change in Runs Over Time Based on Career Length:
SELECT Player_Name, 
       MAX(Last_Match) - MIN(First_Match) AS Career_Length, 
       AVG(Runs) AS Avg_Runs
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY Career_Length DESC, Avg_Runs DESC;

-- 26. Top 10 Players by Improvement in Wickets per Balls Bowled:
SELECT Player_Name, 
       (SUM(Wickets) / SUM(Balls_Bowled)) AS Wickets_Per_Ball,
       LAG((SUM(Wickets) / SUM(Balls_Bowled)), 1) OVER (ORDER BY MAX(Last_Match)) AS Previous_Wickets_Per_Ball
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY (Wickets_Per_Ball - Previous_Wickets_Per_Ball) DESC LIMIT 10;

-- 27. Efficiency Analysis: Runs per Match vs. Balls Bowled per Wicket:
SELECT Player_Name, 
       (SUM(Runs) / SUM(Matches_Played)) AS Runs_Per_Match,
       (SUM(Balls_Bowled) / NULLIF(SUM(Wickets), 0)) AS Balls_Per_Wicket
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY Runs_Per_Match DESC, Balls_Per_Wicket ASC;

-- 28. Top 5 Players by Consistency in Runs Scored:
SELECT Player_Name, 
       STDDEV(Runs) AS Runs_Consistency
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY Runs_Consistency ASC
LIMIT 5;

-- 29. Performance Metrics Comparison: Top Batsmen vs. Top Bowlers:
SELECT 
    (SELECT Player_Name FROM listodplayersindia ORDER BY Runs DESC LIMIT 1) AS Top_Batsman,
    (SELECT Player_Name FROM listodplayersindia ORDER BY Wickets DESC LIMIT 1) AS Top_Bowler;

-- 30. Impact of Number of Matches on Player Performance:
SELECT 
    Player_Name,
    (SUM(Runs) / SUM(Matches_Played)) AS Runs_Per_Match,
    (SUM(Wickets) / SUM(Matches_Played)) AS Wickets_Per_Match
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY SUM(Matches_Played) DESC;

-- 31. Comparison of Average Highest Score Before and After a Certain Date:
SELECT 
    AVG(CASE WHEN First_Match < '2015-01-01' THEN Highest_Score ELSE NULL END) AS Avg_Highest_Score_Before,
    AVG(CASE WHEN First_Match >= '2015-01-01' THEN Highest_Score ELSE NULL END) AS Avg_Highest_Score_After
FROM listodplayersindia;

-- 32. Top 5 Players with Most Significant Increase in Highest Score Over Time:
SELECT Player_Name,
       MAX(Highest_Score) - MIN(Highest_Score) AS Highest_Score_Increase
FROM listodplayersindia 
GROUP BY Player_Name
ORDER BY Highest_Score_Increase DESC LIMIT 5;
