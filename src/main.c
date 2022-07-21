
void main(void){

    *(unsigned int*)0xdf80=0x3f;
    *(unsigned int*)0x1000=0xff;
    
    while(1){}
}
