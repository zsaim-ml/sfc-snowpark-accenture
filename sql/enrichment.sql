USE ROLE SYSADMIN;
USE WAREHOUSE ANALYTICS_ESG_WH;

-- 1.- Getting Orders
SELECT TOP 100 * FROM DEMO.FRAUDDEMO.ORDERS;

-- 2.- Getting data from Marketplace
-- 2.1. Sample
SELECT TOP 100 * FROM IPINFO.PUBLIC.LOCATION;

-- 2.2 Joining the data
SELECT TOP 100 *
FROM ORDERS o
         INNER JOIN IPINFO.PUBLIC.LOCATION l
                    ON o.JOIN_KEY = l.JOIN_KEY
WHERE ((parse_ip("IP_ADDRESS", 'inet')['ipv4'] >= "START_IP_INT") AND
       (parse_ip("IP_ADDRESS", 'inet')['ipv4'] <= "END_IP_INT"));

-- 3.- Reducing complexity by creating a VIEW
CREATE OR REPLACE VIEW  DEMO.FRAUDDEMO.ORDERS_ENRICH_WITH_GEOCOORDINATES AS
SELECT *
FROM (SELECT *
      FROM ((SELECT "TRNX_ID"          AS "TRNX_ID",
                    "IP_ADDRESS"       AS "IP_ADDRESS",
                    "SHIPPING_ZIPCODE" AS "SHIPPING_ZIPCODE",
                    "IP_ORDER_LOC_LAT" AS "IP_ORDER_LOC_LAT",
                    "IP_ORDER_LOC_LNG" AS "IP_ORDER_LOC_LNG"
             FROM (SELECT *
                   FROM ((SELECT "TRNX_ID"          AS "TRNX_ID",
                                 "IP_ADDRESS"       AS "IP_ADDRESS",
                                 "SHIPPING_ZIPCODE" AS "SHIPPING_ZIPCODE"
                          FROM (SELECT "TRNX_ID", "IP_ADDRESS", "SHIPPING_ZIPCODE"
                                FROM (SELECT * FROM (orders)))) AS SNOWPARK_TEMP_TABLE_M2PDL3U3IG INNER JOIN (SELECT "TRNX_ID"          AS "TRNX_ID",
                                                                                                                     "IP_ADDRESS"       AS "IP_ADDRESS",
                                                                                                                     "IP_ORDER_LOC_LAT" AS "IP_ORDER_LOC_LAT",
                                                                                                                     "IP_ORDER_LOC_LNG" AS "IP_ORDER_LOC_LNG"
                                                                                                              FROM (SELECT "TRNX_ID",
                                                                                                                           "IP_ADDRESS",
                                                                                                                           "LAT" AS "IP_ORDER_LOC_LAT",
                                                                                                                           "LNG" AS "IP_ORDER_LOC_LNG"
                                                                                                                    FROM (SELECT *
                                                                                                                          FROM (SELECT *
                                                                                                                                FROM ((SELECT "ISFRAUD"           AS "ISFRAUD",
                                                                                                                                              "TRNX_ID"           AS "TRNX_ID",
                                                                                                                                              "IP_ADDRESS"        AS "IP_ADDRESS",
                                                                                                                                              "CITY"              AS "l_xg5e_CITY",
                                                                                                                                              "SHIPPING_ZIPCODE"  AS "SHIPPING_ZIPCODE",
                                                                                                                                              "SHIPPING_STATE"    AS "SHIPPING_STATE",
                                                                                                                                              "PAYMENT_NETWORK"   AS "PAYMENT_NETWORK",
                                                                                                                                              "PAYMENT_TYPE"      AS "PAYMENT_TYPE",
                                                                                                                                              "TOTAL_TRNX_AMOUNT" AS "TOTAL_TRNX_AMOUNT",
                                                                                                                                              "JOIN_KEY"          AS "l_xg5e_JOIN_KEY"
                                                                                                                                       FROM (SELECT * FROM (orders))) AS SNOWPARK_TEMP_TABLE_A9IP2DRF6F INNER JOIN (SELECT "START_IP_INT" AS "START_IP_INT",
                                                                                                                                                                                                                           "END_IP_INT"   AS "END_IP_INT",
                                                                                                                                                                                                                           "JOIN_KEY"     AS "r_04fd_JOIN_KEY",
                                                                                                                                                                                                                           "START_IP"     AS "START_IP",
                                                                                                                                                                                                                           "END_IP"       AS "END_IP",
                                                                                                                                                                                                                           "CITY"         AS "r_04fd_CITY",
                                                                                                                                                                                                                           "REGION"       AS "REGION",
                                                                                                                                                                                                                           "COUNTRY"      AS "COUNTRY",
                                                                                                                                                                                                                           "LAT"          AS "LAT",
                                                                                                                                                                                                                           "LNG"          AS "LNG",
                                                                                                                                                                                                                           "POSTAL"       AS "POSTAL",
                                                                                                                                                                                                                           "TIMEZONE"     AS "TIMEZONE"
                                                                                                                                                                                                                    FROM (SELECT * FROM (ipinfo.public.location))) AS SNOWPARK_TEMP_TABLE_UDBZ9C0UVN
                                                                                                                                      ON ("l_xg5e_JOIN_KEY" = "r_04fd_JOIN_KEY")))
                                                                                                                          WHERE ((parse_ip("IP_ADDRESS", 'inet')['ipv4'] >= "START_IP_INT") AND
                                                                                                                                 (parse_ip("IP_ADDRESS", 'inet')['ipv4'] <= "END_IP_INT"))))) AS SNOWPARK_TEMP_TABLE_SE4XQUR5LL
                         USING (trnx_id, ip_address)))) AS SNOWPARK_TEMP_TABLE_0ND8BFJ7GC INNER JOIN (SELECT "IP_ADDRESS"   AS "IP_ADDRESS",
                                                                                                             "TRNX_ID"      AS "TRNX_ID",
                                                                                                             "SHIPPING_LAT" AS "SHIPPING_LAT",
                                                                                                             "SHIPPING_LNG" AS "SHIPPING_LNG"
                                                                                                      FROM (SELECT *
                                                                                                            FROM ((SELECT "TRNX_ID"      AS "TRNX_ID",
                                                                                                                          "IP_ADDRESS"   AS "IP_ADDRESS",
                                                                                                                          "SHIPPING_LAT" AS "SHIPPING_LAT"
                                                                                                                   FROM (SELECT "TRNX_ID", "IP_ADDRESS", avg("SHIPPING_LAT") AS "SHIPPING_LAT"
                                                                                                                         FROM (SELECT "TRNX_ID",
                                                                                                                                      "IP_ADDRESS",
                                                                                                                                      "LAT" AS "SHIPPING_LAT",
                                                                                                                                      "LNG" AS "SHIPPING_LNG"
                                                                                                                               FROM (SELECT *
                                                                                                                                     FROM (SELECT *
                                                                                                                                           FROM ((SELECT "ISFRAUD"           AS "ISFRAUD",
                                                                                                                                                         "TRNX_ID"           AS "TRNX_ID",
                                                                                                                                                         "IP_ADDRESS"        AS "IP_ADDRESS",
                                                                                                                                                         "CITY"              AS "l_n9tt_CITY",
                                                                                                                                                         "SHIPPING_ZIPCODE"  AS "SHIPPING_ZIPCODE",
                                                                                                                                                         "SHIPPING_STATE"    AS "SHIPPING_STATE",
                                                                                                                                                         "PAYMENT_NETWORK"   AS "PAYMENT_NETWORK",
                                                                                                                                                         "PAYMENT_TYPE"      AS "PAYMENT_TYPE",
                                                                                                                                                         "TOTAL_TRNX_AMOUNT" AS "TOTAL_TRNX_AMOUNT",
                                                                                                                                                         "JOIN_KEY"          AS "l_n9tt_JOIN_KEY"
                                                                                                                                                  FROM (SELECT * FROM (orders))) AS SNOWPARK_TEMP_TABLE_85GYRI06D6 INNER JOIN (SELECT "START_IP_INT" AS "START_IP_INT",
                                                                                                                                                                                                                                      "END_IP_INT"   AS "END_IP_INT",
                                                                                                                                                                                                                                      "JOIN_KEY"     AS "r_ahbq_JOIN_KEY",
                                                                                                                                                                                                                                      "START_IP"     AS "START_IP",
                                                                                                                                                                                                                                      "END_IP"       AS "END_IP",
                                                                                                                                                                                                                                      "CITY"         AS "r_ahbq_CITY",
                                                                                                                                                                                                                                      "REGION"       AS "REGION",
                                                                                                                                                                                                                                      "COUNTRY"      AS "COUNTRY",
                                                                                                                                                                                                                                      "LAT"          AS "LAT",
                                                                                                                                                                                                                                      "LNG"          AS "LNG",
                                                                                                                                                                                                                                      "POSTAL"       AS "POSTAL",
                                                                                                                                                                                                                                      "TIMEZONE"     AS "TIMEZONE"
                                                                                                                                                                                                                               FROM (SELECT * FROM (ipinfo.public.location))) AS SNOWPARK_TEMP_TABLE_V3RVPJDMTX
                                                                                                                                                 ON ("l_n9tt_JOIN_KEY" = "r_ahbq_JOIN_KEY")))
                                                                                                                                     WHERE ("SHIPPING_ZIPCODE" = "POSTAL")))
                                                                                                                         GROUP BY "TRNX_ID", "IP_ADDRESS")) AS SNOWPARK_TEMP_TABLE_SCANTMHC64 INNER JOIN (SELECT "TRNX_ID"      AS "TRNX_ID",
                                                                                                                                                                                                                 "IP_ADDRESS"   AS "IP_ADDRESS",
                                                                                                                                                                                                                 "SHIPPING_LNG" AS "SHIPPING_LNG"
                                                                                                                                                                                                          FROM (SELECT "TRNX_ID", "IP_ADDRESS", avg("SHIPPING_LNG") AS "SHIPPING_LNG"
                                                                                                                                                                                                                FROM (SELECT "TRNX_ID",
                                                                                                                                                                                                                             "IP_ADDRESS",
                                                                                                                                                                                                                             "LAT" AS "SHIPPING_LAT",
                                                                                                                                                                                                                             "LNG" AS "SHIPPING_LNG"
                                                                                                                                                                                                                      FROM (SELECT *
                                                                                                                                                                                                                            FROM (SELECT *
                                                                                                                                                                                                                                  FROM ((SELECT "ISFRAUD"           AS "ISFRAUD",
                                                                                                                                                                                                                                                "TRNX_ID"           AS "TRNX_ID",
                                                                                                                                                                                                                                                "IP_ADDRESS"        AS "IP_ADDRESS",
                                                                                                                                                                                                                                                "CITY"              AS "l_n9tt_CITY",
                                                                                                                                                                                                                                                "SHIPPING_ZIPCODE"  AS "SHIPPING_ZIPCODE",
                                                                                                                                                                                                                                                "SHIPPING_STATE"    AS "SHIPPING_STATE",
                                                                                                                                                                                                                                                "PAYMENT_NETWORK"   AS "PAYMENT_NETWORK",
                                                                                                                                                                                                                                                "PAYMENT_TYPE"      AS "PAYMENT_TYPE",
                                                                                                                                                                                                                                                "TOTAL_TRNX_AMOUNT" AS "TOTAL_TRNX_AMOUNT",
                                                                                                                                                                                                                                                "JOIN_KEY"          AS "l_n9tt_JOIN_KEY"
                                                                                                                                                                                                                                         FROM (SELECT * FROM (orders))) AS SNOWPARK_TEMP_TABLE_85GYRI06D6 INNER JOIN (SELECT "START_IP_INT" AS "START_IP_INT",
                                                                                                                                                                                                                                                                                                                             "END_IP_INT"   AS "END_IP_INT",
                                                                                                                                                                                                                                                                                                                             "JOIN_KEY"     AS "r_ahbq_JOIN_KEY",
                                                                                                                                                                                                                                                                                                                             "START_IP"     AS "START_IP",
                                                                                                                                                                                                                                                                                                                             "END_IP"       AS "END_IP",
                                                                                                                                                                                                                                                                                                                             "CITY"         AS "r_ahbq_CITY",
                                                                                                                                                                                                                                                                                                                             "REGION"       AS "REGION",
                                                                                                                                                                                                                                                                                                                             "COUNTRY"      AS "COUNTRY",
                                                                                                                                                                                                                                                                                                                             "LAT"          AS "LAT",
                                                                                                                                                                                                                                                                                                                             "LNG"          AS "LNG",
                                                                                                                                                                                                                                                                                                                             "POSTAL"       AS "POSTAL",
                                                                                                                                                                                                                                                                                                                             "TIMEZONE"     AS "TIMEZONE"
                                                                                                                                                                                                                                                                                                                      FROM (SELECT * FROM (ipinfo.public.location))) AS SNOWPARK_TEMP_TABLE_V3RVPJDMTX
                                                                                                                                                                                                                                        ON ("l_n9tt_JOIN_KEY" = "r_ahbq_JOIN_KEY")))
                                                                                                                                                                                                                            WHERE ("SHIPPING_ZIPCODE" = "POSTAL")))
                                                                                                                                                                                                                GROUP BY "TRNX_ID", "IP_ADDRESS")) AS SNOWPARK_TEMP_TABLE_OY7KM4RCYB
                                                                                                                  USING (ip_address, trnx_id)))) AS SNOWPARK_TEMP_TABLE_AVMBWACGLR
            USING (trnx_id, ip_address)));



-- 3.3 Getting final results from View
SELECT TOP 100 *
FROM DEMO.FRAUDDEMO.ORDERS_ENRICH_WITH_GEOCOORDINATES;

-- 4.- Calculating distance
ALTER SESSION SET GEOGRAPHY_OUTPUT_FORMAT='WKT';
SELECT TOP 1000 *
FROM (
         SELECT "TRNX_ID",
                "IP_ADDRESS",
                "SHIPPING_ZIPCODE",
                st_makepoint("IP_ORDER_LOC_LNG", "IP_ORDER_LOC_LAT") AS "IPINFO_POINT",
                st_makepoint("SHIPPING_LNG", "SHIPPING_LAT")         AS "SHIPPING_POINT",
                st_distance("IPINFO_POINT", "SHIPPING_POINT")        AS "IP_TO_SHIPPING_DISTANCE",
                ("IP_TO_SHIPPING_DISTANCE" / 1609 :: INT)            AS "DISTANCE_IN_MILES"
         FROM (SELECT * FROM (DEMO.FRAUDDEMO.ORDERS_ENRICH_WITH_GEOCOORDINATES)))
WHERE DISTANCE_IN_MILES > 0;
