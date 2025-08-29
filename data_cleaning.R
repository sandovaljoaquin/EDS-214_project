# Merge all datasets together with rbind to create a 'long' dataframe with variables stacked.  

q1_q2_q3_prm <- rbind(q1, q2, q3, prm) 

# Selecting for variables that are relevant to the figure and filtering for dates between 1988-1995. Also, pivoting longer to create columns 'stream_ion' and 'concentration'. 

cleaned <- q1_q2_q3_prm |> 
  select(sample_id, sample_date, nh4_n, ca, mg, no3_n, k) |>
  filter(sample_date > "1988-01-01" & sample_date < "1995-01-01") |> 
  arrange(sample_date) |> 
  pivot_longer(cols = c("nh4_n", "ca", "mg", "no3_n", "k"), names_to = "stream_ion", values_to = "concentration")

# Source moving average function from r script.

source(here("R", "moving_average.R"))

# Adding a 9-week moving average column for each observation under the concentration column. 

rolling_average <- cleaned |> 
  group_by(sample_id, stream_ion) |> 
  mutate(moving_avg = sapply(
    sample_date,
    moving_average,
    dates = sample_date,
    conc = concentration, 
    win_size_wks = 9)) |> 
  ungroup()