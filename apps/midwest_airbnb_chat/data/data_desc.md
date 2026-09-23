# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com), July 2026 snapshots for Chicago (2026-07-20), Columbus (2026-07-23), and the Twin Cities (2026-07-21)
**Course:** ISA 401, Miami University

> One row is one Airbnb listing. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which of the three metro areas the listing is in: `Chicago`, `Columbus`, or `Twin Cities`. Never empty. |
| `snapshot_date` | text | Date this listing was scraped by Inside Airbnb, in `YYYY-MM-DD` format. Differs by city. |
| `id` | text | Primary key. Airbnb's internal listing ID; unique across the table. |
| `name` | text | Listing title as it appeared on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). |
| `host_id` | text | Airbnb's internal ID for the host. Multiple listings can share a `host_id`. |
| `host_name` | text | Host's first name (or names, for co-hosts) as displayed on the listing. |
| `host_since` | text | Date the host joined Airbnb, in `YYYY-MM-DD` format. `NULL` for many rows. |
| `host_is_superhost` | text | `"t"` if the host is a superhost, `"f"` otherwise. Some rows are `NULL`. |
| `neighbourhood` | text | Neighbourhood name within the city (for example "Lincoln Park"). |
| `latitude` | double | Listing's latitude, in decimal degrees. |
| `longitude` | double | Listing's longitude, in decimal degrees. |
| `property_type` | text | Specific property description (for example "Entire rental unit", "Private room in condo"). |
| `room_type` | text | High-level category: `Entire home/apt`, `Private room`, `Shared room`, or `Hotel room`. |
| `accommodates` | integer | Maximum number of guests the listing can host. |
| `bedrooms` | double | Number of bedrooms. `NULL` for some listings (e.g. studios not always specified). |
| `beds` | double | Number of beds. |
| `bathrooms_text` | text | Bathroom count and type as a free-text string (for example "1.5 baths", "1 shared bath"). |
| `price` | double | Price per night, in US dollars. |
| `minimum_nights` | integer | Minimum number of nights required for a booking. |
| `availability_365` | integer | Number of days in the next 365 the listing is available to book. |
| `number_of_reviews` | integer | Total number of reviews the listing has received, all time. |
| `number_of_reviews_ltm` | integer | Number of reviews received in the last twelve months. |
| `first_review` | text | Date of the listing's earliest review, in `YYYY-MM-DD` format. `NULL` if no reviews. |
| `last_review` | text | Date of the listing's most recent review, in `YYYY-MM-DD` format. `NULL` if no reviews. |
| `review_scores_rating` | double | Overall guest rating, on a 0–5 scale. `NULL` if no reviews. |
| `reviews_per_month` | double | Average number of reviews per month since the listing's first review. |
| `instant_bookable` | text | `"t"` if guests can book without host approval, `"f"` otherwise. `NULL` for many rows. |
| `estimated_revenue_l365d` | double | Inside Airbnb's estimated revenue for the listing over the last 365 days, in US dollars. |
| `amenities_count` | integer | Number of amenities listed for the property (e.g. WiFi, kitchen, parking). |
