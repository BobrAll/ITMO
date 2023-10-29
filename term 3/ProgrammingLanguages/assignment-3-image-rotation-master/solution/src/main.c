#include "bmp.h"
#include "image.h"
#include "rotator.h"


void process_bmp_reading_status(size_t result, char* path);
void process_bmp_writing_status(size_t result, char* path);

int main(int argc, char** argv) {
    argc != 3?
    fprintf(stderr,"You must follow the format: '%s \"path to input input_img\" \"path to output input_img\".\n", argv[0]):
    fprintf(stdout, "start working\n");

    struct image input_img = (struct image) {0};
    struct image output_img;
    char *pathToInputImg = argv[1];
    char *pathToOutputImg = argv[2];

    FILE* in = fopen(pathToInputImg, "rb");
    FILE* out = fopen(pathToOutputImg, "wb");

    process_bmp_reading_status(from_bmp(in, &input_img), pathToInputImg);
    output_img = rotate_img_left(input_img);
    process_bmp_writing_status(to_bmp(out, &output_img), pathToOutputImg);

    free_img(&input_img);
    free_img(&output_img);
    return 0;
}

void process_bmp_writing_status(size_t result, char* path){
    switch (result) {
        case WRITE_OK: fprintf(stdout, "Image saved successfully. Congrats!\n"); return;
        case WRITE_ERROR: fprintf(stderr, "Error with saving image to '%s'\n", path); break;
        default: fprintf(stderr, "Unknown problems with saving image to '%s'.\n", path); break;
    }

    exit(-1);
}
void process_bmp_reading_status(size_t result, char *path) {
    switch (result) {
        case READ_OK: fprintf(stdout, "Image load successfully.\n"); return;
        case READ_INVALID_HEADER: fprintf(stderr, "The image cannot be read - the header is invalid in '%s'.\n", path); break;
        case READ_INVALID_BITS: fprintf(stderr, "The image cannot be read. Check integrity in '%s'.\n", path); break;
        default: fprintf(stderr, "Unknown problems with loading image from '%s'.\n", path); break;
    }

    exit(-1);
}
