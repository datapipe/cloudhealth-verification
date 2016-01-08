#!/bin/bash

export MONTH="2015-10"

envsubst < "reload_dp_dbr.sql.tpl" | psql -d aws_usage
