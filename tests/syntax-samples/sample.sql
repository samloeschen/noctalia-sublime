WITH active_palettes AS (
    SELECT p.id, p.name, COUNT(c.id) AS color_count
    FROM palettes AS p
    LEFT JOIN colors AS c ON c.palette_id = p.id
    WHERE p.enabled = TRUE
    GROUP BY p.id, p.name
)
SELECT name, color_count
FROM active_palettes
ORDER BY color_count DESC;
