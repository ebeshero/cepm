use cepm;

create or replace view vw_rounded_data as
select v.year_id as `year`,r.region as `region type`,
       s.source_desc as `source`,c.component as component,
       round(v.measurement,2) as `rounded value` from tbl_values v
inner join regions r on r.reg_id=v.reg_id
inner join components c on c.comp_id=v.comp_id
inner join sources s on s.src_id=v.src_id
order by v.src_id asc, v.comp_id asc;

create or replace view vw_raw_data as
select v.year_id as `year`,r.region as `region type`,
       s.source_desc as `source`,c.component as component,
       v.measurement as `value` from tbl_values v
inner join regions r on r.reg_id=v.reg_id
inner join components c on c.comp_id=v.comp_id
inner join sources s on s.src_id=v.src_id
order by v.src_id asc, v.comp_id asc;

create or replace view vw_full_data as
select v.year_id as `year`,r.reg_id,r.region as `region type`,
       s.src_id,s.source_desc as `source`,s.regional_data,
       s.regional_perc, c.comp_id,c.component as component,
       v.measurement as `value` from tbl_values v
inner join regions r on r.reg_id=v.reg_id
inner join components c on c.comp_id=v.comp_id
inner join sources s on s.src_id=v.src_id
order by v.src_id asc, v.comp_id asc;

