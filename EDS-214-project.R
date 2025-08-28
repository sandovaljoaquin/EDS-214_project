#................................................................
## The purpose of this script is to provide direction on how to replicate figure 3 - Concentrations of potassium, nitrate-N, magnesium, calcium and ammonium-N in Bisley, Puerto Rico streams before and after Hurricane Hugo, 9-wk moving average from Schaefer et al 2000.

# Author: Joaquin Sandoval 
# email: joaquinsandoval@ucsb.edu

#................................................................

# Installing necessary packages. 


library(here)
library(tidyverse)
library(janitor)
library(patchwork)
library(gridExtra)

source("moving_average.R")

# Reading in data using here() and read_csv.

Q1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv")) |> 
  janitor::clean_names()

Q2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv")) |> 
  janitor::clean_names()

Q3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv")) |> 
  janitor::clean_names()

PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv")) |> 
  janitor::clean_names()


#Merge all datasets together with rbind to create a 'long' dataframe with variables stacked  


Q1_Q2_Q3_PRM <- rbind(Q1, Q2, Q3, PRM) 


#Selecting for variables that are relevant to the figure and filtering for dates between 1988-1995

cleaned <- Q1_Q2_Q3_PRM |> 
  select(sample_id, sample_date, nh4_n, ca, mg, no3_n, k) |> 
  filter(sample_date > "1988-01-01" & sample_date < "1995-01-01") |> 
  arrange(sample_date)

# Using moving_average function along with sapply to create new columns 

cleaned$k <- sapply(
  cleaned$sample_date,
  moving_average,
  dates = cleaned$sample_date,
  conc = cleaned$k,
  win_size_wks = 9)

cleaned$no3_n <- sapply(
  cleaned$sample_date,
  moving_average,
  dates = cleaned$sample_date,
  conc = cleaned$no3_n,
  win_size_wks = 9)

cleaned$mg <- sapply(
  cleaned$sample_date,
  moving_average,
  dates = cleaned$sample_date,
  conc = cleaned$mg,
  win_size_wks = 9)

cleaned$ca <- sapply(
  cleaned$sample_date,
  moving_average,
  dates = cleaned$sample_date,
  conc = cleaned$ca,
  win_size_wks = 9)

cleaned$nh4_n <- sapply(
  cleaned$sample_date,
  moving_average,
  dates = cleaned$sample_date,
  conc = cleaned$nh4_n,
  win_size_wks = 9)

# Adding a '9-week' moving average average column for each chemical concentration that we're interested in. 


# Plotting moving average of K concentrations vs year


k_plot <- ggplot(data = cleaned,
                 aes(x = sample_date,
                     y = k)) +
  geom_line(aes(linetype = sample_id)) +
  geom_vline(xintercept = as.Date("1989-09-10"), linetype = "solid") +
  xlab(" ") +
  ylab("K") +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())

k_plot

# Plotting moving average of NO3 concentrations vs year


no3_plot <- ggplot(data = cleaned, 
                   aes(x = sample_date, 
                       y = no3_n)) + 
  geom_line(aes(linetype = sample_id))+ 
  geom_vline(xintercept = as.Date("1989-09-10"), linetype = "solid") + 
  xlab(" ") + 
  ylab("NO3") +
  theme(axis.line = element_blank(), axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none")

no3_plot

# Plotting moving average of Mg concentrations vs year


mg_plot <- ggplot(data = cleaned, 
                  aes(x = sample_date, 
                      y = mg)) + 
  geom_line(aes(linetype = sample_id)) + 
  geom_vline(xintercept = as.Date("1989-09-10"), linetype = "solid") + 
  xlab(" ") + 
  ylab("Mg") +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none")

mg_plot

# Plotting moving average of Ca concentrations vs year


ca_plot <- ggplot(data = cleaned, 
                  aes(x = sample_id, 
                      y = ca)) + 
  geom_line(aes(linetype = sample_id)) + 
  geom_vline(xintercept = as.Date("1989-09-10"), linetype = "solid") + 
  xlab(" ") + 
  ylab("Ca") +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none")

ca_plot


# Plotting moving average of NH4-N concentrations vs year


nh4_plot <- ggplot(data = cleaned, 
                   aes(x = sample_date, 
                       y = nh4_n)) + 
  geom_line(aes(linetype = sample_id)) + 
  geom_vline(xintercept = as.Date("1989-09-10"), linetype = "solid") + 
  xlab(" ") + 
  ylab("NH4") + 
  theme(legend.position = "none")

nh4_plot

# Merging plots to replicate the style of figure 3.


megaplot<- k_plot/ no3_plot / mg_plot / ca_plot / nh4_plot 
megaplot
