#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int random(int mn, int mx) {
	return mn + rand() / (RAND_MAX / (max - min + 1) + 1);
}

int main(int argc, char *argv[]) {
	srand(time(NULL));
	
	switch(argc) {
	case 0:
	case 1:
		break;
	case 2:
		printf("%d", rand() % (atoi(argv[1]) + 1));
		break;
	case 3:
		printf(%d", random(atoi(argv[1]), atoi(argv[2])));
		break;
	default:
	}
	return 0;
}
