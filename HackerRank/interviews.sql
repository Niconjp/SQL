/* https://www.hackerrank.com/challenges/interviews/problem */

SELECT Con.contest_id,Con.hacker_id,Con.name,SUM(SS.total_submissions),SUM(SS.total_accepted_submissions),sum(VS.total_views),sum(VS.total_unique_views)

FROM Contests Con

INNER JOIN Colleges Col
ON Col.contest_id = Con.contest_id

INNER JOIN Challenges Ch
ON Ch.college_id = Col.college_id

LEFT JOIN (SELECT SUM(total_views) AS total_views ,SUM(total_unique_views) AS total_unique_views,challenge_id
FROM View_Stats
GROUP BY Challenge_id) VS
ON VS.challenge_id = Ch.Challenge_id

LEFT JOIN (SELECT SUM(total_submissions) AS total_submissions,SUM(total_accepted_submissions) AS total_accepted_submissions,challenge_id
FROM Submission_Stats
GROUP BY Challenge_id
) SS
ON SS.challenge_id = Ch.challenge_id

GROUP BY Con.contest_id,Con.hacker_id,Con.name
HAVING  (SUM(total_submissions)+ 
        SUM(total_accepted_submissions)+
        SUM(total_views)+
        SUM(total_unique_views))!=0
ORDER BY Con.contest_id
