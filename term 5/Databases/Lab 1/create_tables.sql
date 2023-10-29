DROP TABLE IF EXISTS brightness CASCADE;
DROP TABLE IF EXISTS color CASCADE;
DROP TABLE IF EXISTS place CASCADE;
DROP TABLE IF EXISTS flash CASCADE;
DROP TABLE IF EXISTS day_period CASCADE;
DROP TABLE IF EXISTS landscape CASCADE;
DROP TABLE IF EXISTS cover CASCADE;
DROP TABLE IF EXISTS effect CASCADE;
DROP TABLE IF EXISTS lake CASCADE;
DROP TABLE IF EXISTS lake_landscape CASCADE;


CREATE TABLE brightness(
	brightness_id serial PRIMARY KEY,
	val text NOT NULL
);

CREATE TABLE color(
	color_id serial PRIMARY KEY,
	val text NOT NULL
);

CREATE TABLE place(
	place_id serial PRIMARY KEY,
	val text NOT NULL
);

CREATE TABLE flash(
	flash_id serial PRIMARY KEY,
	brightness_id int REFERENCES brightness(brightness_id),
	color_id int REFERENCES color(color_id),
	place_id int REFERENCES place(place_id)
);

CREATE TABLE day_period(
	day_period_id serial PRIMARY KEY,
	val text NOT NULL
);

CREATE TABLE landscape(
	landscape_id serial PRIMARY KEY,
	day_period_id int REFERENCES day_period(day_period_id)
);

CREATE TABLE cover(
	cover_id serial PRIMARY KEY,
	val text NOT NULL,
	landscape_id int REFERENCES landscape(landscape_id)
);

CREATE TABLE effect(
	effect_id serial PRIMARY KEY,
	val text NOT NULL
);

CREATE TABLE lake(
	lake_id serial PRIMARY KEY,
	color_id int REFERENCES color(color_id),
	effect_id int REFERENCES effect(effect_id),
	place_id int REFERENCES place(place_id),
	creature_time time
);

CREATE TABLE lake_landscape(
	lake_id int REFERENCES lake(lake_id),
	landscape_id int REFERENCES landscape(landscape_id),
	PRIMARY KEY(lake_id, landscape_id)
);