WITH attendance_summary AS (
    SELECT
        a.youth_id,
        COUNT(*) AS total_sessions,
        SUM(CASE WHEN a.attended = 1 THEN 1 ELSE 0 END) AS sessions_attended,
        ROUND((SUM(CASE WHEN a.attended = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attendance_rate,
        CASE
            WHEN (SUM(CASE WHEN a.attended = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) < 50 THEN 'High Dropout Risk'
            ELSE 'Active'
        END AS dropout_status
    FROM {{ ref('stg_attendance') }} a
    GROUP BY a.youth_id
)

SELECT * FROM attendance_summary;
