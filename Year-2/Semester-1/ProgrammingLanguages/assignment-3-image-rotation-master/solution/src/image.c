#include "image.h"
#include <stdlib.h>

struct image create_img(size_t width, size_t height) {
    return (struct image) {.width = width, .height = height, .data = (struct pixel *) malloc(sizeof(struct pixel) * width * height)};
}

struct pixel *pixel_in_image(const struct image *const img, size_t col, size_t row) {
    return row * img->width + col + img->data;
}

void free_img(struct image* img) {
    free(img->data);
    img->data = NULL;
}
