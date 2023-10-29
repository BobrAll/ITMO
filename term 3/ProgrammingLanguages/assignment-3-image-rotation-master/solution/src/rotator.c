#include "image.h"
#include "rotator.h"


struct image rotate_img_left(const struct image in_img) {
    struct image out_img = create_img(in_img.height, in_img.width);

    for (size_t in_row = 0; in_row < in_img.height; in_row++) {
        for (size_t in_col = 0; in_col < in_img.width; in_col++) {
            size_t out_row = in_col;
            size_t out_col = in_img.height - in_row - 1;

            *pixel_in_image(&out_img, out_col, out_row) = *pixel_in_image(&in_img, in_col, in_row);
        }
    }
    return out_img;
}
