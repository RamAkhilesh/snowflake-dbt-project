{{
  config(
    materialized = 'incremental',
    unique_key = 'BOOKING_ID'
    )
}}

select
    booking_id,
    listing_id,
    booking_date,
    {{ multiply('nights_booked', 'booking_amount', 2) }} + service_fee + cleaning_fee as total_amount,
    booking_status,
    created_at
from {{ ref('bronze_bookings') }}