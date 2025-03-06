WITH venues AS (
    SELECT
        venue_id,
        county_pull AS county,
        ward,
        training_venue
    FROM {{ source('educate', 'Venues') }}
)

SELECT * FROM venues;
