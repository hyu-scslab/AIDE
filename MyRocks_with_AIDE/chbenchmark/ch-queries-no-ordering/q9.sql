SET @@session.s3d_forced_table_scan=FALSE;
SET @@session.ndp_src_table="NONE";

select     n_name, extract(year from o_entry_d) as l_year, sum(ol_amount) as sum_profit
from     item, stock, supplier, order_line, orders, nation
where     ol_i_id = s_i_id
     and ol_supply_w_id = s_w_id
     and s_m_id = su_suppkey
     and ol_o_id = o_id
     and ol_w_id = o_w_id
     and ol_d_id = o_d_id
     and ol_i_id = i_id
     and su_nationkey = n_nationkey
     and i_data_ra2 = 16962
group by n_name, extract(year from o_entry_d)
order by n_name, l_year desc LIMIT 10;
