// [HiRes Invert S1 S0    RGB LED NC NC]
#define HIRES 0X80
#define INVERT 0X40
#define SCREEN_0 0x00
#define SCREEN_1 0x10
#define SCREEN_2 0x20
#define SCREEN_3 0x30
#define RGB 0x08
#define LED 0x04

typedef struct{
    unsigned char x, y, color;
} pixel_pair;



extern void __fastcall__ setVideoMode(char mode);
extern void __fastcall__ drawPixelPair(void*);

pixel_pair pixel;

void main(void){
    unsigned char row, col, z;

    // Color lowres mode
    setVideoMode(RGB | SCREEN_3);
    
    // Grayscale lowres mode
    //setVideoMode(SCREEN_3);
    
    // B&W Hires mode
    //setVideoMode(HIRES | SCREEN_3);
    
    
    pixel.color=0x11;
    pixel.y=0;
    
    for(z=0; z<14; z++) {
    for(row=0; row<9; row++) {
        for(col=0; col<128; col+=2) {
            pixel.x=col;
            drawPixelPair(&pixel);
        }
        pixel.y++;
    }
    pixel.color+=0x11;
    }
    
    while(1){}
}
