#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <limits.h>

#define BLOCK_SIZE 4
#define SEARCH_AREA_SIZE 32
#define FRAME_WIDTH 416
#define FRAME_HEIGHT 240  
  

void populateInput(int frame_width, int frame_height, uint8_t reference_luma_frame[frame_height][frame_width], uint8_t current_luma_frame[frame_height][frame_width], const char *referenceFileName, const char *currentFileName);
void populateOutput(int frame_width, int frame_height, int block_size, int motion_vectors[(frame_height + block_size - 1)/block_size][(frame_width + block_size - 1)/block_size][2], const char *motionVectorsFileName);

uint8_t reference_frame[FRAME_HEIGHT][FRAME_WIDTH];
uint8_t current_frame[FRAME_HEIGHT][FRAME_WIDTH];
int motion_vectors[(FRAME_HEIGHT + BLOCK_SIZE - 1)/BLOCK_SIZE][(FRAME_WIDTH + BLOCK_SIZE - 1)/BLOCK_SIZE][2];

void motion_main(){
	
	int sad = INT_MAX;
	int i, j, k, m, p, q, temp_sad;
	int motion_vec_x = 0;
	int motion_vec_y = 0;
	int diff = 0; 
	
	//Percorre frame, bloco a bloco
        for (i = 0; i < FRAME_HEIGHT; i+=BLOCK_SIZE) 	{		
           for (j = 0; j < FRAME_WIDTH; j+=BLOCK_SIZE)  {		
			
			//realiza o Full Search utilizando apenas as amostras retiradas anteriormente.
			//retorno é o melhor vetor obtido
			sad = INT_MAX;
			for (k = 0; k < 3*SEARCH_AREA_SIZE-BLOCK_SIZE+1; k++)  {	
				for (m = 0; m < 3*SEARCH_AREA_SIZE-BLOCK_SIZE+1; m++) {	
					if (i-SEARCH_AREA_SIZE+k >= 0 && i-SEARCH_AREA_SIZE+k < FRAME_HEIGHT-BLOCK_SIZE) {
						if (j-SEARCH_AREA_SIZE+m >= 0 && j-SEARCH_AREA_SIZE+m < FRAME_WIDTH-BLOCK_SIZE) {
							
							//compara o bloco atual com o bloco referencia (k,m)
							temp_sad = 0;
							 for (p = 0; p < BLOCK_SIZE ; p++){
							 	for (q = 0; q < BLOCK_SIZE ; q++){
									diff = current_frame[i+p][j+q]-reference_frame[i-SEARCH_AREA_SIZE+k+p][j-SEARCH_AREA_SIZE+m+q];
									if (diff < 0)
										temp_sad -= diff;
									else
										temp_sad += diff;
																		
			  					}
							}
					
							if (temp_sad < sad){
								sad = temp_sad;
								motion_vec_x = k-SEARCH_AREA_SIZE;
								motion_vec_y = m-SEARCH_AREA_SIZE;
							}
					
						}
					}
				}
			}
			//printf("BLock Number (i, j): (%d, %d)\n", i, j);
			motion_vectors[i/BLOCK_SIZE][j/BLOCK_SIZE][0] = motion_vec_x;
			motion_vectors[i/BLOCK_SIZE][j/BLOCK_SIZE][1] = motion_vec_y;
			

									
		}
	}	
}


int main (int argc, char *argv[]) {
        
	populateInput(FRAME_WIDTH, FRAME_HEIGHT, reference_frame, current_frame, argv[1], argv[2]); 
        motion_main();
       	populateOutput(FRAME_WIDTH, FRAME_HEIGHT, BLOCK_SIZE, motion_vectors, argv[3]);  
	
 	return 0;

}
	

