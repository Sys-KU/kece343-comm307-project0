#ifndef __UTILS_H__
#define __UTILS_H__

#include <stdio.h>
#include <stdbool.h>

#define RED "\x1B[31m"
#define RESET "\x1B[0m"
#define MAX_TOKEN_NUM 256
#define MAX_BUFFER_SIZE 1024
#define DELIM "/\n"

#define ERR_PRINT(fmt, ...) \
    fprintf(stderr,RED "%s:%d " fmt RESET "\n", __FILE__, __LINE__, ##__VA_ARGS__)

// Return 1 if success, else return -1.
int open_file(char* fname, FILE** input);

// Return number of token
int parse_str_to_list(const char* str, char** token_list);

void free_token_list(char** token_list, int num_tokens);

#endif
