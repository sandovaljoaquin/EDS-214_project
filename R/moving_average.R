moving_average <- function(sample_date, dates, conc, win_size_wks) {
  # Dates in the window
  is_in_window <- (dates > sample_date - (win_size_wks / 2) * 7) &
    (dates < sample_date + (win_size_wks / 2) * 7)
  # Find the associated concentrations
  window_conc <- conc[is_in_window]
  # Calculate the mean
  result <- mean(window_conc)
  
  return(result)
}

