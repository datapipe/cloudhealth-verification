#!/bin/bash

export MONTH="2015-10"

envsubst < "reload_ch_dbrs.sql.tpl" | psql -d aws_usage
