# Loading datasets
load("Phase I DS.RData"); load("Phase II DS.RData")

# Sample for Phase I ####
names(ds.I); I.n <- nrow(ds.I)
I.dt.sta <- as.Date(min(ds.I$date.ini, na.rm = T)); I.dt.end <- as.Date(max(ds.I$date.ini, na.rm = T))
I.gen <- table(ds.I$gender); I.gen
I.m <- as.numeric(I.gen[1]); I.f <- as.numeric(I.gen[2])
I.m.pr <- round(as.numeric(I.gen[1]) / I.n * 100, 2); I.f.pr <- round(as.numeric(I.gen[2]) / I.n * 100, 2)
I.age.m <- round(mean(ds.I$age, na.rm = T), 2); I.age.sd <- round(sd(ds.I$age, na.rm = T), 2)
I.age.min <- min(ds.I$age, na.rm = T); I.age.max <- max(ds.I$age, na.rm = T)
I.stud <- table(ds.I$studies); I.stud
I.ill <-as.numeric(I.stud[1]); I.ill.pr <- round(as.numeric(I.stud[1]) / I.n * 100, 2)
I.pri <-as.numeric(I.stud[2]); I.pri.pr <- round(as.numeric(I.stud[2]) / I.n * 100, 2)
I.gym <-as.numeric(I.stud[3]); I.gym.pr <- round(as.numeric(I.stud[3]) / I.n * 100, 2)
I.crf <-as.numeric(I.stud[4]); I.crf.pr <- round(as.numeric(I.stud[4]) / I.n * 100, 2)
I.his <-as.numeric(I.stud[5]); I.his.pr <- round(as.numeric(I.stud[5]) / I.n * 100, 2)
I.pse <-as.numeric(I.stud[6]); I.pse.pr <- round(as.numeric(I.stud[6]) / I.n * 100, 2)
I.lic <-as.numeric(I.stud[7]); I.lic.pr <- round(as.numeric(I.stud[7]) / I.n * 100, 2)
I.mas <-as.numeric(I.stud[8]); I.mas.pr <- round(as.numeric(I.stud[8]) / I.n * 100, 2)
I.doc <-as.numeric(I.stud[9]); I.doc.pr <- round(as.numeric(I.stud[9]) / I.n * 100, 2)
I.onl <- table(ds.I$online); I.onl; I.onl <- as.numeric(I.onl[2]); I.onl.pr <- round(I.onl/ I.n * 100, 2)

# Sample for Phase II ####
names(ds.II); II.n <- nrow(ds.II)
II.dt.sta <- as.Date(min(ds.II$date.ini, na.rm = T)); II.dt.end <- as.Date(max(ds.II$date.ini, na.rm = T))
II.gen <- table(ds.I$gender); II.gen
II.m <- as.numeric(II.gen[1]); II.f <- as.numeric(II.gen[2])
II.m.pr <- round(as.numeric(II.gen[1]) / II.n * 100, 2); II.f.pr <- round(as.numeric(II.gen[2]) / II.n * 100, 2)
II.age.m <- round(mean(ds.II$age, na.rm = T), 2); II.age.sd <- round(sd(ds.II$age, na.rm = T), 2)
II.age.min <- min(ds.II$age, na.rm = T); II.age.max <- max(ds.II$age, na.rm = T)
II.stud <- table(ds.I$studies); II.stud
II.ill <-as.numeric(II.stud[1]); II.ill.pr <- round(as.numeric(II.stud[1]) / II.n * 100, 2)
II.pri <-as.numeric(II.stud[2]); II.pri.pr <- round(as.numeric(II.stud[2]) / II.n * 100, 2)
II.gym <-as.numeric(II.stud[3]); II.gym.pr <- round(as.numeric(II.stud[3]) / II.n * 100, 2)
II.crf <-as.numeric(II.stud[4]); II.crf.pr <- round(as.numeric(II.stud[4]) / II.n * 100, 2)
II.his <-as.numeric(II.stud[5]); II.his.pr <- round(as.numeric(II.stud[5]) / II.n * 100, 2)
II.pse <-as.numeric(II.stud[6]); II.pse.pr <- round(as.numeric(II.stud[6]) / II.n * 100, 2)
II.lic <-as.numeric(II.stud[7]); II.lic.pr <- round(as.numeric(II.stud[7]) / II.n * 100, 2)
II.mas <-as.numeric(II.stud[8]); II.mas.pr <- round(as.numeric(II.stud[8]) / II.n * 100, 2)
II.doc <-as.numeric(II.stud[9]); II.doc.pr <- round(as.numeric(II.stud[9]) / II.n * 100, 2)
II.onl <- table(ds.II$online); II.onl; II.onl <- as.numeric(II.onl[2]); II.onl.pr <- round(II.onl/ II.n * 100, 2)

