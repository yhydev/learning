#include <stdio.h>

static int mode;
static double distance;
static double fuel;


static void get_distance(){
	if(scanf("%lf", &distance) != 1){
		while(getchar() != '\n')
			continue;
		printf("Invaild input,try again:");
		get_distance();
	}
}

static void get_fuel(){
	if(scanf("%lf", &fuel) != 1){
		while(getchar() != '\n')
			continue;
		printf("Invaild input,try again:");
		get_fuel();
	}
}

void set_mode(int md){
	mode = md;
}

void get_info(){
	if(mode == 0){
		printf("Enter distance traveled in kilometers:");
		get_distance();
		printf("Enter fuel consumed in liters:");
		get_fuel();

	}else if(mode ==1){
	
		printf("Enter distance traveled in miles:");
		get_distance();
		printf("Enter fuel consumed in gallons:");
		get_fuel();
	}

}

void show_info(){
	if(mode == 0){
		printf("Fule consumption is %.2lf liters per 100 km.\n", fuel * 100 / distance);

	}else if(mode == 1){
		printf("Fule consumption is %.2lf miles per gallon.\n", distance / fuel);

	}

}
