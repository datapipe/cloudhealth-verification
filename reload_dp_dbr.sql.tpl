DROP TABLE "dp_dbr_$MONTH";

CREATE TABLE "dp_dbr_$MONTH" (
  "id"                SERIAL PRIMARY KEY,
  "invoice_id"        VARCHAR(16),
  "payer_account_id"  VARCHAR(12),
  "linked_account_id" VARCHAR(12),
  "record_type"       VARCHAR(16),
  "record_id"         VARCHAR(32),
  "product_name"      VARCHAR(48),
  "rate_id"           VARCHAR(12),
  "subscription_id"   VARCHAR(12),
  "pricing_plan_id"   VARCHAR(12),
  "usage_type"        VARCHAR(64),
  "operation"         VARCHAR(64),
  "availability_zone" VARCHAR(24),
  "reserved_instance" VARCHAR(1),
  "item_description"  VARCHAR(512),
  "usage_start_date"  VARCHAR(32),
  "usage_end_date"    VARCHAR(32),
  "usage_quantity"    VARCHAR(32),
  "blended_rate"      VARCHAR(32),
  "blended_cost"      VARCHAR(32),
  "unblended_rate"    VARCHAR(32),
  "unblended_cost"    VARCHAR(32),
  "resource_id"       VARCHAR(255),
  "tag1"              VARCHAR(255),
  "tag2"              VARCHAR(255),
  "tag3"              VARCHAR(255),
  "tag4"              VARCHAR(255),
  "tag5"              VARCHAR(255),
  "tag6"              VARCHAR(255),
  "tag7"              VARCHAR(255)

);

COPY dp_dbr_$MONTH (invoice_id, payer_account_id, linked_account_id, record_type, record_id, product_name, rate_id, subscription_id, pricing_plan_id, usage_type, operation, availability_zone, reserved_instance, item_description, usage_start_date, usage_end_date, usage_quantity, blended_rate, blended_cost, unblended_rate, unblended_cost, resource_id, tag1, tag2, tag3, tag4, tag5, tag6, tag7)
FROM '/mnt/cloudhealth/181239768896-aws-billing-detailed-line-items-with-resources-and-tags-$MONTH-cloudhealth-only.csv' CSV HEADER;

ALTER TABLE dp_dbr_$MONTH ALTER COLUMN usage_start_date TYPE TIMESTAMP USING to_timestamp(usage_start_date, 'YYYY-MM-DD HH24:MI:SS');
ALTER TABLE dp_dbr_$MONTH ALTER COLUMN usage_end_date TYPE TIMESTAMP USING to_timestamp(usage_end_date, 'YYYY-MM-DD HH24:MI:SS');
-- ALTER TABLE dp_dbr_$MONTH ALTER COLUMN unblended_rate TYPE DECIMAL USING unblended_rate::DECIMAL;
ALTER TABLE dp_dbr_$MONTH ALTER COLUMN unblended_cost TYPE DECIMAL USING unblended_cost::DECIMAL;
-- ALTER TABLE dp_dbr_$MONTH ALTER COLUMN blended_rate TYPE DECIMAL USING blended_rate::DECIMAL;
ALTER TABLE dp_dbr_$MONTH ALTER COLUMN blended_cost TYPE DECIMAL USING blended_cost::DECIMAL;
ALTER TABLE dp_dbr_$MONTH ALTER COLUMN usage_quantity TYPE DECIMAL USING usage_quantity::DECIMAL;

CREATE INDEX ON dp_dbr_$MONTH (product_name);
CREATE INDEX ON dp_dbr_$MONTH (resource_id);
CREATE INDEX ON dp_dbr_$MONTH (availability_zone);
CREATE INDEX ON dp_dbr_$MONTH (usage_type);
CREATE INDEX ON dp_dbr_$MONTH (operation);
CREATE INDEX ON dp_dbr_$MONTH (usage_start_date);
CREATE INDEX ON dp_dbr_$MONTH (linked_account_id);



