# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- When the user asks about a city, match `city` exactly against one of the three values: `Chicago`, `Columbus`, or `Twin Cities` (case-sensitive, no partial matches).
- When the user asks whether a host is a "superhost," filter `host_is_superhost = 't'` (not `TRUE` or `1`) since the column stores `"t"`/`"f"` as text, not a boolean.
- When the user asks about price without specifying, assume they mean `price` per night in US dollars, and treat listings with `NULL` bedrooms or bathrooms as still valid (don't filter them out unless the question specifically asks about bedroom/bathroom count).
