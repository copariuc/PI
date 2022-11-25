# Installing and loading required libraries
if(!require(readxl)) install.packages("readxl")
if(!require(dplyr)) install.packages("dplyr")
if(!require(lubridate)) install.packages("lubridate")

library(readxl); library(dplyr); library(lubridate)

# Importing dataset
ds <- read_xlsx(path = "Date I.xlsx", sheet = 1, trim_ws = T,
                col_types = c(rep(x = 'numeric', times = 145),
                              'text', 
                              rep(x = 'date', times = 2),
                              rep(x = 'text', times = 2),
                              'numeric',
                              rep(x = 'text', times = 7))); names(ds)
colnames(ds) <- c(paste('I', 1:145, sep = "."),
                  'online', 'date.ini', 'date.fin', 'psychologist', 'name',
                  'age', 'gender', 'studies', 'company', 'occupation.cor',
                  'occupation', 'city', 'observations'); head(ds)

# Setting-up factors
names(ds)
ds$online <- factor(ds$online, levels = c("NU", "DA"))
ds$gender <- factor(ds$gender, levels = c('m', 'f'), labels = c("Male", "Female"))
ds$studies <- ordered(ds$studies, levels = c("Fără școală", "Primare (4 clase)", "Gimnaziale (8 clase)", "Școală profesională",
                               "Liceale (12 clase)", "Post liceale", "Universitare (licență)", "Universitare (masterat)",
                               "Doctorale"),
                      labels = c('Illiterate', 'Primary (4 grades)', 'Gymnasium (8 grades)', 'Crafts and arts',
                                 'High school (12 grades', 'Post secondary', 'University (Graduated)', 'University (Master)',
                                 'Doctoral school'))

# Removing participants under 14 years old
ds <- ds %>% filter(age > 14)

# Splitting dataset based on initial items reformulation.
ds.I <- ds %>%  filter(date.ini < '2022-01-02')
ds.II <- ds %>%  filter(date.ini >= '2022-01-02')

# Saving datasets
save(ds, file = "Global DS.RData"); save(ds.I, file = "Phase I DS.RData"); save(ds.II, file = "Phase II DS.RData")

