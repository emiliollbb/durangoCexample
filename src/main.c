
int main(void){

    *(unsigned int*)0xdf80=0x3f;
    *(unsigned int*)0x6000=0x11;
    return 0;
}