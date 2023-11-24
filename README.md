# Palmer Penguins Data Visualization Shiny App

[Link to run the app](https://gopal-khanal.shinyapps.io/assignment-b3-gopalkhanal11/) 

Created by Gopal Khanal
2023-11-23

## Description

The Palmer Penguins Shiny App provides customize visualization of `penguins` dataset collected from Palmer Archipelago of Antarctica between the years 2007 to 2009. The data includes measurements of body mass, bill depth, and flipper length of three species of penguins Adelie, Chinstrap, and Gentoo from three islands iscoe, Dream, and Torgensen within Palmer Archipelago.

The shiny app includes box plot, descriptive summary of body mass, and whole data table. The boxplot allows users  to compare whether body mass of penguins across differs among species, island, and based on sex, and year.


### Shiny App Features

#### Boxplot 

Users can select the categorical variable for which they want to compare body mass of penguins

1. **Species**: The body mass of penguins summarized across species 

2. **island**: The body mass of penguins summarized across island. 

3. **Year**: The body mass of penguins summarized across year

4. **Sex**: The body mass of penguins summarized across sex 

#### Summary table 

The table summarizes descriptive summary statistics (mean, median, standard deviation, maximum value and minimum value) of body mass of penguins (kg) across 
species, island, year and sex categories. 

#### Data table

The table allows user to download the whole dataset of palmer penguins dataset.


## Data Source

The `penguins`data was sourced from the [palmerpenguins R package](https://github.com/allisonhorst/palmerpenguins) developed by Allison Horst, Alison Hill, and Kristen Gorman. But the original data was collected by Dr. Kristen Gorman and the Palmer Station,for Antarctica LTER, a member of the Long Term Ecological Research Network.

[More information on Palmerpenguins here](https://allisonhorst.github.io/palmerpenguins/)

The dataset is publicly available and meant to allow for data exploration and visualization. You can install the `palmerpenguins` package in R and access the data with install.packages("palmerpenguins").


## Additional data use information
Anyone interested in publishing the data should contact Dr. Kristen Gorman about analysis and working together on any final products. From Gorman et al. (2014): “Individuals interested in using these data are expected to follow the US LTER Network’s Data Access Policy, Requirements and Use Agreement: https://lternet.edu/data-access-policy/.”

References
Data originally published in:

Gorman KB, Williams TD, Fraser WR (2014). Ecological sexual dimorphism and environmental variability within a community of Antarctic penguins (genus Pygoscelis). PLoS ONE 9(3):e90081. https://doi.org/10.1371/journal.pone.0090081

Artwork by @allison_horst
