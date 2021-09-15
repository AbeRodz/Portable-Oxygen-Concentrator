
sbit LCD_RS at LATD4_bit;
sbit LCD_EN at LATD5_bit;
sbit LCD_D4 at LATD0_bit;
sbit LCD_D5 at LATD1_bit;
sbit LCD_D6 at LATD2_bit;
sbit LCD_D7 at LATD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;


int humedad = 0;
int flujo = 0;
int presion = 0;
int temperatura = 0;
int presion1 = 0;
int presion2 = 0;
int x = 0;
int y = 0;
int time = 0;
int s_time = 0;
int menu = 0;
int duty = 0;
int edad = 0;
int O2 = 0;
char txt1[7];
char txt2[7];
char txt3[7];
char txt4[7];
char txt5[7];
char txttime[7];
char txtset_t[7];

void main() {

TRISA = 0xff;
ANSELA = 0;
TRISB = 0;
ANSELB = 0;
ADC_Init();
LCD_Init();
PWM3_Init(500);
PWM3_Start();
Sound_Init(&PORTC, 1);
LCD_Cmd(_LCD_Cursor_Off);

while(x<9){
    LCD_Out(1,1,"GENERADOR");
    LCD_Out(2,2,"DE OXIGENO");
    LCD_Cmd(_LCD_Shift_Right);
    x++;
    delay_ms(50);
 }
 while(x>0){
    LCD_Cmd(_LCD_Shift_Left);
    x--;
    delay_ms(50);
 }

 
     while(1){
        LCD_Cmd(_LCD_Clear);
        while(menu == 0){  
           PORTC.B3 = 0;            //INICIO
           LCD_Out(2,5,"COMENZAR");
           if(PORTA.B0){while(PORTA.B0){}
              menu = 1;
           }
        }
         LCD_Cmd(_LCD_Clear);
        while(menu == 1){                 //INICIO
           LCD_Out(2,5,"SELECCIONE");
            LCD_Out(3,4,"NIÑO  ADULTO");
           if(PORTA.B2){while(PORTA.B2){}                //ADULTO
              edad = 1;
              menu = 2;
           }
           if(PORTA.B3){while(PORTA.B3){}                //NIÑO
              edad = 2;
              menu = 2;
           }
           humedad = 0.1543*ADC_Read(15)-23.817;
           if(humedad <= 90){     //HUMEDAD
              PORTB.B3 = 1;
           }
           else{
              PORTB.B3 = 0;
           }
        }
     
        LCD_Cmd(_LCD_Clear);
        while(menu == 2){                          //MENU TIEMPO
           LCD_Out(2,1,"DESEA DEFINIR TIEMPO");
           LCD_Out(3,6,"SI    NO");
           
           if(PORTA.B0){while(PORTA.B0){}           //SI
              menu = 3;
           }
           if(PORTA.B1){while(PORTA.B1){}            //NO
              menu = 8;
           }
           humedad = 0.1543*ADC_Read(15)-23.817;
           if(humedad <= 90){     //HUMEDAD
              PORTB.B3 = 1;
           }
           else{
              PORTB.B3 = 0;
           }
        
        }
        LCD_Cmd(_LCD_Clear);
        while(menu == 8){                         //RUN SIN TIEMPO
        
           presion = 0.2672*ADC_Read(16)-14.997;
           humedad = 0.1543*ADC_Read(15)-23.817;
           temperatura = 0.244*2*ADC_Read(17);
           presion1 = 0.2672*ADC_Read(18)-14.997;
           presion2 = 0.2672*ADC_Read(19)-14.997;
           O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
           IntToStr(humedad,txt2);
           IntToStr(presion,txt3);
           IntToStr(temperatura,txt4);
           IntToStr(O2,txt5);
           LCD_Out(1,1,"FLUJO =");
           LCD_Out(2,1,"HUMED =");
           LCD_Out(2,9,txt2);
           LCD_Out(3,1,"PRES =");
           LCD_Out(3,9,txt3);
           LCD_Out(4,1,"TEMP =");
           LCD_Out(4,9,txt4);
           LCD_Out(2,19,"O2");
           LCD_Out(3,15,txt5);
           duty = -3.6222*presion + 319.47;
           PWM3_Set_Duty(duty);
           
           if(presion <= 30 || presion >= 80){
              presion = 0.2672*ADC_Read(16)-14.997;
              PORTB.B2 = 1;
              Sound_Play(329.63,500);
              delay_ms(350);
           }
           else{
              PORTB.B2 = 0;
           }
            if(humedad <= 90){
              menu = 6;
              PORTB.B3 = 1;
           }
           else{
              PORTB.B3 = 0;
           }
           if(temperatura >= 40){     //TEMPERATURA
              PORTB.B4 = 1;
           }
           else{
              PORTB.B4 = 0;
           }
           
           if(edad == 1){                                                 //NIÑO
              flujo = (0.1*0.0978*ADC_Read(14))/2;
              IntToStr(flujo,txt1);
              LCD_Out(1,9,txt1);

           }
           if(edad == 2){                                                  //ADULTO
              flujo = 0.1*0.0978*ADC_Read(14);
              IntToStr(flujo,txt1);
              LCD_Out(1,9,txt1);
           }
           if(presion1 >= 100){                 //TANQUES ALTERNANDO
              PORTB.B0 = 1;
              PORTB.B1 = 0;
           }
           if(presion2 >= 100){                   //TANQUES ALTERNANDO
              PORTB.B0 = 0;
              PORTB.B1 = 1;
           }
           if(PORTA.B1){while(PORTA.B0){}                      //VOLVER A INICIO
              PWM3_Set_Duty(0);
              presion = 0;
              humedad = 0;
              temperatura = 0;
              presion = 0;
              menu = 0;
           }
        }
        LCD_Cmd(_LCD_Clear);
        while(menu == 3){                          //SET TIME
           LCD_Out(1,5,"SET TIME");
           IntToStr(s_time,txtset_t);
           LCD_Out(2,5,txtset_t);
           
           if(PORTA.B2){
                s_time = s_time + 5;
               delay_ms(350);
             }
             if(PORTA.B3){
               s_time = s_time -5 ;
               delay_ms(350);
             }
             if(PORTA.B0){while(PORTA.B0){}
               menu = 4;
             }
             humedad = 0.1543*ADC_Read(15)-23.817;
             if(humedad <= 90){     //HUMEDAD
                PORTB.B3 = 1;
             }
             else{
                PORTB.B3 = 0;
             }
        }
        while(menu == 4){                              //RUN CON TIEMPO
           presion = 0.2672*ADC_Read(16)-14.997;
           flujo = 0.0978*ADC_Read(14);
           humedad = 0.1543*ADC_Read(15)-23.817;
           temperatura = 0.244*2*ADC_Read(17);
           O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
           presion1 = 0.2672*ADC_Read(18)-14.997;
           presion2 = 0.2672*ADC_Read(19)-14.997;
           LCD_Out(1,1,"FLUJO = ");
           LCD_Out(2,1,"HUMED = ");
           LCD_Out(3,1,"PRESI = ");
           LCD_Out(4,1,"TEMPE = ");
           LCD_Out(1,19,"O2");
           duty = -3.6222*presion + 319.47; //ADULTO
           
           if(humedad <= 90){     //HUMEDAD
              PORTB.B3 = 1;
              menu = 7;
           }
           else{
              PORTB.B3 = 0;
           }                                                       //NIÑO

        while(time <= s_time){                              //CONTADOR DE SEGUNDOS
           presion = 0.2672*ADC_Read(16)-14.997;
           humedad = 0.1543*ADC_Read(15)-23.817;
           temperatura = 0.244*2*ADC_Read(17);
           presion1 = 0.2672*ADC_Read(18)-14.997;
           presion2 = 0.2672*ADC_Read(19)-14.997;
           O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
           IntToStr(humedad,txt2);
           IntToStr(presion,txt3);
           IntToStr(temperatura,txt4);
           IntToStr(time,txttime);
           IntToStr(O2,txt5);
           LCD_Out(2,9,txt2);
           LCD_Out(3,9,txt3);
           LCD_Out(4,9,txt4);
           LCD_Out(4,15,txttime);
           LCD_Out(3,20,"T");
           LCD_Out(2,15,txt5);
           duty = -3.6222*presion + 319.47;
           PWM3_Set_Duty(duty);
           
           if(humedad <= 90){     //HUMEDAD
              PORTB.B3 = 1;
           }
           else{
              PORTB.B3 = 0;
           }
           if(temperatura >= 40){     //TEMPERATURA
              PORTB.B4 = 1;
           }
           else{
              PORTB.B4 = 0;
           }
           
           if(presion <= 30 || presion >= 80){
              presion = 0.2672*ADC_Read(16)-14.997;
              PORTB.B2 = 1;
              Sound_Play(329.63,50);
              delay_us(10);
           }
           else{
              PORTB.B2 = 0;
           }
           if(humedad <= 90){
              menu = 7;
              PORTB.B3 = 1;
           }
           
           if(edad == 1){                                                 //NIÑO
              flujo = (0.1*0.0978*ADC_Read(14))/2;
              IntToStr(flujo,txt1);
              LCD_Out(1,9,txt1);
              
           }
           if(edad == 2){                                                  //ADULTO
              flujo = 0.1*0.0978*ADC_Read(14);
              IntToStr(flujo,txt1);
              LCD_Out(1,9,txt1);
           }
           if(presion1 >= 100){   //TANQUES ALTERNANDO
              PORTB.B0 = 1;
              PORTB.B1 = 0;
           }
           if(presion2 >= 100){     //TANQUES ALTERNANDO
              PORTB.B0 = 0;
              PORTB.B1 = 1;
           }
           if(PORTA.B1){
              menu = 0;
           }
           time++;
           delay_ms(1000);
        }
           menu = 5;         //SESION TERMINADA

        }
        LCD_Cmd(_LCD_Clear);
        while(menu == 5){              //SESION TERMINADA
           LCD_Out(2,3,"SESION TERMINADA");
           PORTB.B0 = 0;
           PORTB.B1 = 0;
           PORTB.B2 = 0;
           PORTB.B4 = 0;
           PWM3_Set_Duty(0);
           if(PORTA.B0){while(PORTA.B0){}
              menu = 0;
              PORTB.B0 = 0;
              PORTB.B1 = 0;
              PORTB.B2 = 0;
              PORTB.B4 = 0;
              s_time = 0;
              time = 0;
              PWM3_Set_Duty(0);
              presion = 0;
              humedad = 0;
              temperatura = 0;
              presion = 0;
              LCD_Cmd(_LCD_Clear);
           }
           humedad = 0.1543*ADC_Read(15)-23.817;
           if(humedad <= 90){     //HUMEDAD
              PORTB.B3 = 1;
           }
           else{
              PORTB.B3 = 0;
           }
        }
        LCD_Cmd(_LCD_Clear);
        while(menu == 6){
           LCD_Out(2,3,"FALTA DE AGUA");
           presion = 0.2672*ADC_Read(16)-14.997;
           humedad = 0.1543*ADC_Read(15)-23.817;
           
           if(presion <= 30 || presion >= 80){
              presion = 0.2672*ADC_Read(16)-14.997;
              PORTB.B2 = 1;
              Sound_Play(329.63,500);
              delay_ms(350);
           }
           else{
              PORTB.B2 = 0;
           }
           
           if(humedad >= 95){
              menu = 8;
           }
        }
        LCD_Cmd(_LCD_Clear);
        while(menu == 7){
           LCD_Out(2,3,"FALTA DE AGUA");
           humedad = 0.1543*ADC_Read(15)-23.817;
           LCD_Out(3,15,txttime);

           if(humedad >= 95){
              menu = 4;
           }
        
        }
     }
}