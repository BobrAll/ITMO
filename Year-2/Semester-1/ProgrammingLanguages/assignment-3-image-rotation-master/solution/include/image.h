#ifndef IMAGE_TRANSFORMER_IMAGE_H
#define IMAGE_TRANSFORMER_IMAGE_H
#include <stdint.h>
#include <stdlib.h>

struct pixel {
    uint8_t b;
    uint8_t r;
    uint8_t g;
};

struct image {
    struct pixel *data;

    size_t height;
    size_t width;
};

struct image create_img(size_t width, size_t height);
struct pixel *pixel_in_image(const struct image *const img, size_t col, size_t row);
void free_img(struct image* img);

#endif //IMAGE_TRANSFORMER_IMAGE_H
