#include "bmp.h"

#include <inttypes.h>
#include <stdio.h>

static size_t read_file_header(FILE* in, struct bmp_header *const header) {
    if (!read_from_file(in, header, sizeof(struct bmp_header), 1, 0)) return 0;
    fseek(in, header->bOffBits, SEEK_SET);
    return 1;
}
static size_t get_padding(size_t row_size) {
    return 4 - row_size % 4;
}
static size_t read_data(FILE* in, const struct image *const img) {
    size_t byte_width = sizeof(struct pixel) * (img->width);
    size_t padding = get_padding(byte_width);

    struct pixel * start = img->data;

    for (struct pixel *row = img->data; row < img->width * img->height + start; row += img->width) {
        read_from_file(in, row, sizeof(struct pixel), img->width, padding);
    }

    return 1;
}
enum read_status from_bmp(FILE* in, struct image *const img) {
    struct bmp_header bmp_img_header;

    if (!read_file_header(in, &bmp_img_header)) return READ_INVALID_HEADER;
    else {
        *img = create_img(bmp_img_header.biWidth, bmp_img_header.biHeight);
        if (!read_data(in, img)) return READ_INVALID_BITS;
    }

    fclose(in);
    return READ_OK;
}
enum write_status to_bmp(FILE* out, const struct image *const img) {
    struct bmp_header header = (struct bmp_header) {0};

    size_t row_size = sizeof(struct pixel) * img->width;
    size_t img_size = (row_size + get_padding(row_size)) * img->height;

    header.bOffBits = sizeof(struct pixel) * 8;
    header.bfReserved = 0;
    header.bfileSize = img_size + header.bOffBits;
    header.biBitCount = 24;
    header.biClrImportant = 0;
    header.biClrUsed = 0;
    header.biCompression = 0;
    header.biHeight = img->height;
    header.biPlanes = 1;
    header.biSize = sizeof(struct bmp_header) - 14;
    header.biSizeImage = img_size;
    header.biWidth = img->width;
    header.biXPelsPerMeter = 0;
    header.biYPelsPerMeter = 0;
    header.bfType = 19778;


    if (!write_to_file(out, &header, sizeof(struct bmp_header), 1, 0)) return WRITE_ERROR;

    for (size_t row_val = 0; row_val < img->height; ++row_val) {
        const struct pixel *current_row = img->data + row_val * img->width;

        if (!write_to_file(out,current_row,sizeof(struct pixel),img->width,get_padding(sizeof(struct pixel) * (img->width)))) return WRITE_ERROR;
    }

    fclose(out);
    return WRITE_OK;
}

size_t read_from_file(FILE *file, void *buff, size_t struct_size, size_t count, size_t padding) {
    size_t status = fread(buff, struct_size, count, file);
    fseek(file, (long) padding, SEEK_CUR);

    return status;
}
size_t write_to_file(FILE *file, const void *buff, size_t struct_size, size_t count, size_t padding) {
    size_t write_status = fwrite(buff, struct_size, count, file);
    uint8_t ptr[3] = {0};
    fwrite(&ptr, 1, padding, file);

    return write_status;
}
