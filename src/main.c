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
extern void __fastcall__ virtualSerialOut(char mode);

pixel_pair pixel;

void main(void){
    

    // Color lowres mode
    setVideoMode(RGB | SCREEN_3);
    
    // Grayscale lowres mode
    //setVideoMode(SCREEN_3);
    
    // B&W Hires mode
    //setVideoMode(HIRES | SCREEN_3);
    
    pixel.x=5;
    pixel.y=2;
    pixel.color=0x22;
    drawPixelPair(&pixel);
    
    while(1){}
}
