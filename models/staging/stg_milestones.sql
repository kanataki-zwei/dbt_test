WITH milestones AS (
    SELECT
        youth_id, 
        milestone, 
        value
    FROM {{ source('educate', 'Milestones') }}
)

SELECT * FROM milestones;
