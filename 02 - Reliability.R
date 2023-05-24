# Installing and loading required libraries
if(!require(dplyr)) install.packages("dplyr")
if(!require(psych)) install.packages("psych")

library(dplyr); library(psych)

# Setting up keys ####
Key <- list(
  # Pleasurable = c('I.15', 'I.42', 'I.69', 'I.83', 'I.86', 'I.117', 'I.139'),  # Agreabila ***
  Pleasurable = c('I.15', 'I.42', 'I.69', 'I.83', 'I.86', 'I.117'),
  # Regenerative = c('I.8', 'I.33', 'I.49', 'I.84', 'I.119', 'I.141'),          # Regenerativa ***
  Regenerative = c('I.8', 'I.33', 'I.49', 'I.84', 'I.119', 'I.141'),
  # Progressing = c('I.39', 'I.52', 'I.58', 'I.89', 'I.118', 'I.140'),          # In progres ***
  Progressing = c('I.39', 'I.52', 'I.58', 'I.89', 'I.118', 'I.140'),
  # Harmless = c('I.1', 'I.12', 'I.32', 'I.65', 'I.97', 'I.107', 'I.129'),      # Inofensiva ***
  Harmless = c('I.1', 'I.12', 'I.32', 'I.65', 'I.97', 'I.107'),
  # Cooperative = c('I.30', 'I.66', 'I.75', 'I.98', 'I.105', 'I.127'),          # Colaborativa ***
  Cooperative = c('I.30', 'I.66', 'I.75', 'I.98', 'I.105'), 
  # Stable = c('I.13', 'I.41', 'I.43', 'I.64', 'I.120', 'I.142'),               # Stabila ***
  Stable = c('I.13', 'I.41', 'I.43', 'I.64', 'I.120', 'I.142'),
  # Just = c('I.5', 'I.20', 'I.28', 'I.50', 'I.61', 'I.114', 'I.136'),          # Dreapta ***
  Just = c('I.5', 'I.20', 'I.28', 'I.50', 'I.61', 'I.114'),
  
  # SECONDARY FACTOR - Safe - Dangerous: Sigura - Periculoasa
  Safe.Dangerous = c('I.30', 'I.66', 'I.75', 'I.98', 'I.105',            # Cooperative (no 105)
                     'I.1', 'I.12', 'I.32', 'I.65', 'I.97', 'I.107',     # Harmless (no 107)
                     'I.5', 'I.50', 'I.61', 'I.20', 'I.28', 'I.114',                     # Just (no 20, 28, 114)
                     'I.15', 'I.42', 'I.69', 'I.83', 'I.86', 'I.117',    # Pleasurable (no 117)
                     'I.39', 'I.52', 'I.58', 'I.89', 'I.118', 'I.140',            # Progressing (no 118, 140)
                     'I.8', 'I.33', 'I.49', 'I.84', 'I.119', 'I.141',             # Regenerative (no 119, 141)
                     'I.13', 'I.41', 'I.43', 'I.64', 'I.120', 'I.142'),           # Stable (no 120, 142)
  
  # Interesting = c('I.44', 'I.51', 'I.68', 'I.88', 'I.113', 'I.135'),          # Interesanta ***
  Interesting = c('I.44', 'I.51', 'I.68', 'I.88', 'I.113', 'I.135'),
  # Beautiful = c('I.31', 'I.36', 'I.60', 'I.95'),                              # Frumoasa ***
  Beautiful = c('I.31', 'I.36', 'I.60', 'I.95'),
  # Abundant = c('I.3', 'I.17', 'I.70', 'I.96', 'I.102', 'I.123'),              # Bogata ***
  Abundant = c('I.3', 'I.17', 'I.70', 'I.96', 'I.102', 'I.123'),
  # Worth.Exploring = c('I.29', 'I.62', 'I.77', 'I.101', 'I.122', 'I.144'),     # Merita explorata ***
  Worth.Exploring = c('I.29', 'I.62', 'I.77', 'I.101', 'I.122', 'I.144'),
  # Meaningful = c('I.2', 'I.6', 'I.7', 'I.24', 'I.115', 'I.137'),              # Semnificativa ***
  Meaningful = c('I.2', 'I.6', 'I.7', 'I.24', 'I.115', 'I.137'),
  # Improvable = c('I.4', 'I.16', 'I.27', 'I.40', 'I.76', 'I.109'),             # Usor de imbunatatit ***
  Improvable = c('I.4', 'I.16', 'I.27', 'I.40', 'I.76', 'I.109'),
  # Funny = c('I.18', 'I.99', 'I.37', 'I.47', 'I.106', 'I.128'),                # Amuzanta ***
  Funny = c('I.18', 'I.37', 'I.47', 'I.99', 'I.106', 'I.128'),
  
  # SECONDARY FACTOR - Enticing - Dull: Incitanta - Anosta
  Enticing.Dull = c('I.3', 'I.17', 'I.70', 'I.96', 'I.102', 'I.123',              # Abundant (no 102, 123)
                    'I.31', 'I.36', 'I.60', 'I.95',             # Beautiful
                    'I.18', 'I.37', 'I.47', 'I.99', 'I.106', 'I.128',                     # Funny (no 99, 106, 128)
                    'I.4', 'I.16', 'I.27', 'I.40', 'I.76', 'I.109',                      # Improvable (no 40, 76, 109)
                    'I.44', 'I.51', 'I.68', 'I.88', 'I.113' , 'I.135',             # Interesting (no 113, 135)
                    'I.2', 'I.6', 'I.7', 'I.24', 'I.116', 'I.137',                # Meaningful (no 115, 137)
                    'I.29', 'I.62', 'I.77', 'I.101', 'I.144',            # Worth.Exploring (no 144)
                    'I.26', 'I.59'),                            # Non tertiary factors' items
  
  # Intentional = c('I.23', 'I.53', 'I.54', 'I.55', 'I.85', 'I.110', 'I.132'),  # Cu scop ***
  Intentional = c('I.23', 'I.53', 'I.54', 'I.55', 'I.85', 'I.110'),
  # Needs.Me = c('I.19', 'I.25', 'I.45', 'I.71', 'I.116', 'I.138'),             # Are nevoie de mine ***
  Needs.Me = c('I.19', 'I.25', 'I.45', 'I.71', 'I.116', 'I.138'),
  # Interactive = c('I.46', 'I.74', 'I.79', 'I.94', 'I.100', 'I.111', 'I.133'), # Interactiva ***
  Interactive = c('I.46', 'I.74', 'I.79', 'I.94', 'I.100', 'I.111'),
  
  # SECONDARY FACTOR - Alive - Mechanistic: Vie - Mecanicista
  Alive.Mechanistic = c('I.23', 'I.53', 'I.54', 'I.55', 'I.85',          # Intentional (no, 110)
                        'I.20',                           # Just - Safe - Dangerous
                        'I.46', 'I.74', 'I.94', 'I.100',         # Interactive (no, 79, 111)
                        'I.19', 'I.25', 'I.45', 'I.71'),       # Needs me
  
  # Unrelated factors
  # Acceptable = c('I.22', 'I.34', 'I.63', 'I.90', 'I.103', 'I.124'),           # Acceptabila ***
  Acceptable = c('I.22', 'I.34', 'I.63', 'I.90', 'I.103', 'I.124'),
  # Changing = c('I.35','I.38', 'I.57', 'I.93', 'I.87', 'I.104', 'I.126'),      # Schimbatoare ***
  Changing = c('I.35','I.38', 'I.57', 'I.93', 'I.87', 'I.104'),
  # Hierarchical = c('I.9', 'I.11', 'I.14', 'I.67', 'I.73', 'I.108', 'I.130'),  # Ierarhica ***
  Hierarchical = c('I.9', 'I.11', 'I.14', 'I.67', 'I.73', 'I.108', 'I.130'),
  # Interconnected = c('I.10', 'I.82', 'I.91', 'I.92', 'I.112', 'I.134'),       # Interconectata ***
  Interconnected = c('I.10', 'I.82', 'I.91', 'I.92', 'I.112', 'I.134'),
  # Understandable = c('I.21', 'I.56', 'I.78', 'I.81', 'I.121', 'I.143'),       # Usor de inteles ***
  Understandable = c('I.21', 'I.56', 'I.78', 'I.81', 'I.121', 'I.143'),
  
  # PRIMARY FACTOR - Good - Bad: Buna - Rea
  Good.Bad = c('I.3', 'I.17', 'I.70', 'I.96',                # Abundant (no 102, 123)
               'I.31', 'I.36', 'I.60', 'I.95',               # Beautiful
               'I.30', 'I.66', 'I.75', 'I.98',               # Cooperative (no 105, 127)
               'I.18', 'I.99', 'I.37', 'I.47',               # Funny (no 106, 128)
               'I.1', 'I.12', 'I.32', 'I.65', 'I.97',        # Harmless (no 107, 129)
               'I.4', 'I.16', 'I.27', 'I.40', 'I.76',        # Improvable (no 109)
               'I.44', 'I.51', 'I.68', 'I.88',               # Interesting (no 113, 135)
               'I.5', 'I.20', 'I.28', 'I.50', 'I.61',        # Just (no 114)
               'I.2', 'I.6', 'I.7', 'I.24',                  # Meaningful (no 115, 137)
               'I.19', 'I.25', 'I.45', 'I.71',               # Needs Me (no 116, 138)
               'I.15', 'I.42', 'I.69', 'I.83', 'I.86',       # Pleasurable (no 117, 139)
               'I.39', 'I.52', 'I.58', 'I.89',               # Progressing (no 118, 140)
               'I.8', 'I.33', 'I.49', 'I.84',                # Regenerative (no 119, 141)
               'I.13', 'I.41', 'I.43', 'I.64',               # Stable (no 120, 142)  
               'I.21', 'I.56', 'I.78', 'I.81',               # Understandable (no 121, 143)
               'I.29', 'I.62', 'I.77', 'I.101',              # Worth.Exploring (no 122, 144)
               'I.26', 'I.59','I.72'))                       # Non tertiary factors' items

# Consistency - Alpha - Phase 1 ####
## Loading datasets
load("PI v2.RData"); ds <- ds.II; rm(ds.II)

## First secondary dimension - SAFE - DANGEROUS ####
cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Pleasurable), 
                          cumulative = T, title = "Pleasurable", check.keys = T); consistency
Pleasurable.1.raw <- as.numeric(round(consistency$total[2], 2))
Pleasurable.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Pleasurable.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Pleasurable.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Regenerative), 
                                 cumulative = T, title = "Regenerative", check.keys = T); consistency
Regenerative.1.raw <- as.numeric(round(consistency$total[2], 2))
Regenerative.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Regenerative.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Regenerative.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Progressing), 
                                 cumulative = T, title = "Progressing", check.keys = T); consistency
Progressing.1.raw <- as.numeric(round(consistency$total[2], 2))
Progressing.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Progressing.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Progressing.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Harmless), 
                                 cumulative = T, title = "Harmless", check.keys = T); consistency
Harmless.1.raw <- as.numeric(round(consistency$total[2], 2))
Harmless.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Harmless.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Harmless.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Cooperative), 
                                 cumulative = T, title = "Cooperative", check.keys = T); consistency
Cooperative.1.raw <- as.numeric(round(consistency$total[2], 2))
Cooperative.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Cooperative.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Cooperative.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Stable), 
                                 cumulative = T, title = "Stable", check.keys = T); consistency
Stable.1.raw <- as.numeric(round(consistency$total[2], 2))
Stable.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Stable.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Stable.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Just), 
                                 cumulative = T, title = "Just", check.keys = T); consistency
Just.1.raw <- as.numeric(round(consistency$total[2], 2))
Just.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Just.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Just.1.drop <- round(consistency$alpha.drop, 3)

## Second secondary dimension - ENTICING - DULL ####
cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Interesting), 
                                 cumulative = T, title = "Interesting", check.keys = T); consistency
Interesting.1.raw <- as.numeric(round(consistency$total[2], 2))
Interesting.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Interesting.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Interesting.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Beautiful), 
                                 cumulative = T, title = "Beautiful", check.keys = T); consistency
Beautiful.1.raw <- as.numeric(round(consistency$total[2], 2))
Beautiful.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Beautiful.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Beautiful.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Abundant), 
                                 cumulative = T, title = "Abundant", check.keys = T); consistency
Abundant.1.raw <- as.numeric(round(consistency$total[2], 2))
Abundant.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Abundant.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Abundant.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Worth.Exploring), 
                                 cumulative = T, title = "Worth.Exploring", check.keys = T); consistency
Worth.Exploring.1.raw <- as.numeric(round(consistency$total[2], 2))
Worth.Exploring.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Worth.Exploring.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Worth.Exploring.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Meaningful), 
                                 cumulative = T, title = "Meaningful", check.keys = T); consistency
Meaningful.1.raw <- as.numeric(round(consistency$total[2], 2))
Meaningful.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Meaningful.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Meaningful.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Improvable), 
                                 cumulative = T, title = "Improvable", check.keys = T); consistency
Improvable.1.raw <- as.numeric(round(consistency$total[2], 2))
Improvable.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Improvable.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Improvable.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Funny), 
                                 cumulative = T, title = "Funny", check.keys = T); consistency
Funny.1.raw <- as.numeric(round(consistency$total[2], 2))
Funny.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Funny.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Funny.1.drop <- round(consistency$alpha.drop, 3)

## Third secondary dimension - ALIVE - MECHANISTIC ####
cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Intentional), 
                                 cumulative = T, title = "Intentional", check.keys = T); consistency
Intentional.1.raw <- as.numeric(round(consistency$total[2], 2))
Intentional.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Intentional.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Intentional.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Needs.Me), 
                                 cumulative = T, title = "Needs.Me", check.keys = T); consistency
Needs.Me.1.raw <- as.numeric(round(consistency$total[2], 2))
Needs.Me.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Needs.Me.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Needs.Me.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Interactive), 
                                 cumulative = T, title = "Interactive", check.keys = T); consistency
Interactive.1.raw <- as.numeric(round(consistency$total[2], 2))
Interactive.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Interactive.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Interactive.1.drop <- round(consistency$alpha.drop, 3)

## Unrelated tertiary factors ####
cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Acceptable), 
                                 cumulative = T, title = "Acceptable", check.keys = T); consistency
Acceptable.1.raw <- as.numeric(round(consistency$total[2], 2))
Acceptable.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Acceptable.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Acceptable.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Changing), 
                                 cumulative = T, title = "Changing", check.keys = T); consistency
Changing.1.raw <- as.numeric(round(consistency$total[2], 2))
Changing.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Changing.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Changing.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Hierarchical), 
                                 cumulative = T, title = "Hierarchical", check.keys = T); consistency
Hierarchical.1.raw <- as.numeric(round(consistency$total[2], 2))
Hierarchical.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Hierarchical.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Hierarchical.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Interconnected), 
                                 cumulative = T, title = "Interconnected", check.keys = T); consistency
Interconnected.1.raw <- as.numeric(round(consistency$total[2], 2))
Interconnected.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Interconnected.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Interconnected.1.drop <- round(consistency$alpha.drop, 3)

cat("\14"); consistency <- alpha(x = ds %>% dplyr::select(Key$Understandable), 
                                 cumulative = T, title = "Understandable", check.keys = T); consistency
Understandable.1.raw <- as.numeric(round(consistency$total[2], 2))
Understandable.1.CI.lo <- as.numeric(round(consistency$feldt$lower.ci, 2))
Understandable.1.CI.up <- as.numeric(round(consistency$feldt$upper.ci, 2))
Understandable.1.drop <- round(consistency$alpha.drop, 3)

rm(consistency)

## Safe - Dangerous dimension - Omega ####
cat("\14"); consistency <- omegah(m = ds %>% dplyr::select(Key$Safe.Dangerous), 
                           fm = "minres", rotate = "oblimin", plot = F,
                           nfactors = 7, poly = T, n.iter = 10, flip = T, p = .05,
                           title = "Omega analysis: Safe - Dangerous dimension"); consistency
omega.diagram(consistency, simple = T, sort = F)

## Enticing - Dull dimension - Omega ####
cat("\14"); consistency <- omegah(m = ds %>% dplyr::select(Key$Enticing.Dull), 
                                  fm = "minres", rotate = "oblimin", plot = F,
                                  nfactors = 8, poly = T, n.iter = 10, flip = T, p = .05,
                                  title = "Omega analysis: Enticing - Dull dimension"); consistency
omega.diagram(consistency, simple = T, sort = F)
## Alive - Mechanistic - Omega ####
cat("\14"); consistency <- omegah(m = ds %>% dplyr::select(Key$Alive.Mechanistic), 
                                  fm = "minres", rotate = "oblimin", plot = F,
                                  nfactors = 4, poly = T, n.iter = 10, flip = T, p = .05,
                                  title = "Omega analysis: Alive - Mechanistic dimension"); consistency
omega.diagram(consistency, simple = T, sort = F)
## Good - Bad - Omega ####
cat("\14"); consistency <- omegah(m = ds %>% dplyr::select(Key$Good.Bad), 
                                  fm = "minres", rotate = "oblimin", plot = F,
                                  nfactors = 17, poly = T, n.iter = 10, flip = T, p = .05,
                                  title = "Omega analysis: Good - Bad dimension"); consistency
omega.diagram(consistency, simple = T, sort = F)
