DROP TABLE jobs;
DROP TABLE stock_levels;
DROP TABLE hourly_rates;


CREATE TABLE hourly_rates(
  id serial4 primary key,
  labour_type VARCHAR(255),
  rate INT4
);

CREATE TABLE stock_levels(
  id serial4 primary key,
  stock_type VARCHAR(255),
  stock_level INT4,
  meter_price INT4
);

CREATE TABLE jobs(
  id serial4 primary key,
  client VARCHAR(255),
  address VARCHAR(255),
  stock_id INT4 references stock_levels(id),
  stock_req INT4,
  hr_id INT4 references hourly_rates(id),
  hours_req INT4
);