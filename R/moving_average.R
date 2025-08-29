#' Moving average function
#'
#' @param sample_date : when data was collected. Reference date for 9 week window. 
#' @param dates : adjacent dates with associated ion concentrations that must be within 4.5 weeks before or after sample_date. 
#' @param conc : Concentration of ion
#' @param win_size_wks : 9 week window
#'
#' @returns  : 9 week moving average of concentration 
#' @export
#'
#' @examples

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

