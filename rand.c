/**
 * @file    rand.c
 * @author  Bartosz Mierzynski <nefenit@gmail.com>
 * @date    2019
 * @version 1.0
 * @brief   Generates pseudorandom integer using rand().
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int random_int(int min, int max) {
	return min + rand() / (RAND_MAX / (max - min + 1) + 1);
}

int main(int argc, char *argv[]) {
	srand(time(NULL));
	
	switch(argc) {	
	case 0:
	case 1:
		printf("%d\n", rand());
		break;
	case 2:
		printf("%d\n", rand() % (atoi(argv[1]) + 1));
		break;
	case 3:
		printf("%d\n", random_int(atoi(argv[1]), atoi(argv[2])));
		break;
	default:
		fprintf(stderr, "usage: rand [MAX]\n       rand MIN MAX\n");
	}
	
	return EXIT_SUCCESS;
}
