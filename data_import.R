# Reading in data from Qebrada Cuenca 1,2,3 and Rio Mameyes, Puente Roto.

q1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv")) |> 
  janitor::clean_names()

q2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv")) |> 
  janitor::clean_names()

q3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv")) |> 
  janitor::clean_names()

prm <- read_csv(here("data", "RioMameyesPuenteRoto.csv")) |> 
  janitor::clean_names()