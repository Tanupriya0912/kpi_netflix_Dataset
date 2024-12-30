/* global revenue growth rate */
SELECT 
    DATE_TRUNC('quarter', date) AS quarter,
    SUM(global_revenue) AS total_revenue,
    LAG(SUM(global_revenue)) OVER (ORDER BY DATE_TRUNC('quarter', date)) AS previous_revenue,
    ((SUM(global_revenue) - LAG(SUM(global_revenue)) OVER (ORDER BY DATE_TRUNC('quarter', date))) / LAG(SUM(global_revenue)) OVER (ORDER BY DATE_TRUNC('quarter', date))) * 100 AS growth_rate
FROM netflix_revenue
GROUP BY DATE_TRUNC('quarter', date)
ORDER BY quarter;

/*global revenue contribut6ion*/
SELECT 
    DATE_TRUNC('quarter', date) AS quarter,
    SUM(ucan_streaming_revenue) / SUM(global_revenue) * 100 AS ucan_share,
    SUM(emea_streaming_revenue) / SUM(global_revenue) * 100 AS emea_share,
    SUM(latm_streaming_revenue) / SUM(global_revenue) * 100 AS latm_share,
    SUM(apac_streaming_revenue) / SUM(global_revenue) * 100 AS apac_share
FROM netflix_revenue
GROUP BY DATE_TRUNC('quarter', date)
ORDER BY quarter;

/* average  revenue per user*/
SELECT 
    DATE_TRUNC('quarter', date) AS quarter,
    AVG(ucan_arpu) AS avg_ucan_arpu,
    AVG(emea_arpu) AS avg_emea_arpu,
    AVG(latm_arpu) AS avg_latm_arpu,
    AVG(apac_arpu) AS avg_apac_arpu
FROM netflix_revenue
GROUP BY DATE_TRUNC('quarter', date)
ORDER BY quarter;

/*membership growth by region */
SELECT 
    DATE_TRUNC('quarter', date) AS quarter,
    SUM(ucan_members) AS total_ucan_members,
    SUM(emea_members) AS total_emea_members,
    SUM(latm_members) AS total_latm_members,
    SUM(apac_members) AS total_apac_members
FROM netflix_revenue
GROUP BY DATE_TRUNC('quarter', date)
ORDER BY quarter;
