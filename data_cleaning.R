#Merge all datasets together with rbind to create a 'long' dataframe with variables stacked  


q1_q2_q3_prm <- rbind(q1, q2, q3, prm)


#Selecting for variables that are relevant to the figure.


cleaned <- q1_q2_q3_prm |> 
  select(sample_id, sample_date, nh4_n, ca, mg, no3_n, k) |> 
  filter(sample_date > "1988-01-01" & sample_date < "1995-01-01")