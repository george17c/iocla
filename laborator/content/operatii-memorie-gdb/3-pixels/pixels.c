// SPDX-License-Identifier: BSD-3-Clause

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "pixel.h"

void reversePic(Picture *pic) {
  Pixel copy;

  for (int i = 0; i < pic->height / 2; ++i) {
    for (int j = 0; j < pic->width; ++j) {
      copy = pic->pix_array[i][j];
      pic->pix_array[i][j] = pic->pix_array[pic->height - i - 1][j];
      pic->pix_array[pic->height - i - 1][j] = copy;
    }
  }
}

void colorToGray(Picture *pic) {
  for (int i = 0; i < pic->height; ++i) {
    for (int j = 0; j < pic->width; ++j) {
      pic->pix_array[i][j].R = 0.3 * pic->pix_array[i][j].R;
      pic->pix_array[i][j].G = 0.59 * pic->pix_array[i][j].G;
      pic->pix_array[i][j].B = 0.11 * pic->pix_array[i][j].B;
    }
  }
}

int main(void) {
  int height, width;

  scanf("%d%d", &height, &width);
  Pixel **pix_array = generatePixelArray(height, width);
  Picture *pic = generatePicture(height, width, pix_array);

  printPicture(pic);

  colorToGray(pic);
  printf("\n");
  printPicture(pic);

  reversePic(pic);
  printf("\n");
  printPicture(pic);

  freePicture(&pic);
  freePixelArray(&pix_array, height, width);

  return 0;
}