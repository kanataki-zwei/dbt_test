WITH attendance AS (
    SELECT
        youth_id,
        session,
        attended
    FROM {{ source('educate', 'Attendance') }} 

SELECT * FROM attendance;
