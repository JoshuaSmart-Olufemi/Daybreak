MODEL (
  name fx_stg_events,
  kind INCREMENTAL_BY_TIME_RANGE( 
    time_column execution_date
  ),
  start '2025-09-10' ,
  cron '@daily',
  grain execution_date,
  audits (
    not_null(columns := (execution_date)),
    unique_values(columns := (execution_date))
  )
);

SELECT 
  execution_date
  , base
  , united_states_dollars
  , great_british_pounds
  , canadian_dollars
  , nigerian_naira
  ,  retrieved_at
 FROM 
  exchange_rates 
 WHERE execution_date BETWEEN @start_date AND @end_date
  