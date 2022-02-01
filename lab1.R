# SETUP EPI DATA ----------------------------------------------

EPI_data <- read.csv("datasets/2010EPI_data.csv")
View(EPI_data)
attach(EPI_data)
fix(EPI_data)

# set the first column to be the column names
names(EPI_data) <- as.matrix(EPI_data[1,])
EPI_data <- EPI_data[-1,]
EPI_data <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)


# EXERCISE 1: EXPLORING THE DISTRIBUTION (EPI) ----------------

# get the data from the EPI column
EPI <- EPI_data$EPI
tf <- is.na(EPI)
# E <- EPI[!tf]
# summary(E)
summary(EPI)
fivenum(EPI, na.rm=TRUE)

stem(EPI)
hist(EPI)
hist(EPI, seq(30.,95.,1.0), prob=TRUE)
lines(density(EPI, na.rm=TRUE, bw=1.))
rug(EPI)


# EXERCISE 1: FITTING A DISTRIBUTION BEYOND HISTOGRAMS --------

plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(EPI); qqline(EPI)

x <- seq(30,95,1)
qqplot(qt(ppoints(250), df=5), x, xlab="Q-Q plot for t dsn")
qqline(x)


# Repeat Exercise 1 with 2 columns of my choice:
  # ECOSYSTEM & BIODIVERSITY

# EXERCISE 1: FITTING A DISTRIBUTION (ECOSYSTEM) --------------
# get the data from the ECOSYSTEM column
eco <- EPI_data$ECOSYSTEM[!is.na(EPI_data$ECOSYSTEM)]

summary(eco)
fivenum(eco, na.rm=TRUE)


# hist(eco)
hist(eco, seq(0.,100.,2.0), prob=TRUE)
lines(density(eco, na.rm=TRUE, bw=1.))
rug(eco)


# EXERCISE 1: FITTING A DISTRIBUTION (BIODIVERSITY) -----------

bio <- EPI_data$BIODIVERSITY[!is.na(EPI_data$BIODIVERSITY)]
summary(bio)
fivenum(bio, na.rm=TRUE)

hist(bio, seq(0.,100.,2.0), prob=TRUE)
lines(density(bio, na.rm=TRUE, bw=1.))
rug(bio)

# comparing distributions
boxplot(eco, bio)
qqplot(eco, bio)

# intercompare: EPI, ENVHEALTH, ECOSYSTEM, DALY, AIR_H, WATER_H, AIR_E, WATER_E, BIODIVERSITY
# boxplot for all major categories listed
boxplot(EPI, EPI_data$ENVHEALTH, eco, EPI_data$DALY, EPI_data$AIR_H, EPI_data$WATER_H, EPI_data$AIR_E, EPI_data$WATER_E, bio)


# EXERCISE 2: FILTERING POPULATIONS (EPI) ---------------------

ll <- EPI_data$Landlock
ELand <- EPI[!ll]
ELand <- ELand[!is.na(ELand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

hist(EPI[!EPI_data$No_surface_water])
hist(EPI[!EPI_data$Desert])
hist(EPI[!EPI_data$High_Population_Density])

# filtering on EPI_regions and GEO_subregion
regions <- EPI_data$EPI_regions[!EPI_data$EPI_regions==""]
hist(EPI[!regions=="East Asian and the Pacific"])

subregions <- EPI_data$GEO_subregion[!EPI_data$GEO_subregion==""]
hist(EPI[!subregions=="Arabian Peninsula"])
rug(filtered_mean_km)


# REPEAT FOR GPW3_GRUMP_SummaryInformation_2010.csv -----------
# read in, exploration/summary, plots, histograms, distributions, filtering 

# read in data from csv
GRUMP_data <- read.csv("datasets/GPW3_GRUMP_SummaryInformation_2010.csv")
View(GRUMP_data)
attach(GRUMP_data)
fix(GRUMP_data)
# first column is already set to be names

# explore mean extent sq km data
  # and remove NA or empty strings
mean_km <- GRUMP_data$Mean.Extent..sq.km.[!GRUMP_data$Mean.Extent..sq.km.==""]
mean_km <- mean_km[!is.na(mean_km)]
mean_km <- as.numeric(gsub(",", "", mean_km))

# summary
summary(mean_km)
fivenum(mean_km)

# distribution
boxplot(mean_km)
stem(mean_km)
# found outliers at 8000
# majority of data is < 1000
  # filtering to only see below 1000
filtered_mean_km <- mean_km[!mean_km > 1000]
boxplot(filtered_mean_km)
stem(filtered_mean_km)

# plot with different bin sizes
hist(filtered_mean_km)
hist(filtered_mean_km, seq(0., 1000., 20.0))
hist(filtered_mean_km, seq(0., 1000., 10.0))

# more filtering: based on continent
continents <- GRUMP_data$ContinentName[!GRUMP_data$ContinentName==""]
hist(filtered_mean_km[!continents=="Asia"], seq(0., 1000., 10.0))
rug(filtered_mean_km)

# more filtering: based on UN region
un_regions <- GRUMP_data$UNRegion[!GRUMP_data$UNRegion==""]
hist(filtered_mean_km[!un_regions=="Caribbean"], seq(0., 1000., 10.0))
rug(filtered_mean_km)


