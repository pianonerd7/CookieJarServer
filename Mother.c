#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "cookie.h"

#define MAX_COOKIES 20

int NumOfTinaCookie = 0;
int cookies = MAX_COOKIES;

struct returnStatus* getmemycookie_1_svc(struct param* par, struct svc_req * req) {

	static struct returnStatus status;
	int i;

	status.cookieStatus = -2;
	if (cookies < 1) {
		return status;
	}

	//1 is judy
	if (par->userId == 1) {
		if (NumOfTinaCookie < 2) {
			status.cookieStatus = -1;
			return status;
		}
		cookies--;
		status.cookieStatus = 1;
		return status;
	}
	//0 is tina
	else if (par->userId == 0) {
		cookies--;
		status.cookieStatus = 1;
		return status;
	}
}