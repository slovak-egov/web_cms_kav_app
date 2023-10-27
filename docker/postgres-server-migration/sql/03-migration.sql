-- create db structure

DROP TABLE IF EXISTS "enum_enum";
CREATE TABLE "public"."enum_enum"
(
    "enum_id"     character varying(36),
    "web_site_id" character varying(36),
    "enum_code"   text,
    "description" text,
    "modul"       text,
    "create_date" text,
    "created_by"  text,
    "edit_date"   text,
    "edited_by"   text,
    "is_active"   text
) WITH (oids = false);

CREATE INDEX "enum_enum_enum_id" ON "public"."enum_enum" USING btree ("enum_id");
CREATE INDEX "enum_enum_web_site_id" ON "public"."enum_enum" USING btree ("web_site_id");

DROP TABLE IF EXISTS "enum_enum_value";
CREATE TABLE "public"."enum_enum_value"
(
    "enum_value_id" character varying(36),
    "enum_id"       character varying(36),
    "web_site_id"   character varying(36),
    "code"          text,
    "value"         text,
    "Order"         text,
    "create_date"   text,
    "created_by"    text,
    "edit_date"     text,
    "edited_by"     text
) WITH (oids = false);

CREATE INDEX "enum_enum_value_enum_id" ON "public"."enum_enum_value" USING btree ("enum_id");
CREATE INDEX "enum_enum_value_enum_value_id" ON "public"."enum_enum_value" USING btree ("enum_value_id");
CREATE INDEX "enum_enum_value_web_site_id" ON "public"."enum_enum_value" USING btree ("web_site_id");


DROP TABLE IF EXISTS "enum_enum_value_language";
CREATE TABLE "public"."enum_enum_value_language"
(
    "enum_value_id" character varying(36),
    "language_id"   character varying(36),
    "display_value" text,
    "create_date"   text,
    "created_by"    text,
    "edit_date"     text,
    "edited_by"     text,
    "is_active"     text
) WITH (oids = false);

CREATE INDEX "enum_enum_value_language_enum_value_id" ON "public"."enum_enum_value_language" USING btree ("enum_value_id");
CREATE INDEX "enum_enum_value_language_language_id" ON "public"."enum_enum_value_language" USING btree ("language_id");


DROP TABLE IF EXISTS "info_info_content";
CREATE TABLE "public"."info_info_content"
(
    "info_content_id"        character varying(36) NOT NULL,
    "parent_info_content_id" character varying(36),
    "category_id"            character varying(36),
    "web_site_id"            character varying(36),
    "type_id"                text,
    "source_type_id"         text,
    "visitor_type_id"        text,
    "create_date"            text,
    "created_by"             text,
    "edit_date"              text,
    "edited_by"              text,
    "bureau_iam_id"          text,
    "position"               text,
    "metais_id"              text,
    CONSTRAINT "info_info_content_info_content_id" PRIMARY KEY ("info_content_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "info_info_content_language";
CREATE TABLE "public"."info_info_content_language"
(
    "info_content_version_id" character varying(36),
    "language_id"             character varying(36),
    "name"                    text,
    "content"                 text,
    "description"             text,
    "tag"                     text,
    "seo_url"                 text,
    "html_title"              text,
    "html_description"        text,
    "html_keywords"           text,
    "html_classification"     text,
    "responsibility_name"     text,
    "responsibility_email"    text,
    "responsibility_phone"    text,
    "is_active"               text,
    "created_by"              text,
    "create_date"             text,
    "edited_by"               text,
    "edit_date"               text,
    "confirmed_by"            text,
    "confirm_date"            text,
    "edited_by_external"      text
) WITH (oids = false);

CREATE INDEX "info_info_content_language_info_content_version_id" ON "public"."info_info_content_language" USING btree ("info_content_version_id");


DROP TABLE IF EXISTS "info_info_content_version";
CREATE TABLE "public"."info_info_content_version"
(
    "info_content_version_id" character varying(36),
    "info_content_id"         character varying(36),
    "version"                 text,
    "is_rating"               text,
    "is_comment"              text,
    "date_time_from"          text,
    "date_time_to"            text,
    "status_id"               text,
    "weight"                  text,
    "create_date"             text,
    "created_by"              text,
    "edit_date"               text,
    "edited_by"               text,
    "picture_path"            text
) WITH (oids = false);

CREATE INDEX "info_info_content_version_info_content_id" ON "public"."info_info_content_version" USING btree ("info_content_id");
CREATE INDEX "info_info_content_version_info_content_version_id" ON "public"."info_info_content_version" USING btree ("info_content_version_id");


DROP TABLE IF EXISTS "info_life_event";
CREATE TABLE "public"."info_life_event"
(
    "life_event_id"           character varying(36),
    "info_content_version_id" character varying(36),
    "create_date"             text,
    "created_by"              text,
    "edit_date"               text,
    "edited_by"               text
) WITH (oids = false);

CREATE INDEX "info_life_event_info_content_version_id" ON "public"."info_life_event" USING btree ("info_content_version_id");
CREATE INDEX "info_life_event_life_event_id" ON "public"."info_life_event" USING btree ("life_event_id");

-- import CSV into tables

COPY enum_enum
    FROM '/arnia/enum_Enum.csv'
    DELIMITER '|'
    CSV HEADER;

COPY enum_enum_value
    FROM '/arnia/enum_EnumValue.csv'
    DELIMITER '|'
    CSV HEADER;

COPY enum_enum_value_language
    FROM '/arnia/enum_EnumValue_Language.csv'
    DELIMITER '|'
    CSV HEADER;

COPY info_info_content
    FROM '/arnia/info_InfoContent.csv'
    DELIMITER '|'
    CSV HEADER;

COPY info_info_content_language
    FROM '/arnia/info_InfoContent_Language.csv'
    DELIMITER '|'
    CSV HEADER;

COPY info_info_content_version
    FROM '/arnia/info_InfoContentVersion.csv'
    DELIMITER '|'
    CSV HEADER;

COPY info_life_event
    FROM '/arnia/info_LifeEvent.csv'
    DELIMITER '|'
    CSV HEADER;
