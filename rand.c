/* rand - generates random integrer within range using rand()
 * (c) Copyright 2019 Bartosz Mierzynski
 * Written in ANSI C (C89)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int random_int(int mn, int mx) {
	return mn + rand() / (RAND_MAX / (mx - mn + 1) + 1);
}

int main(int argc, char *argv[]) {
	srand(time(NULL));
	
	switch(argc) {
	case 0:
	case 1:
		break;
	case 2:
		printf("%d\n", rand() % (atoi(argv[1]) + 1));
		break;
	case 3:
		printf("%d\n", random_int(atoi(argv[1]), atoi(argv[2])));
		break;
	default:
		break;
	}
	return 0;
}
