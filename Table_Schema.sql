/* Creating table schema */
​
--Create table Measuerment_type
​
CREATE TABLE "measurement_type_lkp" (
    "measurement_type_id" serial  NOT NULL,
    "measurement_type" varchar(50)   NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp,
    CONSTRAINT "pk_measurement_type_lkp" PRIMARY KEY (
        "measurement_type_id"
     )
);
​
--Create table Ingredient_lkp
​
CREATE TABLE "ingredient_lkp" (
    "ingredient_id" serial   NOT NULL,
    "ingredient" varchar(100)   NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp,
    CONSTRAINT "pk_ingredient_lkp" PRIMARY KEY (
        "ingredient_id"
     )
);
​
​
--Create table Dessert_list
​
CREATE TABLE "dessert_list" (
    "dessert_id" serial   NOT NULL,
    "dessert_name" varchar(100)   NOT NULL,
    "prep_time" varchar(50)   NULL,
    "cook_time" varchar(50)   NULL,
    "additional_time" varchar(50)   NULL,
    "total_time" varchar(50)   NULL,
    "servings" int   NULL,
    "recipe_yield" varchar(50)   NULL,
    "number_of_rankings" varchar(50) NULL,
    "star_rating" int   NULL,
    "number_of_reviews" varchar(50) NULL,
    "blerb" varchar   NULL,
    "url" varchar(250)   NULL,
    "last_updated" timestamp DEFAULT localtimestamp,
    CONSTRAINT "pk_dessert_list" PRIMARY KEY (
        "dessert_id"
     )
);
​
​
--Create table directions
​
CREATE TABLE "directions" (
    "directions_id" serial   NOT NULL,
    "dessert_id" int   NOT NULL,
    "steps" Varchar(20)   NOT NULL,
    "directions" varchar(720)   NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp,
	CONSTRAINT "pk_directions" PRIMARY KEY (
        "directions_id"
		)
);
​
--Create table Ingredients
​
CREATE TABLE "recipes_jct" (
    "id" serial   NOT NULL,
    "dessert_id" int   NOT NULL,
    "ingredient_id" int   NOT NULL,
    "measurement_type_id" int   NOT NULL,
    "measurement_value" int   NULL,
    "last_updated" timestamp DEFAULT localtimestamp,
    CONSTRAINT "pk_recipes_jct" PRIMARY KEY (
        "id"
     )
);
​
​
​
ALTER TABLE "directions" ADD CONSTRAINT "fk_directions_dessert_id" FOREIGN KEY("dessert_id")
REFERENCES "dessert_list" ("dessert_id");
​
ALTER TABLE "recipes_jct" ADD CONSTRAINT "fk_recipes_jct_ingredient_id" FOREIGN KEY("ingredient_id")
REFERENCES "ingredient_lkp" ("ingredient_id");
​
ALTER TABLE "recipes_jct" ADD CONSTRAINT "fk_recipes_jct_measurement_type_id" FOREIGN KEY("measurement_type_id")
REFERENCES "measurement_type_lkp" ("measurement_type_id");
​
ALTER TABLE "recipes_jct" ADD CONSTRAINT "fk_recipes_jct_dessert_id" FOREIGN KEY("dessert_id")
REFERENCES "dessert_list" ("dessert_id");
