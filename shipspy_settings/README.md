# Processing with shipspy

The standardisation of the data sets was done with the [shipspy](https://github.com/shipspy-development/shipspy) package. This folder contains the used settings.

* `PS147_sections.txt`: specifications of the time periods (total campaign and sections)
* `instrument_variables.yaml`: renaming dictionary for all variables, variable attributes (long_name, standard_name, units, instrument, comment,...)
* `PS147_instrument_global_attrs.yaml`: global attributes for the instrument data set

## Reprocessing the PS147 campaign data

To reprocess the data with shipspy and pysonde run `../reprocess.sh`.