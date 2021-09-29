#include <stdio.h>
#include <stdlib.h>

int prologue [] = {
	0x5920453A, 0x54756F0A, 0x6F6F470A, 0x21643A6F,
	0x6E617920, 0x680A6474, 0x6F697661, 0x20646E69,
	0x63636363, 0x63636363, 0x72464663, 0x6F6D6F72,
	0x63636363, 0x63636363, 0x72464663, 0x6F6D6F72,
	0x2C336573, 0x7420346E, 0x20216F74, 0x726F5966,
	0x7565636F, 0x20206120, 0x6C616763, 0x74206C6F,
	0x20206F74, 0x74786565, 0x65617276, 0x32727463,
	0x594E2020, 0x206F776F, 0x79727574, 0x4563200A
};

int data [] = {
	0x63636363, 0x63636363, 0x72464663, 0x6F6D6F72,
      	0x466D203A, 0x65693A72, 0x43646E20, 0x6F54540A,
      	0x5920453A, 0x54756F0A, 0x6F6F470A, 0x21643A6F,
      	0x594E2020, 0x206F776F, 0x79727574, 0x4563200A,
      	0x6F786F68, 0x6E696373, 0x6C206765, 0x796C656B,
      	0x2C336573, 0x7420346E, 0x20216F74, 0x726F5966,
      	0x7565636F, 0x20206120, 0x6C616763, 0x74206C6F,
      	0x20206F74, 0x74786565, 0x65617276, 0x32727463,
      	0x6E617920, 0x680A6474, 0x6F697661, 0x20646E69,
      	0x21687467, 0x63002065, 0x6C6C7861, 0x78742078,
      	0x6578206F, 0x72747878, 0x78636178, 0x00783174
};

int epilogue [] = {
	0x594E2020, 0x206F776F, 0x79727574, 0x4563200A,
	0x6E617920, 0x680A6474, 0x6F697661, 0x20646E69,
	0x7565636F, 0x20206120, 0x6C616763, 0x74206C6F,
	0x2C336573, 0x7420346E, 0x20216F74, 0x726F5966,
	0x20206F74, 0x74786565, 0x65617276, 0x32727463
};

char message[200];

void usage_and_exit(char * program_name) {
	fprintf(stderr, "USAGE: %s key1 key2 key3 key4\n", program_name);
	exit(1);
}

void process_keys12 (int * key1, int * key2) {
	
	*((int *) (key1 + *key1)) = *key2;
}

void process_keys34 (int * key3, int * key4) {

	*(((int *)&key3) + *key3) += *key4;
}

char * extract_message1(int start, int stride) {
	int i, j, k;
	int done = 0;

	for (i = 0, j = start + 1; ! done; j++) {
		for (k = 1; k < stride; k++, j++, i++) {

			if (*(((char *) data) + j) == '\0') {
				done = 1;
				break;
			}
							 
			message[i] = *(((char *) data) + j);
		}
	}
	message[i] = '\0';
	return message;
}


char * extract_message2(int start, int stride) {
	int i, j;

	for (i = 0, j = start; 
		 *(((char *) data) + j) != '\0';
		 i++, j += stride) 
		 {
			 message[i] = *(((char *) data) + j);
		 }
	message[i] = '\0';
	return message;
}

int main (int argc, char *argv[])
{
	int dummy = 1;
	int start, stride;
	int key1, key2, key3, key4;
	char * msg1, * msg2;

	key3 = key4 = 0;
	if (argc < 3) {
		usage_and_exit(argv[0]);
	}
	key1 = strtol(argv[1], NULL, 0);
	key2 = strtol(argv[2], NULL, 0);
	if (argc > 3) key3 = strtol(argv[3], NULL, 0);
	if (argc > 4) key4 = strtol(argv[4], NULL, 0);

	process_keys12(&key1, &key2);

	start = (int)(*(((char *) &dummy)));
	stride = (int)(*(((char *) &dummy) + 1));

	if (key3 != 0 && key4 != 0) {
		process_keys34(&key3, &key4);
	}

	msg1 = extract_message1(start, stride);

	if (*msg1 == '\0') {
		process_keys34(&key3, &key4);
		msg2 = extract_message2(start, stride);
		printf("%s\n", msg2);
	}
	else {
		printf("%s\n", msg1);
	}

	printf("Press any key to exit...");
	getchar();
	return 0;
}
