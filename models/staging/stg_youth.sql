WITH youth AS (
    SELECT
        youth_id, 
        User Type, 
        youth_name_pull, 
        gender_pull, 
        uuid, 
        youth_phone_pull, 
        Mpesa Name, 
        'Mpesa No', 
        training_schedule, 
        venue_id
    FROM {{ source('educate', 'Youth') }}
)

SELECT * FROM youth;
