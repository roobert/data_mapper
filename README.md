
# DataMapper

## About

This module is a quick hack to get interesting device data into a database.

This module takes data collected by data_fetch_daemon and then translates it into objects using the network_data_translator module. If necessary, the data is first parsed by switch_data_parser.

Database operations are performed in a transaction - everytime this program is run the entire dataset is first deleted before the new data is written, this ensures no old data exists in the database.

## Example Usage

First create the database tables:

```
./schema.rb
```

Now you can periodically load data into the database:

```
while sleep 60; do ./load_data switch0 switch1 switch2 switch3; done
```
