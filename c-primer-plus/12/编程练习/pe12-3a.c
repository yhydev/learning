#include <stdio.h>



static double get_distance(){
	double distance;
	if(scanf("%lf", &distance) != 1){
		while(getchar() != '\n')
			continue;
		printf("Invaild input,try again:");
		get_distance();
	}

	return distance;
}

static double get_fuel(){
 	double fuel;
	if(scanf("%lf", &fuel) != 1){
		while(getchar() != '\n')
			continue;
		printf("Invaild input,try again:");
		get_fuel();
	}
	return fuel;
}


void display(int mode){

	double distance;
	double fuel;
	if(mode == 0){
		printf("Enter distance traveled in kilometers:");
		distance = get_distance();
		printf("Enter fuel consumed in liters:");
		fuel = get_fuel();	
		printf("Fule consumption is %.2lf liters per 100 km.\n", fuel * 100 / distance);
	}else if(mode == 1){
	
		printf("Enter distance traveled in miles:");
		distance = get_distance();
		printf("Enter fuel consumed in gallons:");
		fuel = get_fuel();
		printf("Fule consumption is %.2lf miles per gallon.\n", distance / fuel);
	}

}

