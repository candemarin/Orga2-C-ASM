#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "checkpoints.h"

int main (void){
	/* Acá pueden realizar sus propias pruebas */
	uint32_t res = alternate_sum_4(8,1,5,1);
	assert(res == 11);	
	printf("%d\n", res);

	res = alternate_sum_4_using_c(8,2,5,1);
	assert(res == 10);	
	printf("%d\n", res);

	res = alternate_sum_4_simplified(6,2,5,1);
	assert(res == 8);	
	printf("%d\n", res);

	res = alternate_sum_8(6,2,5,1,7,2,4,3);
	printf("%d\n", res);
	assert(res == 14); 

	product_2_f(&res, 2, 3);
	printf("%d\n", res);
	
	return 0;   
}


