#include <stdlib.h>
#include <stdio.h>

void populateInput (unsigned char *inputVector, int *JPEGSIZE, const char *fileName)
{
    FILE* inputFile = fopen(fileName, "r");    
    fscanf (inputFile, "%d", &(*JPEGSIZE)); 
    
    int i;
    for (i = 0; i < *JPEGSIZE; i++)
        fscanf (inputFile, "%hhu", &inputVector[i]);
    
    fclose(inputFile);

       
}

void populateOutput (int numElts, int RGBnum, unsigned char outputVector[RGBnum][numElts], const char *fileName)
{   
    FILE* outputFile = fopen(fileName, "wb");
    
    fwrite(outputVector, numElts, RGBnum, outputFile);

    fclose(outputFile);
}


