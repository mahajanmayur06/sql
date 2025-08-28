create database msci;
CREATE TABLE saas (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price_per_second DECIMAL(10, 2)
);

CREATE TABLE saas_usage (
  id INT PRIMARY KEY AUTO_INCREMENT,
  service_id INT,
  total_usage INT, -- in seconds
  FOREIGN KEY (service_id) REFERENCES saas(id)
);

CREATE TABLE paas (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price_per_second DECIMAL(10, 2)
);

CREATE TABLE paas_usage (
  id INT PRIMARY KEY AUTO_INCREMENT,
  service_id INT,
  total_usage INT, -- in seconds
  FOREIGN KEY (service_id) REFERENCES paas(id)
);

INSERT INTO saas (id, name, price_per_second) VALUES
(1, 'Salesforce', 0.05),
(2, 'Google Workspace', 0.03),
(3, 'Microsoft 365', 0.04);
INSERT INTO saas_usage (service_id, total_usage) VALUES
(1, 3600),   -- 1 hour
(1, 1800),   -- 30 minutes
(2, 2700),   -- 45 minutes
(3, 5400);   -- 1.5 hours
INSERT INTO paas (id, name, price_per_second) VALUES
(1, 'Heroku', 0.08),

(2, 'AWS Lambda', 0.10),
(3, 'Google App Engine', 0.09);

INSERT INTO paas_usage (service_id, total_usage) VALUES
(1, 3000),
(2, 4000),
(2, 2000),
(3, 1000);

SELECT
	  'SaaS' AS service_type,
	  s.name AS service_name,
	  SEC_TO_TIME(SUM(su.total_usage)) AS total_usage,
	  CONCAT('$', FORMAT(SUM(su.total_usage * s.price_per_second), 2)) AS total_price
FROM
	saas s
JOIN
	saas_usage su ON s.id = su.service_id
GROUP BY
	s.id, s.name

UNION ALL

SELECT
	  'PaaS' AS service_type,
	  p.name AS service_name,
	  SEC_TO_TIME(SUM(pu.total_usage)) AS total_usage,
	  CONCAT('$', FORMAT(SUM(pu.total_usage * p.price_per_second), 2)) AS total_price
FROM
	paas p
JOIN
	paas_usage pu ON p.id = pu.service_id
GROUP BY
	p.id, p.name;