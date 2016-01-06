DROP TABLE "dp_reconciled_$MONTH";

CREATE TABLE "dp_reconciled_$MONTH" (
  "id"                SERIAL PRIMARY KEY,
  "linked_account" VARCHAR(16),
  "day_number" VARCHAR(2),
  "product_code" VARCHAR(32),
  "usage_type" VARCHAR(32),
  "usage_type_param" VARCHAR(32),
  "operation" VARCHAR(32),
  "operation_param" VARCHAR(32),
  "availability_zone" VARCHAR(16),
  "reserved_instance" VARCHAR(1),
  "usage_start" VARCHAR(32),
  "usage_end" VARCHAR(32),
  "usage_quantity" VARCHAR(32),
  "blended_rate" VARCHAR(32),
  "blended_cost" VARCHAR(32),
  "unblended_rate" VARCHAR(32),
  "unblended_cost" VARCHAR(32),
  "reconciled_rate" VARCHAR(32),
  "reconciled_cost" VARCHAR(32),
  "resource_id" VARCHAR(255),
  "region_1" VARCHAR(16),
  "region_2" VARCHAR(16),
  "tags" VARCHAR(255),
  "description" VARCHAR(255),
  "subscription_id" VARCHAR(16),
  "pricing_plan_id" VARCHAR(16),
  "invoice_flag" VARCHAR(4),
  "credit_flag" VARCHAR(4),
  "datapipe_flag" VARCHAR(4),
  "estimated_flag" VARCHAR(4),
  "reconciled_flag" VARCHAR(4),
  "qrc_modified_flag" VARCHAR(4),
  "math_err_flag" VARCHAR(4),
  "orig_reserved_instance" VARCHAR(4),
  "orig_usage_quantity" VARCHAR(32),
  "orig_blended_rate" VARCHAR(32),
  "orig_blended_cost" VARCHAR(32),
  "orig_unblended_rate" VARCHAR(32),
  "orig_unblended_cost" VARCHAR(32),
  "reserved_instance_id" VARCHAR(64),
  "committed_instance_id" VARCHAR(32),
  "usage_month" VARCHAR(16),
  "payer_account_id" VARCHAR(32)
);

COPY dp_reconciled_$MONTH (linked_account, day_number, product_code, usage_type, usage_type_param, operation, operation_param, availability_zone, reserved_instance, usage_start, usage_end, usage_quantity, blended_rate, blended_cost, unblended_rate, unblended_cost, reconciled_rate, reconciled_cost, resource_id, region_1, region_2, tags, description, subscription_id, pricing_plan_id, invoice_flag, credit_flag, datapipe_flag, estimated_flag, reconciled_flag, qrc_modified_flag, math_err_flag, orig_reserved_instance, orig_usage_quantity, orig_blended_rate, orig_blended_cost, orig_unblended_rate, orig_unblended_cost, reserved_instance_id, committed_instance_id, usage_month, payer_account_id)
FROM '/mnt/cloudhealth/datapipe-hourly-reconciled-$MONTH.tsv' DELIMITER '	' CSV HEADER;

ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN usage_start TYPE TIMESTAMP USING to_timestamp(usage_start, 'YYYY-MM-DD HH24:MI:SS');
ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN usage_end TYPE TIMESTAMP USING to_timestamp(usage_end, 'YYYY-MM-DD HH24:MI:SS');
-- ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN unblended_rate TYPE DECIMAL USING unblended_rate::DECIMAL;
ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN unblended_cost TYPE DECIMAL USING unblended_cost::DECIMAL;
-- ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN blended_rate TYPE DECIMAL USING blended_rate::DECIMAL;
ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN reconciled_cost TYPE DECIMAL USING reconciled_cost::DECIMAL;
ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN blended_cost TYPE DECIMAL USING blended_cost::DECIMAL;
ALTER TABLE dp_reconciled_$MONTH ALTER COLUMN usage_quantity TYPE DECIMAL USING usage_quantity::DECIMAL;

CREATE INDEX ON dp_reconciled_$MONTH (product_code);
CREATE INDEX ON dp_reconciled_$MONTH (resource_id);
CREATE INDEX ON dp_reconciled_$MONTH (availability_zone);
CREATE INDEX ON dp_reconciled_$MONTH (usage_type);
CREATE INDEX ON dp_reconciled_$MONTH (operation);
CREATE INDEX ON dp_reconciled_$MONTH (usage_start);
CREATE INDEX ON dp_reconciled_$MONTH (linked_account);



