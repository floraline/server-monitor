# server-monitor
A set of scripts to display simple system metrics on the web

### 1. Add or edit scripts in `collect.d/` to configure what is collected

  The argument passed to `tail` here determines the number of entries kept in the raw data. Multiply this number by your crontab interval to get the total span of time that will be shown on the graph.
  
### 2. Add or edit plotfiles in `plot/` to configure the appearance of your graphs

### 3. Edit `render-all.sh` to configure what plots are used to generate graphs

### 4. Point crontab at `tick.sh`
