#Merge all datasets together with rbind to create a 'long' dataframe with variables stacked  


Q1_Q2_Q3_PRM <- rbind(Q1, Q2, Q3, PRM)


#Selecting for variables that are relevant to the figure.


cleaned <- Q1_Q2_Q3_PRM |> 
  select(sample_id, sample_date, nh4_n, ca, mg, no3_n, k) |> 
  filter(sample_date > "1988-01-01" & sample_date < "1995-01-01")