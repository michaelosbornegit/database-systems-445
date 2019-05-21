/********************************************************************************/
/*																				                                      */
/*	Kroenke and Auer - Database Processing (11th Edition) Chapter 02			      */
/*																				                                      */
/*	Cape Codd Outdoor Sports - Create Tables									                  */
/*																				                                      */
/*	These are the MySQL 5.1 SQL code solutions				                          */
/*																				                                      */
/********************************************************************************/
CREATE DATABASE cape_codd;
USE cape_codd;

CREATE TABLE RETAIL_ORDER (
	OrderNumber       Integer 	      NOT NULL,
	StoreNumber       Integer 	      NULL,
	StoreZip          Char (9)        NULL,
	OrderMonth    	  Char (12) 	    NOT NULL,
	OrderYear     	  Integer 	      NOT NULL,
	OrderTotal   	   Decimal(9,2)    NULL,
	CONSTRAINT 		   RETAIL_ORDER_PK PRIMARY KEY (OrderNumber)
	);

CREATE TABLE SKU_DATA (
	SKU   			      Integer 	      NOT NULL,
	SKU_Description   Char (35) 	    NOT NULL,
	Department  	    Char (30)       NOT NULL,
	Buyer  			     Char (30)       NULL,
	CONSTRAINT 		   SKU_DATA_PK     PRIMARY KEY (SKU)
	);

CREATE TABLE ORDER_ITEM (
	OrderNumber  	   Integer  	      NOT NULL,
	SKU  			       Integer 	       NOT NULL,
	Quantity  		    Integer 	       NOT NULL,
	Price  			     Decimal(9,2)     NOT NULL,
	ExtendedPrice     Decimal(9,2)     NOT NULL,
	CONSTRAINT 		   ORDER_ITEM_PK 	 PRIMARY KEY (SKU, OrderNumber),
	CONSTRAINT 		   SKU_Relationship FOREIGN KEY (SKU)
			REFERENCES 	   SKU_DATA (SKU),
	CONSTRAINT 		   RETAIL_ORDER_Relationship FOREIGN KEY (OrderNumber)
			REFERENCES 	   RETAIL_ORDER (OrderNumber)
	);

CREATE TABLE WAREHOUSE (
	Warehouse  		   Char(30)  	     NOT NULL,
	Manager			     Char(30)	       NULL,
	SquareFeet		    Integer		      NULL,
	CONSTRAINT 		   WAREHOUSE_PK 	  PRIMARY KEY (Warehouse)
	);

CREATE TABLE INVENTORY (
	SKU   			      Integer 	       NOT NULL,
	Warehouse  		   Char (30)  	    NOT NULL,
  Description  	   Char (35) 	     NOT NULL,
	QuantityOnHand 	 Integer  	      NULL,
	QuantityOnOrder	 Integer  	      NULL,
	CONSTRAINT 		   INVENTORY_PK 	  PRIMARY KEY (SKU, Warehouse),
	CONSTRAINT 		   SKU_DATA_Relationship FOREIGN KEY (SKU)
			REFERENCES 	   SKU_DATA (SKU),
	CONSTRAINT 		   WAREHOUSE_Relationship	FOREIGN KEY (Warehouse)
			REFERENCES 	   WAREHOUSE (Warehouse)
	);
	
INSERT INTO RETAIL_ORDER VALUES (
	1000, 10, '98110', 'December', 2008, 445);
INSERT INTO RETAIL_ORDER VALUES (
	2000, 20, '02335', 'December', 2008, 310);
INSERT INTO RETAIL_ORDER VALUES (
	3000, 10, '98110', 'January', 2009, 480);


INSERT INTO SKU_DATA VALUES (
	100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	201000, 'Half-dome Tent', 'Camping', 'Cindy Lo');		
INSERT INTO SKU_DATA VALUES (
	202000, 'Half-dome Tent Footprint', 'Camping', 'Cindy Lo');
INSERT INTO SKU_DATA VALUES (
	301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin');		
INSERT INTO SKU_DATA VALUES (
	302000, 'Locking carabiner, Oval', 'Climbing', 'Jerry Martin');	


INSERT INTO ORDER_ITEM VALUES (
	1000, 201000, 1, 300, 300);
INSERT INTO ORDER_ITEM VALUES (
	1000, 202000, 1, 130, 130);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101100, 4, 50, 200);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101200, 2, 50, 100);
INSERT INTO ORDER_ITEM VALUES (
	3000, 100200, 1, 300, 300);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101100, 2, 50, 100);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101200, 1, 50, 50);

/*  WAREHOUSE data  */

INSERT INTO WAREHOUSE VALUES (
	'Atlanta', 'Jones', 125000);
INSERT INTO WAREHOUSE VALUES (
	'Chicago', 'Smith', 100000);
INSERT INTO WAREHOUSE VALUES (
	'New Jersey', 'Evans', 150000);
INSERT INTO WAREHOUSE VALUES (
	'Seattle', 'Rogers', 130000);

/*  INVENTORY data   */

INSERT INTO INVENTORY VALUES (
	100100, 'Atlanta', 'Std. Scuba Tank, Yellow', 250, 0);
INSERT INTO INVENTORY VALUES (
	100100, 'Chicago', 'Std. Scuba Tank, Yellow', 100, 50);
INSERT INTO INVENTORY VALUES (
	100100, 'New Jersey', 'Std. Scuba Tank, Yellow', 100, 0);
INSERT INTO INVENTORY VALUES (
	100100, 'Seattle', 'Std. Scuba Tank, Yellow', 200, 0);
INSERT INTO INVENTORY VALUES (
	100200, 'Atlanta', 'Std. Scuba Tank, Magenta', 200, 30);
INSERT INTO INVENTORY VALUES (
	100200, 'Chicago', 'Std. Scuba Tank, Magenta', 75, 75);
INSERT INTO INVENTORY VALUES (
	100200, 'New Jersey', 'Std. Scuba Tank, Magenta', 100, 100);
INSERT INTO INVENTORY VALUES (
	100200, 'Seattle', 'Std. Scuba Tank, Magenta', 250, 0);
INSERT INTO INVENTORY VALUES (
	101100, 'Atlanta', 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	101100, 'Chicago', 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	101100, 'New Jersey', 'Dive Mask, Small Clear', 300, 200);
INSERT INTO INVENTORY VALUES (
	101100, 'Seattle', 'Dive Mask, Small Clear', 450, 0);
INSERT INTO INVENTORY VALUES (
	101200, 'Atlanta', 'Dive Mask, Med Clear', 100, 500);
INSERT INTO INVENTORY VALUES (
	101200, 'Chicago', 'Dive Mask, Med Clear', 50, 500);
INSERT INTO INVENTORY VALUES (
	101200, 'New Jersey', 'Dive Mask, Med Clear', 475, 0);
INSERT INTO INVENTORY VALUES (
	101200, 'Seattle', 'Dive Mask, Med Clear', 250, 250);
INSERT INTO INVENTORY VALUES (
	201000, 'Atlanta', 'Half-dome Tent', 2, 100);
INSERT INTO INVENTORY VALUES (
	201000, 'Chicago', 'Half-dome Tent', 10, 250);
INSERT INTO INVENTORY VALUES (
	201000, 'New Jersey', 'Half-dome Tent', 250, 0);
INSERT INTO INVENTORY VALUES (
	201000, 'Seattle', 'Half-dome Tent', 0, 250);
INSERT INTO INVENTORY VALUES (
	202000, 'Atlanta', 'Half-dome Tent Footprint', 10, 250);
INSERT INTO INVENTORY VALUES (
	202000, 'Chicago', 'Half-dome Tent Footprint', 1, 250);
INSERT INTO INVENTORY VALUES (
	202000, 'New Jersey', 'Half-dome Tent Footprint', 100, 0);
INSERT INTO INVENTORY VALUES (
	202000, 'Seattle', 'Half-dome Tent Footprint', 0, 200);
INSERT INTO INVENTORY VALUES (
	301000, 'Atlanta', 'Light Fly Climbing Harness', 300, 250);
INSERT INTO INVENTORY VALUES (
	301000, 'Chicago', 'Light Fly Climbing Harness', 250, 250);
INSERT INTO INVENTORY VALUES (
	301000, 'New Jersey', 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	301000, 'Seattle', 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	302000, 'Atlanta', 'Locking carabiner', 1000, 0);
INSERT INTO INVENTORY VALUES (
	302000, 'Chicago', 'Locking carabiner', 1250, 0);
INSERT INTO INVENTORY VALUES (
	302000, 'New Jersey', 'Locking carabiner', 500, 500);
INSERT INTO INVENTORY VALUES (
	302000, 'Seattle', 'Locking carabiner', 0, 1000);

