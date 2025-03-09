#ifndef __DIR_FILE_H__
#define __DIR_FILE_H__

#include "utils.h"

#define MAX_FILE_LIST_SIZE 512
#define MAX_DIR_LIST_SIZE 512
#define MAX_NAME_SIZE 256

struct file_struct {
    char name[MAX_NAME_SIZE];
};

struct directory_struct {
    char name[MAX_NAME_SIZE];
    struct directory_struct *dir_list[MAX_DIR_LIST_SIZE];
    struct file_struct *file_list[MAX_FILE_LIST_SIZE];
    int num_files;
    int num_dirs;
};


typedef struct directory_struct directory_t;
typedef struct file_struct file_t;

directory_t* create_dir(char* name);

directory_t* find_dir(directory_t* dir, char* name);

directory_t* find_create_dir(directory_t* parent_dir, char* name, bool* is_create);

file_t* create_file(char* name); 

file_t* find_file(directory_t* dir, char* name);

file_t* find_create_file(directory_t* dir, char* name, bool* is_create);

void make_dir_and_file(directory_t* root_dir, char** token_list, int num_tokens);

void free_dir_and_file(directory_t* dir);

directory_t* find_target_dir(directory_t* root_dir, char** token_list, int num_tokens);

void print_files_on_dir(directory_t* dir);

#endif
