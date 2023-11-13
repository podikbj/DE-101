

CREATE TABLE `customers_dim` (
  `customer_id` VARCHAR(8) NOT NULL,
  `customer_name` VARCHAR(22) NOT NULL,
  `segment` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `calendar_dim` (
  `date` DATE NOT NULL,
  `day` INTEGER NOT NULL,
  `week` INTEGER NOT NULL,
  `month` INTEGER NOT NULL,
  `quarter` INTEGER NOT NULL,
  `year` INTEGER NOT NULL,
  PRIMARY KEY (`date`)
);

CREATE TABLE `products_dim` (
  `product_id` VARCHAR(15) NOT NULL,
  `product_name` VARCHAR(127) NOT NULL,
  `category` VARCHAR(15) NOT NULL,
  `subcategory` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE `orders_dim` (
  `order_id` VARCHAR(14) NOT NULL,
  `order_date` DATE NOT NULL,
  `ship_date` DATE NOT NULL,
  `ship_mode` VARCHAR(14) NOT NULL,
  `returned` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`order_date`) REFERENCES `calendar`(`date`),
  FOREIGN KEY (`ship_date`) REFERENCES `calendar`(`date`)
);

CREATE TABLE `geography_dim` (
  `geography_id` INTEGER NOT NULL,
  `country` VARCHAR(13) NOT NULL,
  `city` VARCHAR(17) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `postal_code` INTEGER,
  `region` VARCHAR(7) NOT NULL,
  `person` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`geography_id`)
);

CREATE TABLE `sales_fact` (
  `row_id` INTEGER NOT NULL,
  `sales_amount`  NUMERIC(4,2) NOT NULL,
  `profit`  NUMERIC(4,2) NOT NULL,
  `quantity` INTEGER NOT NULL,
  `discount`  NUMERIC(4,2) NOT NULL,
  `order_id` VARCHAR(14) NOT NULL,
  `product_id` VARCHAR(14) NOT NULL,
  `geography_id` INTEGER NOT NULL,
  `date` DATE NOT NULL,
  `customer_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`row_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`),
  FOREIGN KEY (`date`) REFERENCES `calendar`(`date`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`),
  FOREIGN KEY (`geography_id`) REFERENCES `geography`(`geography_id`)
);

CREATE INDEX idx_salesfct_customer_id 
ON sales_fact(customer_id);

CREATE INDEX idx_salesfct_date 
ON sales_fact(date);

CREATE INDEX idx_salesfct_product_id 
ON sales_fact(product_id);

CREATE INDEX idx_salesfct_order_id 
ON sales_fact(order_id);

CREATE INDEX idx_salesfct_geography_id 
ON sales_fact(geography_id);