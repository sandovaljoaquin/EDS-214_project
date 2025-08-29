# Reading in data from Qebrada Cuenca 1,2,3 and Rio Mameyes, Puente Roto.

Q1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv")) |> 
  janitor::clean_names()

Q2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv")) |> 
  janitor::clean_names()

Q3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv")) |> 
  janitor::clean_names()

PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv")) |> 
  janitor::clean_names()