WITH venue_stats AS (
    SELECT
        v.venue_id,
        v.training_venue,
        v.county_pull AS county,
        v.ward,
        COUNT(a.youth_id) AS total_attendances,
        SUM(CASE WHEN a.attended = 1 THEN 1 ELSE 0 END) AS total_present,
        ROUND((SUM(CASE WHEN a.attended = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(a.youth_id), 2) AS venue_attendance_rate
    FROM {{ ref('stg_attendance') }} a
    JOIN {{ ref('stg_youth') }} y ON a.youth_id = y.youth_id
    JOIN {{ ref('stg_venues') }} v ON y.venue_id = v.venue_id
    GROUP BY v.venue_id, v.training_venue, v.county_pull, v.ward
)

SELECT * FROM venue_stats;