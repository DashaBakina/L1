#include "math.h"

extern "C" float funcC(int x) {
	float f;
	f = ((cos(x) + sin(x)) / exp(x));
	return f;
}