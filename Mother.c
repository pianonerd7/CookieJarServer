#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "Cookie.x"

#define MAX_COOKIES 20

int NumOfTinaCookie = 0;
int cookies = MAX_COOKIES;

int getCookie(int userID) {

	if (cookies < 1) {
		return -2
	}

	//1 is judy
	if (useID == 1) {
		if (NumOfTinaCookie < 2) {
			return -1;
		}
		cookies--;
		return 1;
	}
	//0 is tina
	else if (userID == 0) {
		cookies--;
		return 1;
	}
}