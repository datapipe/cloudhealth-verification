#!/bin/bash

export MONTH="2015-11"

envsubst < "reload_dp_dbr.sql.tpl" | psql -d aws_usage
