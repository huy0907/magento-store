[33mDescription:[39m
  Dumps database with mysqldump cli client

[33mUsage:[39m
  db:dump [options] [--] [<filename>]

[33mArguments:[39m
  [32mfilename[39m                                       Dump filename

[33mOptions:[39m
  [32m    --connection=CONNECTION[39m                    Select DB connection type for Magento configurations with several databases[33m [default: "default"][39m
  [32m-t, --add-time[=ADD-TIME][39m                      Append or prepend a timestamp to filename if a filename is provided. Possible values are "suffix", "prefix" or "no".[33m [default: ""][39m
  [32m-c, --compression=COMPRESSION[39m                  Compress the dump file using one of the supported algorithms
  [32m    --only-command[39m                             Print only mysqldump command. Do not execute
  [32m    --print-only-filename[39m                      Execute and prints no output except the dump filename
  [32m    --dry-run[39m                                  Do everything but the actual dump
  [32m    --set-gtid-purged-off[39m                      add --set-gtid-purged=OFF
  [32m    --no-single-transaction[39m                    Do not use single-transaction (not recommended, this is blocking)
  [32m    --human-readable[39m                           Use a single insert with column names per row. Useful to track database differences. Use db:import --optimize for speeding up the import.
  [32m    --git-friendly[39m                             Use one insert statement, but with line breaks instead of separate insert statements. Similar to --human-readable, but you wont need to use --optimize to speed up the import.
  [32m    --add-routines[39m                             Include stored routines in dump (procedures & functions)
  [32m    --no-tablespaces[39m                           Use this option if you want to create a dump without having the PROCESS privilege
  [32m    --stdout[39m                                   Dump to stdout
  [32m-s, --strip[=STRIP][39m                            Tables to strip (dump only structure of those tables)
  [32m-e, --exclude[=EXCLUDE][39m                        Tables to exclude entirely from the dump (including structure)
  [32m-i, --include[=INCLUDE][39m                        Tables to include entirely in the dump (including structure)
  [32m-f, --force[39m                                    Do not prompt if all options are defined
  [32m    --keep-column-statistics[39m                   Keeps the Column Statistics table in SQL dump
  [32m-h, --help[39m                                     Display this help message
  [32m-q, --quiet[39m                                    Do not output any message
  [32m-V, --version[39m                                  Display this application version
  [32m    --ansi[39m                                     Force ANSI output
  [32m    --no-ansi[39m                                  Disable ANSI output
  [32m-n, --no-interaction[39m                           Do not ask any interactive question
  [32m    --root-dir[=ROOT-DIR][39m                      Force magento root dir. No auto detection
  [32m    --skip-config[39m                              Do not load any custom config.
  [32m    --skip-root-check[39m                          Do not check if n98-magerun runs as root
  [32m    --skip-core-commands[=SKIP-CORE-COMMANDS][39m  Do not include Magento 2 core commands
  [32m    --skip-magento-compatibility-check[39m         Do not check for Magento version compatibility
  [32m-v|vv|vvv, --verbose[39m                           Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug

[33mHelp:[39m
  Dumps configured magento database with `mysqldump`. You must have installed
  the MySQL client tools.
  
  On debian systems run `apt-get install mysql-client` to do that.
  
  The command reads app/etc/env.php to find the correct settings.
  
  See it in action: http://youtu.be/ttjZHY6vThs
  
  - If you like to prepend a timestamp to the dump name the --add-time option
    can be used.
  
  - The command comes with a compression function. Add i.e. `--compression=gz`
    to dump directly in gzip compressed file.
  
  
  [33mCompression option[39m
   Supported compression: gzip
   The gzip cli tool has to be installed.
   Additionally, for data-to-csv option tar cli tool has to be installed too.
  
  [33mStrip option[39m
   If you like to skip data of some tables you can use the --strip option.
   The strip option creates only the structure of the defined tables and
   forces `mysqldump` to skip the data.
  
   Separate each table to strip by a space.
   You can use wildcards like * and ? in the table names to strip multiple
   tables. In addition you can specify pre-defined table groups, that start
   with an @ symbol.
  
   Example: "dataflow_batch_export unimportant_module_* @log"
  
      $ n98-magerun2.phar db:dump --strip="@stripped"
  
  [33mAvailable Table Groups[39m
   [32m@admin[39m               Admin tables.
   [32m@oauth[39m               OAuth tables.
   [32m@log[39m                 Log tables.
   [32m@sessions[39m            Database session tables.
   [32m@stripped[39m            Standard definition for a stripped dump (logs, sessions,
                        dotmailer).
   [32m@sales[39m               Sales data (orders, invoices, creditmemos etc).
   [32m@quotes[39m              Cart (quote) data.
   [32m@customers[39m           Customer data - Should not be used without @sales.
   [32m@trade[39m               Current trade data (customers and orders). You usally do
                        not want those in developer systems..
   [32m@development[39m         Removes logs and trade data so developers do not have to
                        work with real customer data.
   [32m@ee_changelog[39m        Changelog tables of new indexer since EE 1.13.
   [32m@search[39m              Search related tables.
   [32m@idx[39m                 Tables with _idx suffix.
   [32m@dotmailer[39m           Dotmailer tables.
   [32m@2fa[39m                 Two Factor Auth tables.
   [32m@newrelic_reporting[39m  New Relic reporting tables.
   [32m@aggregated[39m          Aggregated tables.
   [32m@replica[39m             Replica tables.
   [32m@klarna[39m              Klarna tables.
   [32m@temp[39m                Temporary indexer tables.
  
  Extended: https://github.com/netz98/n98-magerun/wiki/Stripped-Database-Dumps
