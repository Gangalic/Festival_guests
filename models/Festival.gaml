/***
* Name: Festival
* Author: Catalin
* Description: 
* Tags: Tag1, Tag2, TagN
***/

model Festival

global {
	/** Insert the global definitions, variables and actions here */
	
	int nb_guests <- rnd(5)+10; // between 10 and 15 guests
	int nb_food_courts <- rnd(2,4);
	int nb_bars <- rnd(2,4);
	int nb_info_point <- 1;
	point loc_info_point <- {50,50}; // info center located in the middle of the map
	int size_info_point <- 5; // buildings are going to be 5 and guests 2
	int rate_change <- 5; // the rate with which hunger/thirst decreases
	
	init {
		// init all the agents
		create guest number: nb_guests;
		create food_court number: nb_food_courts;
		create bar number: nb_bars;
		create info_point number: nb_info_point {
			location <- loc_info_point;
		}
	}
}

species guest {
	int size <- 2;
	rgb color <- #red;
	
	aspect default {
		draw sphere(size) color: color;
	}
}

species building {
	int size <- 5;
}

species food_court parent: building {
	rgb color <- #green;
	
	aspect default {
		draw cube(size) color: color;
	}
}

species bar parent: building {
	rgb color <- #blue;
	
	aspect default {
		draw cube(size) color: color;
	}
	
}

species info_point parent: building {
	rgb color <- #yellow;
	
	aspect default {
		draw pyramid(size) at: location color: color;
	}
}

experiment Festival type: gui {
	/** Insert here the definition of the input and output of the model */
	// input
	parameter "Initial number of guests: " var: nb_guests min: 5 max: 20 category: "Guest";
	// output
	output {
		// opengl adds the 3d part
		display main_display type:opengl{
			species guest;
			species food_court;
			species bar;
			species info_point;
		}
	}
}
