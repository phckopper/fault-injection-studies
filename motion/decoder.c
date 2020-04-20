#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <limits.h>

#define BLOCK_SIZE 4
#define SEARCH_AREA_SIZE 32
#define FRAME_WIDTH 416
#define FRAME_HEIGHT 240 
  

void populateInput(int frame_width, int frame_height, int block_size, uint8_t reference_luma_frame[frame_height][frame_width], int motion_vectors[(frame_height + block_size - 1)/block_size][(frame_width + block_size - 1)/block_size][2], const char *referenceFileName, const char *motionVectorsFileName);
void populateOutput(int frame_width, int frame_height, uint8_t recovered_luma_frame[frame_height][frame_width], const char *recoveredFileName);

uint8_t reference_frame[FRAME_HEIGHT][FRAME_WIDTH];
uint8_t recovered_frame[FRAME_HEIGHT][FRAME_WIDTH];
int motion_vectors[(FRAME_HEIGHT + BLOCK_SIZE - 1)/BLOCK_SIZE][(FRAME_WIDTH + BLOCK_SIZE - 1)/BLOCK_SIZE][2];

void motion_main(){
	
	int i, j, a, b;

       	//Percorre frame, bloco a bloco
	for (i = 0; i < FRAME_HEIGHT; i+=BLOCK_SIZE) 	{		
		for (j = 0; j < FRAME_WIDTH; j+=BLOCK_SIZE)  {		
					
			//Reconstrói o quadro atual utilizando apenas o quadro de referência e o vetor obtido
			for (a = i; a < i+BLOCK_SIZE; a++){
				for (b = j; b < j+BLOCK_SIZE; b++){
					if(a < FRAME_HEIGHT && b < FRAME_WIDTH)
						recovered_frame[a][b] = reference_frame[a+motion_vectors[i/BLOCK_SIZE][j/BLOCK_SIZE][0]][b+motion_vectors[i/BLOCK_SIZE][j/BLOCK_SIZE][1]];

				}
			}
			 

			
		}
	}
}


int main (int argc, char *argv[]) {
    	 
	populateInput(FRAME_WIDTH, FRAME_HEIGHT, BLOCK_SIZE, reference_frame, motion_vectors, argv[1], argv[2]); 
	motion_main();
	populateOutput(FRAME_WIDTH, FRAME_HEIGHT, recovered_frame, argv[3]);  
	
 	return 0;

}
	

