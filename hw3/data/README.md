Data for Homework 3 - Correlated Variables and Regularization and
Deforestation
================

The four deforestation data sets are from TidyTuesday
[here](https://github.com/rfordatascience/tidytuesday/blob/master/data/2021/2021-04-06/readme.md).
You can find the associated codebooks at that link.

V-Dem data available through the `vdemdata` R package
[here](https://github.com/vdeminstitute/vdemdata).

### Codebook for `vdem`

<div class="cell-output-display">

| Variables         | Description                                                                        | Value                                                                                                                                                                                          |
|:------------------|:-----------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `country_name`    | Country name                                                                       | Character                                                                                                                                                                                      |
| `country_text_id` | Three letter country abbreviation                                                  | Character                                                                                                                                                                                      |
| `year`            | Year                                                                               | Numeric                                                                                                                                                                                        |
| `v2x_polyarchy`   | Electoral democracy index. Measure of how democratic a country is.                 | Numeric                                                                                                                                                                                        |
| `v2x_delibdem`    | Deliberative democracy index. Measure of how deliberative the political system is. | Numeric                                                                                                                                                                                        |
| `e_gdppc`         | GDP per capita                                                                     | Numeric                                                                                                                                                                                        |
| `e_pop`           | Population                                                                         | Numeric                                                                                                                                                                                        |
| `e_area`          | Area in square kilometers                                                          | Numeric                                                                                                                                                                                        |
| `e_regionpol_6C`  | Geopolitical region (6 categories version)                                         | 1 = Eastern Europe and Central Asia, 2 = Latin America and the Caribbean, 3 = Middle East and North Africa, 4 = Sub-Saharan Africa, 5 = Western Europe and North America, 6 = Asia and Pacific |

</div>
