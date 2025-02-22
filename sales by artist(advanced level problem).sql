SELECT
    c.customer_id,
    c.first_name, 
    c.last_name, 
    ar.Name AS artist_name, 
    SUM(il.unit_price * il.quantity) AS total_sales
FROM invoice i 
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album a ON a.album_id = t.album_id
JOIN artist ar ON ar.artist_id = a.artist_id
GROUP BY 1,2,3,4
ORDER BY total_sales DESC;

