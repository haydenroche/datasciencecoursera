###27.2.1 Exercises###

##Question 1##
#I ran through opening and running the chunks of script in a R Markdown. Everything works well.#

##Question 2##
#I ran utilized the Knit function in a R Markdown. Everything works well.#

##Question 3## 
#An R Notebook is an R Markdown document with chunks that can be executed independently and interactively, with output visible immediately beneath the input.#

##Question 4##
#They produce different outputs, mainly in the visual display of the plots. The YAML headers are slightly different with output showing "word_document", "pdf_document" and "html_document"#


###27.3.1 Exercises###

##Question 1##
#Task has been completed in a short r markdown example#

##Question 2##
  #1. Add a footnote = [^anything]
  #2. Add a horizontal rule = *** #
  #3. Add a block quote = > block quote #

##Question 3##
---
  title: "Diamond sizes"
author: "Hayden Roche"
date: "2016-08-25"
output: html_document
---
  
  ```{r setup, include=FALSE}
library(ggplot2)
library(dplyr)
smaller <- diamonds %>% 
  filter(carat <= 2.5)
```

#We have data about `r nrow(diamonds)` diamonds. Only 
#`r nrow(diamonds) - nrow(smaller)` are larger than
#2.5 carats. The distribution of the remainder is shown
#below:

```{r, echo = FALSE}
smaller %>% 
  ggplot(aes(carat)) + 
  geom_freqpoly(binwidth = 0.01)
```

## Observations
#The frequency polygon is showing large and irratic peaks at the lower end of the carat gamut. Then moving to the right we see much lower volume of diamonds. 


###27.4.7 Exercises###
##Question 1##
#Nothing to really show here# 

##Question 2##
```{r setup, include=FALSE}
library(ggplot2)
library(dplyr)

smaller <- diamonds %>% 
  filter(carat <= 2.5)
```

## R Markdown

#We have data about `r nrow(diamonds)` diamonds. Only 
#`r nrow(diamonds) - nrow(smaller)` are larger than
#2.5 carats. The distribution of the remainder is shown
#below:
  
  ```{r, echo = FALSE}
smaller %>% 
  ggplot(aes(carat)) + 
  geom_freqpoly(binwidth = 0.01)
```

## Including Tables

Describing diamonds and including a table that displays their attributes

```{r}
knitr::kable(
  diamonds[1:20, ], 
  caption = "A knitr kable."
)


##Question 3##
{r setup, include=FALSE}
library(ggplot2)
library(dplyr)

larger <- diamonds %>% 
  filter(carat >= 2.5)
```
  
  ```{r, echo = FALSE}
larger %>% 
  ggplot(aes(carat)) + 
  geom_freqpoly(binwidth = 0.01)

##Question 4##
```{r section d, cache=TRUE}
lubridate::now()
```

```{r section c, cache=TRUE}
lubridate::now()
```

```{r section b, cache=TRUE}
lubridate::now()
```
