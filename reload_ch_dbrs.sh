#!/bin/bash

export MONTH="2015-11"

envsubst < "reload_ch_dbrs.sql" | psql -d aws_usage
