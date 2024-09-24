Homework 1 Instructions
================

- <a href="#set-up" id="toc-set-up">Set Up</a>
  - <a href="#yaml" id="toc-yaml">YAML</a>
- <a href="#exercises" id="toc-exercises">Exercises</a>
  - <a href="#r---movies" id="toc-r---movies">R - Movies</a>
    - <a href="#q1" id="toc-q1">Q1</a>
    - <a href="#q2" id="toc-q2">Q2</a>
    - <a href="#q3" id="toc-q3">Q3</a>
    - <a href="#q4" id="toc-q4">Q4</a>
    - <a href="#q5" id="toc-q5">Q5</a>
    - <a href="#q6" id="toc-q6">Q6</a>
    - <a href="#python---jobs" id="toc-python---jobs">Python - Jobs</a>
    - <a href="#q1-1" id="toc-q1-1">Q1</a>
    - <a href="#q2-1" id="toc-q2-1">Q2</a>
    - <a href="#q3-1" id="toc-q3-1">Q3</a>
    - <a href="#q4-1" id="toc-q4-1">Q4</a>
- <a href="#final-steps" id="toc-final-steps">Final Steps</a>
- <a href="#grading" id="toc-grading">Grading</a>

In this homework, we will practice doing data science in both R and
Python. Using the tools introduced in the first few lectures in the
class, you will answer some important questions about movies and jobs.

Please remember that this homework is to be done individually!

<!-- Look at `hw2_instructions.html` for more information on the two data sets. -->

# Set Up

Clone the repo as you have done for the labs. Your repo will have a
`hw1.Rproj` file. Open this file in RStudio *first* before opening
`hw1.qmd`.

## YAML

Add an author (you) and date to the YAML (see lab 2 for an example).
Then render this document. Stage, commit, and push with a meaningful
commit message.

# Exercises

## R - Movies

For this part of the assignment, you should write all of your code in R.

We will be using the **tidyverse** set of packages for data
manipulation. We will also use the **lubridate** package for some work
with dates, so we are loading them here:

``` r
library(tidyverse)
library(lubridate)
```

For this part of the assignment, your task is to examine data about
movie profits over the last several years. A dataset (from
[www.the-numbers.com](www.the-numbers.com)) called `“movies.csv”` is in
the `data` folder of the repo. Here is a description of its contents:

| Variable            | Description                |
|:--------------------|:---------------------------|
| `release_date`      | month-day-year             |
| movie               | Movie title                |
| `production_budget` | Money spent to create film |
| `domestic_gross`    | Gross revenue from USA     |
| `worldwide_gross`   | Gross revenue worldwide    |
| `distributor`       | Distribution company       |
| `mpaa_rating`       | Age rating in US           |
| `genre`             | Film category              |

Import the data here:

``` r
# import data here
```

### Q1

How many movies are in this data set?

What is the range of years represented in the data? To answer this
question, create a new column (remember that in R to permanently add a
column, we need to overwrite the original object; we can use the
`mutate` function to add a column) called `year` that contains just the
year a movie was released (*hint*: lubridate has a helpful `mdy()`
function that can turn a month-day-year character string into a date,
and a `year` function to extract the year from a date[^1] ).

### Q2

In a new column called `net`, add together the domestic gross income and
the worldwide gross income for each movie, and then subtract the
production budget. Then sort the data frame base on this new column so
that the most profitable movies are at the top (**hint**: look at the
`arrange()` function; remember that in R you can access a function’s
helpfile using `?function_name`). What were the five most profitable
movies in this dataset?

### Q3

How many movies in this data set lost money (`net < 0`)?[^2]

### Q4

Let’s think about performance differently. What movies got the most
“bang for the buck” in the sense that they earned a high profit on each
dollar of their production budget? What five movies did best in these
terms? (“For every dollar we put into this movie, we got X dollars
back.”) Divide `net` by the production budget, save that value in a new
column called `rpd` for Return Per Dollar, and sort on that column to
answer this question.

### Q5

Create a data frame that summarizes the average net profit, average
production budget, and average return per dollar by genre (remember the
`group_by()` and `summarize()` functions!). Call this data frame
`genre_summary`.

After creating this data frame, the chunk below will make a nice looking
html table of `genre_summary` in the rendered output (if you hit the
green “run” button, it will also print that nice table below the chunk).
When you are reading to render, set `eval` to `true`.

After you have done this, look at [this
article](https://fivethirtyeight.com/features/scary-movies-are-the-best-investment-in-hollywood/),
and comment on whether your analysis seems to corroborate Hickey’s
result or not.

### Q6

Is there a consistent pattern to how MPAA ratings impact return per
dollar across the major distributors? What about within distributors?

To answer this question, calculate the average return per dollar by
movie rating and by distributor.

Produce a data frame that has MPAA rating as the first column, and then
six more columns, one for each of the six major distributors represented
in the data. Each cell in these columns will contain the `rpd` value for
a certain rating, distributor pair.

**Hint**: Look at the help file for the `pivot_wider` function and
remember that you can pipe (`%>%`) the results of the `summarize()`
function.

<div>

> **Don’t forget to commit!**
>
> If you have not been committing after finishing the questions in the R
> section, now would be a good time to commit!

</div>

### Python - Jobs

For this part of the assignment, you should write all of your code in
Python.

We will use the reticulate package to help us interface with Python
inside of our R session, so we load it here:

``` r
library(reticulate)
```

For this part of the assignment, you will turn your attention to the
data set `jobs.csv`. This is real data compiled by the Census Bureau and
the Bureau of Labor Statistics.
([Source](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-03-05),
but use the dataset in your repo’s `data` folder.) This dataset has
information about male and female earnings, by occupation and year. Here
is a description of the variables:

| Variable                | Description                                  |
|:------------------------|:---------------------------------------------|
| `year`                  | year                                         |
| `occupation`            | Specific occupation (most specific category) |
| `major_category`        | Broad job sector (8 levels)                  |
| `minor_category`        | More specific job sector (23 levels)         |
| `workers_male`          | Estimated male workers in this occupation    |
| `workers_female`        | Estimated female workers in this occupation  |
| `total_earnings`        | Estimated median earnings in this occupation |
| `total_earnings_male`   | Estimated male median earnings               |
| `total_earnings_female` | Estimated female median earnings             |

Import the data in the chunk below as a Pandas DataFrame called `jobs`:

``` python
#import data here
```

### Q1

What does each row of this data frame represent? Remember that in
RStudio, you can use the `View()` function (even in a Python chunk), to
look at a data frame.

How many unique occupations are contained in this data set? (**hint**:
look into the `.unique()` method for Pandas *Series*.)

How many years of occupational data are contained in this data set,
which years are they, and how many observations are there per year
(**hint**: look into the `.values_counts()` and `.sort_index()` methods
for Pandas *Series*)?

What do the previous two questions suggest, did the kinds of occupations
change at all during the years that this data set covers?[^3]

### Q2

Let’s investigate how the wage gap between male and female workers
varies by broad job (`major_category`) sector.

First, create a new column in the `jobs` data frame that is called
`f_pct_m`. Define this new variable as `total_earnings_female` divided
by `total_earnings_male`. Of course, this variable represents female
earnings as a proportion of male earnings for a particular occupation.

Second, calculate the *weighted* average of `f_pct_m` for each major job
category, where each occupation is weighted by `total_workers`. (The
idea is that sectors with more workers should count more heavily in our
average.) Store the result in a variable called `f_pct_m_wa`.

Calculating the weighted average (as opposed to the regular average) is
slightly more complicated with Pandas, so part of the code has been
provided to you in the chunk below. This chunk will also print a nice
table in the rendered output.

**Notes:**

1.  Before rendering, you must change the `eval` chunk option!
2.  You will have to install the **tabulate** package for Python to
    render this chunk. Remember that you can do so by opening a terminal
    and running `conda install tabulate`.

``` python
f_pct_m_wa = (
  # what object are we operating on here? Replace the ____ with its name
  ____
  # we are dropping NA (or NaN) in f_pct_m because or average will be mess up
  # otherwise
  .dropna(subset=["f_pct_m"])
  # we need to group by the categories we want
  ________________
  # this step does the aggregating
  .agg(f_pct_m_wa = (
    pd.NamedAgg(column = ________, # column that we want to take weighted avg of
    # we are using a lambda function because pandas by itself does not
    # have a weighted average function
    # and by default, agg functions in pandas can only operate on one 
    # column
    # you need to replace _______ with the column we will use as weights 
    aggfunc = lambda x: np.average(x, weights=jobs.loc[x.index, _________])
    # quick note: this isn't necessarily the most efficient way to do this
  )
  )
  )
)

# This will ensure that this data frame is printed out nicely
f_pct_m_wa.to_html()
```

What does this table tell us about the wage gap in these job sectors? In
which sector is it the highest? In which is it the lowest? Does it seem
to exist in all sectors?

### Q3

Is the wage gap smaller in occupations that are a higher proportion
female? It may be that there will be more female managers and executives
in these occupations, and they will work harder to address wage
differentials. This would suggest that the closer `f_pct_m` is to 1, the
higher the proportion *female* it should be (a positive correlation).

Create a variable (column) called `prop_female`, defined as the
proportion of workers in each occupation that are male. For instance, if
there were 45 male workers and 27 female workers in a particular
occupation, that occupation’s value for `prop_female` would be .375.[^4]

Then, calculate the correlation between `prop_female` and `f_pct_m`
(**hint**: look up the help file for the `.corr()` method).

Does this help us answer our question?

It is possible that major job category is a *confounding* variable, and
that Simpson’s Paradox is at play. Calculate the correlation by major
job category. Do this using a `for` loop that loops over unique values
of `major_category` and prints out the correlation between the two
variables in each job category.[^5]

Comment on these correlations. Does the major job category seem to
impact the relationship between `prop_female` and `f_pct_m`? For which
major job categories does it seem that the answer to our question is
“yes, the wage gap is smaller in occupations that are a higher
proportion female”? Are there any categories where the answer seems to
be no?

### Q4

Look only at occupations that fall into the Computer, Engineering, and
Science category. Do this by filtering for this category and making a
new data frame called `ces`.

We want to figure out which occupations in this category have the
highest and lowest proportion of female workers over the four years in
the data set. We currently have four observations for each occupation
(one from each year), but we want to compare occupations themselves, not
occupation-years. So we need to do some summarizing.

Calculate the regular average of `prop_female` across `year` for each
`occupation`. Use the template in the last slide of the Lecture 3 slides
(**hint** we don’t want the sum across the groups, but the mean).

Why do you think it makes more sense to take the simple average here,
compared to Q2, where we took the weighted average?

What are the occupations with the highest and lowest average proportion
female workers across the four years?

- **Hint**: For this part of the question, look at the `.idxmax()` and
  `.idxmin()` methods.

<div>

> **Don’t forget to commit!**

</div>

# Final Steps

When you have made your final edits, remember to render, stage the
changed files, then commit, and push to the repo.

When you are done with the homework (have made your last commit and
pushed it to your repo), make sure to *close* the project by going to
File \>\>\> Close Project. This will bring you back to the original
RStudio instance.

# Grading

Commenting your code is crucial for replicability and transparency
purposes. Remember to comment your code. You don’t get points for
commenting, but you will *lose* points for not commenting your code.

If a questions asks a question, you should answer it in narrative form
and not just rely on the code. You will be penalized otherwise.

Please suppress warnings and messages. You will *lose* points if you do
not suppress warnings and messages.

- Update YAML: 2 pts
- R Part
  - Q1: 3 pts
  - Q2: 3 pts
  - Q3: 2 pts
  - Q4: 3 pts
  - Q5: 4 pts
  - Q6: 4 pts
- Python Part
  - Q1: 4 pts
  - Q2: 4 pts
  - Q3: 7 pts
  - Q4: 5 pts
- Workflow - includes making sufficient commits(i.e. not just one after
  finishing)): 4 pts

Total: 43

[^1]: This is not the only way to extract the date. If you can think of
    another way, feel free to use that.

[^2]: There are some recent movies, like Aquaman, that look like
    “losers” in this dataset because they had just been released. They
    probably continued to make money after the dataset was published.

[^3]: You may ask why this matters. It’s always important to get a sense
    of your data and to see whether categorizations may have changed
    over the time span it covers, if it is a time series.

[^4]: Unfortunately the data only has information on whether workers
    identified as male or female; we do not have information on workers
    of other gender identities.

[^5]: Yes, this may not be the most efficient, but it’s a good way to
    practice using `for` loops.
