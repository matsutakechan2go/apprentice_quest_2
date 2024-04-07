-- エピソード視聴数トップ3のエピソードタイトルと視聴数を取得
SELECT e.title AS episode_title, SUM(v.view_count) AS total_views
FROM episodes e
JOIN viewers v ON e.id = v.content_id
WHERE v.content_type = 'episode'
GROUP BY e.id
ORDER BY total_views DESC
LIMIT 3;


-- エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数の取得
SELECT
    p.title AS program_title,
    s.season_number,
    e.episode_number,
    e.title AS episode_title,
    SUM(v.view_count) AS total_views
FROM episodes e
INNER JOIN seasons s ON e.season_id = s.id
INNER JOIN programs p ON s.program_id = p.id
INNER JOIN viewers v ON e.id = v.content_id AND v.content_type = 'episode'
GROUP BY e.id, p.title, s.season_number, e.episode_number, e.title
ORDER BY total_views DESC
LIMIT 3;

-- 本日放送される全ての番組の情報を取得
SELECT
    ch.name AS channel_name,
    e.broadcast_start_time,
    e.broadcast_end_time,
    s.season_number,
    e.episode_number,
    e.title AS episode_title,
    e.detail AS episode_detail
FROM episodes e
INNER JOIN seasons s ON e.season_id = s.id
INNER JOIN programs p ON s.program_id = p.id
INNER JOIN channels ch ON p.channel_id = ch.id
WHERE DATE(e.broadcast_start_time) = CURDATE()
ORDER BY e.broadcast_start_time;

-- ドラマのチャンネルの番組表（一週間分）
SELECT
    ch.name AS channel_name,
    e.broadcast_start_time,
    e.broadcast_end_time,
    s.season_number,
    e.episode_number,
    e.title AS episode_title,
    e.detail AS episode_detail
FROM episodes e
INNER JOIN seasons s ON e.season_id = s.id
INNER JOIN programs p ON s.program_id = p.id
INNER JOIN channels ch ON p.channel_id = ch.id
WHERE ch.name = 'ドラマチャンネル'
AND DATE(e.broadcast_start_time) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY e.broadcast_start_time;
