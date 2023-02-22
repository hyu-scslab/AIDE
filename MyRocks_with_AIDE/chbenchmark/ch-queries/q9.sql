SET @@session.s3d_forced_table_scan=TRUE;
SET @@session.ndp_src_table="ITEM";
SET @@session.ndp_max_joins=8;

select STRAIGHT_JOIN n_name, extract(year from o_entry_d) as l_year, sum(ol_amount) as sum_profit
from
item
  INNER JOIN order_line on i_id_val = ol_i_id
  INNER JOIN stock on ol_suwi = s_wi
  INNER JOIN supplier on s_m_id = su_suppkey_val
  INNER JOIN nation on su_nationkey = n_nationkey_val
  INNER JOIN orders on ol_o_id = o_id and ol_w_id = o_w_id and ol_d_id = o_d_id
WHERE i_data_ra2=16962
group by n_name, extract(year from o_entry_d)
order by n_name, l_year desc LIMIT 10;