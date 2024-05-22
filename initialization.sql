-- initialize FACT, DIMENSION, AND DATAMART, STAGING TABLE

DROP TABLE IF EXISTS PROJECT2.STAGING.CATEGORIES;
CREATE OR REPLACE TABLE PROJECT2.STAGING.CATEGORIES (
	CATEGORYID NUMBER(38,0),
	CATEGORYNAME VARCHAR,
	DESCRIPTION VARCHAR,
	PICTURE FLOAT
);

DROP TABLE IF EXISTS PROJECT2.STAGING.COUNTRIES;
CREATE OR REPLACE TABLE PROJECT2.STAGING.COUNTRIES (
	COUNTRYNAME VARCHAR,
	ALPHA2CODE VARCHAR,
	ALPHA3CODE VARCHAR,
	COUNTRYID NUMBER(38,0)
);

DROP TABLE IF EXISTS PROJECT2.STAGING.CUSTOMERS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.CUSTOMERS (
	CUSTOMERID VARCHAR,
	COMPANYNAME VARCHAR,
	CONTACTNAME VARCHAR,
	CONTACTTITLE VARCHAR,
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	PHONE VARCHAR,
	FAX VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.EMPLOYEES;
CREATE OR REPLACE TABLE PROJECT2.STAGING.EMPLOYEES (
	EMPLOYEEID NUMBER(38,0),
	LASTNAME VARCHAR,
	FIRSTNAME VARCHAR,
	TITLE VARCHAR,
	TITLEOFCOURTESY VARCHAR,
	BIRTHDATE TIMESTAMP_NTZ(9),
	HIREDATE TIMESTAMP_NTZ(9),
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	HOMEPHONE VARCHAR,
	EXTENSION NUMBER(38,0),
	PHOTO FLOAT,
	NOTES VARCHAR,
	REPORTSTO VARCHAR,
	PHOTOPATH VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.EMPLOYEE_TERRITORIES ;
CREATE OR REPLACE TABLE PROJECT2.STAGING.EMPLOYEE_TERRITORIES (
	EMPLOYEEID NUMBER(38,0),
	TERRITORYID NUMBER(38,0)
);

DROP TABLE IF EXISTS PROJECT2.STAGING.ORDERS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.ORDERS (
	ORDERID NUMBER(38,0),
	CUSTOMERID VARCHAR,
	EMPLOYEEID NUMBER(38,0),
	ORDERDATE TIMESTAMP_NTZ(9),
	REQUIREDDATE TIMESTAMP_NTZ(9),
	SHIPPEDDATE VARCHAR,
	SHIPVIA NUMBER(38,0),
	FREIGHT NUMBER(38,2),
	SHIPNAME VARCHAR,
	SHIPADDRESS VARCHAR,
	SHIPCITY VARCHAR,
	SHIPREGION VARCHAR,
	SHIPPOSTALCODE VARCHAR,
	SHIPCOUNTRY VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.ORDER_DETAILS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.ORDER_DETAILS (
	ORDERID NUMBER(38,0),
	PRODUCTID NUMBER(38,0),
	UNITPRICE NUMBER(38,2),
	QUANTITY NUMBER(38,0),
	DISCOUNT NUMBER(38,2)
);

DROP TABLE IF EXISTS PROJECT2.STAGING.PRODUCTS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.PRODUCTS (
	PRODUCTID NUMBER(38,0),
	PRODUCTNAME VARCHAR,
	SUPPLIERID NUMBER(38,0),
	CATEGORYID NUMBER(38,0),
	QUANTITYPERUNIT VARCHAR,
	UNITPRICE NUMBER(38,2),
	UNITSINSTOCK NUMBER(38,0),
	UNITSONORDER NUMBER(38,0),
	REORDERLEVEL NUMBER(38,0),
	DISCONTINUED NUMBER(38,0)
);

DROP TABLE IF EXISTS PROJECT2.STAGING.REGIONS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.REGIONS (
	REGIONID NUMBER(38,0),
	REGIONDESCRIPTION VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.SHIPPERS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.SHIPPERS (
	SHIPPERID NUMBER(38,0),
	COMPANYNAME VARCHAR,
	PHONE VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.SUPPLIERS;
CREATE OR REPLACE TABLE PROJECT2.STAGING.SUPPLIERS (
	SUPPLIERID NUMBER(38,0),
	COMPANYNAME VARCHAR,
	CONTACTNAME VARCHAR,
	CONTACTTITLE VARCHAR,
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	PHONE VARCHAR,
	FAX VARCHAR,
	HOMEPAGE VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.STAGING.TERRITORIES;
CREATE OR REPLACE TABLE PROJECT2.STAGING.TERRITORIES (
	TERRITORYID NUMBER(38,0),
	TERRITORYDESCRIPTION VARCHAR,
	REGIONID NUMBER(38,0)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.PRODUCTS_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.PRODUCTS_DIM (
	PRODUCTID NUMBER(38,0),
	PRODUCTNAME VARCHAR,
	QUANTITYPERUNIT VARCHAR,
	UNITPRICE NUMBER(38,2),
	UNITSINSTOCK NUMBER(38,0),
	UNITSONORDER NUMBER(38,0),
	REORDERLEVEL NUMBER(38,0),
	DISCONTINUED NUMBER(38,0),
    PRIMARY KEY (PRODUCTID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.CATEGORIES_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.CATEGORIES_DIM (
	CATEGORYID NUMBER(38,0),
	CATEGORYNAME VARCHAR,
	DESCRIPTION VARCHAR,
	PICTURE VARCHAR,
    PRIMARY KEY (CATEGORYID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.SUPPLIERS_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.SUPPLIERS_DIM (
	SUPPLIERID NUMBER(38,0),
	COMPANYNAME VARCHAR,
	CONTACTNAME VARCHAR,
	CONTACTTITLE VARCHAR,
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	PHONE VARCHAR,
	FAX VARCHAR,
	HOMEPAGE VARCHAR,
    PRIMARY KEY (SUPPLIERID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.EMPLOYEE_TERRITORIES_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.EMPLOYEE_TERRITORIES_DIM (
	EMPLOYEEID NUMBER(38,0),
	TERRITORYID NUMBER(38,0),
    PRIMARY KEY (EMPLOYEEID,TERRITORYID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.REGIONS_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.REGIONS_DIM (
	REGIONID NUMBER(38,0),
	REGIONDESCRIPTION VARCHAR,
    PRIMARY KEY(REGIONID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.TERRITORIES_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.TERRITORIES_DIM (
	TERRITORYID NUMBER(38,0),
	TERRITORYDESCRIPTION VARCHAR,
	REGIONID NUMBER(38,0),
    PRIMARY KEY(TERRITORYID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.ORDERSHIP_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.ORDERSHIP_DIM (
	ORDERID NUMBER(38,0),
	SHIPVIA NUMBER(38,0),
	FREIGHT NUMBER(38,2),
	SHIPNAME VARCHAR,
	SHIPADDRESS VARCHAR,
	SHIPCITY VARCHAR,
	SHIPREGION VARCHAR,
	SHIPPOSTALCODE VARCHAR,
	SHIPCOUNTRY VARCHAR,
    PRIMARY KEY(ORDERID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.CUSTOMERS_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.CUSTOMERS_DIM (
	CUSTOMERID VARCHAR,
	COMPANYNAME VARCHAR,
	CONTACTNAME VARCHAR,
	CONTACTTITLE VARCHAR,
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	PHONE VARCHAR,
	FAX VARCHAR,
    PRIMARY KEY(CUSTOMERID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.COUNTRIES_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.COUNTRIES_DIM (
	COUNTRYID NUMBER(38,0),
	COUNTRYNAME VARCHAR,
    ALPHA2CODE VARCHAR,
    ALPHA3CODE VARCHAR,
    PRIMARY KEY(COUNTRYID)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.EMPLOYEES_DIM;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.EMPLOYEES_DIM (
	EMPLOYEEID NUMBER(38,0),
	LASTNAME VARCHAR,
	FIRSTNAME VARCHAR,
	TITLE VARCHAR,
	TITLEOFCOURTESY VARCHAR,
	BIRTHDATE TIMESTAMP_NTZ(9),
	HIREDATE TIMESTAMP_NTZ(9),
	ADDRESS VARCHAR,
	CITY VARCHAR,
	REGION VARCHAR,
	POSTALCODE VARCHAR,
	COUNTRY VARCHAR,
	HOMEPHONE VARCHAR,
	EXTENSION NUMBER(38,0),
	PHOTO FLOAT,
	NOTES VARCHAR,
	REPORTSTO VARCHAR,
	PHOTOPATH VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.FACT_ORDERS;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.FACT_ORDERS (
	ORDERID NUMBER(38,0),
	PRODUCTID NUMBER(38,0),
    SUPPLIERID NUMBER(38,0),
    CATEGORYID NUMBER(38,0),
    EMPLOYEEID VARCHAR,
    SHIPPERID NUMBER(38,0),
    CUSTOMERID VARCHAR,
    COUNTRYID NUMBER(38,0),
    ORDERDATE TIMESTAMP_NTZ(9),
    REQUIREDDATE TIMESTAMP_NTZ(9),
    SHIPPEDDATE VARCHAR,
	UNITPRICE NUMBER(38,2),
	QUANTITY NUMBER(38,0),
	DISCOUNT NUMBER(38,2)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.DATAMART_MONTHLY_SUPPLIER_GROSS_REVENUE;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.DATAMART_MONTHLY_SUPPLIER_GROSS_REVENUE(
    COMPANYNAME VARCHAR,
    GROSS_REVENUE NUMBER(38,2),
    YEAR VARCHAR,
    MONTH_NAME VARCHAR
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.DATAMART_MONTHLY_CATEGORY_SOLD;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.DATAMART_MONTHLY_CATEGORY_SOLD(
    YEAR VARCHAR,
    MONTH_NAME VARCHAR,
    CATEGORIES_PRODUCT VARCHAR,
    QUANTITY NUMBER(38,0)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.DATAMART_DAILY_GROSS_REVENUE;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.DATAMART_DAILY_GROSS_REVENUE(
    DATE DATE,
    MONTH_NAME VARCHAR,
    YEAR VARCHAR,
    GROSS_REVENUE NUMBER(38,2)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.DATAMART_MONTHLY_BEST_EMPLOYEES;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.DATAMART_MONTHLY_BEST_EMPLOYEES(
    YEAR VARCHAR,
    MONTH_NAME VARCHAR,
    EMPLOYEES_NAME VARCHAR,
    GROSS_REVENUE NUMBER(38,2)
);

DROP TABLE IF EXISTS PROJECT2.DATAMART.DATAMART_MONTHLY_COUNTRY_GROSS_REVENUE;
CREATE OR REPLACE TABLE PROJECT2.DATAMART.DATAMART_MONTHLY_COUNTRY_GROSS_REVENUE(
    MONTHLY_ID VARCHAR,
    YEAR VARCHAR,
    MONTH_NAME VARCHAR,
    CONTRY_NAME VARCHAR,
    GROSS_REVENUE NUMBER(38,2)
);