#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

#include "dir_file.h"
#include "utils.h"

int open_file(char* fname, FILE** input) {
    if (access(fname, F_OK) == -1) {
        ERR_PRINT("The '%s' file does not exists\n", fname);
        return -1;
    }

    *input = fopen(fname, "r");
    if (input == NULL) {
        ERR_PRINT("Failed open '%s' file\n", fname);
        return -1;
    }

    return 1;
}

// This function splits the input string (const char* str) to tokens
// and put the tokens in token_list. The return value must be the number
// of tokens in the given input string.
int parse_str_to_list(const char* str, char** token_list) {
    /* Fill this function */
}

void free_token_list(char** token_list, int num_tokens) {
    for (int i = 0; i < num_tokens; i++) {
        free(token_list[i]);
    }

    free(token_list);
}

