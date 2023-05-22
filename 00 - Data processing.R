# Installing and loading required libraries
if(!require(readxl)) install.packages("readxl")
if(!require(dplyr)) install.packages("dplyr")
if(!require(lubridate)) install.packages("lubridate")

library(readxl); library(dplyr); library(lubridate)

# Importing dataset PI Version 1 - ####
#ds <- read_xlsx(path = "PI v1.xlsx")
ds <- read_xlsx(path = "PI v1.xlsx", sheet = 1, trim_ws = T,
                col_types = c(rep(x = 'numeric', times = 145),  # Items
                              'text',                           # Online
                              rep(x = 'date', times = 2),       # Start and Stop date
                              'numeric',                        # Age
                              rep(x = 'text', times = 7))); names(ds)
colnames(ds) <- c(paste('I', 1:145, sep = "."),
                  'online', 'date.ini', 'date.fin', 
                  'age', 'gender', 'studies', 'company', 'occupation.cor',
                  'occupation', 'city', 'observations'); head(ds)

# Setting-up factors
names(ds)
ds$online <- factor(ds$online, levels = c("NU", "DA"), labels = c("NO", "YES"))
ds$gender <- factor(ds$gender, levels = c('m', 'f'), labels = c("Male", "Female"))
ds$studies <- ordered(ds$studies, levels = c("Fără școală", "Primare (4 clase)", "Gimnaziale (8 clase)", "Școală profesională",
                               "Liceale (12 clase)", "Post liceale", "Universitare (licență)", "Universitare (masterat)",
                               "Doctorale"),
                      labels = c('Illiterate', 'Primary (4 grades)', 'Gymnasium (8 grades)', 'Crafts and arts',
                                 'High school (12 grades', 'Post secondary', 'University (Graduated)', 'University (Master)',
                                 'Doctoral school'))

# Removing participants under 14 years old and saving dataset
ds <- ds %>% filter(age > 14); ds.I <- ds; save(ds.I, file = "PI v1.RData")

# Importing dataset PI Version 2 - ####
#ds <- read_xlsx(path = "PI v2.xlsx")
ds <- read_xlsx(path = "PI v2.xlsx", sheet = 1, trim_ws = T,
                col_types = c(rep(x = 'numeric', times = 145),  # Items
                              'text',                           # Online
                              rep(x = 'date', times = 2),       # Start and Stop date
                              'numeric',                        # Age
                              rep(x = 'text', times = 7))); names(ds)
colnames(ds) <- c(paste('I', 1:145, sep = "."),
                  'online', 'date.ini', 'date.fin', 
                  'age', 'gender', 'studies', 'company', 'occupation.cor',
                  'occupation', 'city', 'observations'); head(ds)

# Setting-up factors
names(ds)
ds$online <- factor(ds$online, levels = c("NU", "DA"), labels = c("NO", "YES"))
ds$gender <- factor(ds$gender, levels = c('m', 'f'), labels = c("Male", "Female"))
ds$studies <- ordered(ds$studies, levels = c("Fără școală", "Primare (4 clase)", "Gimnaziale (8 clase)", "Școală profesională",
                                             "Liceale (12 clase)", "Post liceale", "Universitare (licență)", "Universitare (masterat)",
                                             "Doctorale"),
                      labels = c('Illiterate', 'Primary (4 grades)', 'Gymnasium (8 grades)', 'Crafts and arts',
                                 'High school (12 grades', 'Post secondary', 'University (Graduated)', 'University (Master)',
                                 'Doctoral school'))

# Removing participants under 14 years old and saving dataset
ds <- ds %>% filter(age > 14); ds.II <- ds; save(ds.II, file = "PI v2.RData")

# Importing dataset PI Version T1 + T2 - ####
#ds <- read_xlsx(path = "PI T1-T2.xlsx"); names(ds)
ds <- read_xlsx(path = "PI T1-T2.xlsx", sheet = 1, trim_ws = T,
                col_types = c(rep(x = 'numeric', times = 145),  # Items Test (T1)
                              'text',                           # Online Test (T1)
                              'date',                           # Stop date Test (T1)
                              'numeric',                        # Age test (T1)
                              rep(x = 'text', times = 6),       # Gender et all Test (T1)
                              rep(x = 'numeric', times = 145)   # Items Retest (T2)
                              )); names(ds)
colnames(ds) <- c(paste('T', 1:145, sep = "."),
                  'online', 'date.fin', 
                  'age', 'gender', 'studies', 'company', 'occupation.cor',
                  'occupation', 'city',
                  paste('R', 1:145, sep = ".")); head(ds)

# Setting-up factors
names(ds)
ds$online <- factor(ds$online, levels = c("NU", "DA"), labels = c("NO", "YES"))
ds$gender <- factor(ds$gender, levels = c('m', 'f'), labels = c("Male", "Female"))
ds$studies <- ordered(ds$studies, levels = c("Fără școală", "Primare (4 clase)", "Gimnaziale (8 clase)", "Școală profesională",
                                             "Liceale (12 clase)", "Post liceale", "Universitare (licență)", "Universitare (masterat)",
                                             "Doctorale"),
                      labels = c('Illiterate', 'Primary (4 grades)', 'Gymnasium (8 grades)', 'Crafts and arts',
                                 'High school (12 grades', 'Post secondary', 'University (Graduated)', 'University (Master)',
                                 'Doctoral school'))

# Removing participants under 14 years old and saving dataset
ds <- ds %>% filter(age > 14); ds.III <- ds; save(ds.III, file = "PI T1-T2.RData"); rm(ds, ds.I, ds.II, ds.III)
