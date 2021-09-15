
_main:

;ProyectoMicro.c,39 :: 		void main() {
;ProyectoMicro.c,41 :: 		TRISA = 0xff;
	MOVLW       255
	MOVWF       TRISA+0 
;ProyectoMicro.c,42 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;ProyectoMicro.c,43 :: 		TRISB = 0;
	CLRF        TRISB+0 
;ProyectoMicro.c,44 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;ProyectoMicro.c,45 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;ProyectoMicro.c,46 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;ProyectoMicro.c,47 :: 		PWM3_Init(500);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;ProyectoMicro.c,48 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;ProyectoMicro.c,49 :: 		Sound_Init(&PORTC, 1);
	MOVLW       PORTC+0
	MOVWF       FARG_Sound_Init_snd_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Sound_Init_snd_port+1 
	MOVLW       1
	MOVWF       FARG_Sound_Init_snd_pin+0 
	CALL        _Sound_Init+0, 0
;ProyectoMicro.c,50 :: 		LCD_Cmd(_LCD_Cursor_Off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,52 :: 		while(x<9){
L_main0:
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main106
	MOVLW       9
	SUBWF       _x+0, 0 
L__main106:
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;ProyectoMicro.c,53 :: 		LCD_Out(1,1,"GENERADOR");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,54 :: 		LCD_Out(2,2,"DE OXIGENO");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,55 :: 		LCD_Cmd(_LCD_Shift_Right);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,56 :: 		x++;
	INFSNZ      _x+0, 1 
	INCF        _x+1, 1 
;ProyectoMicro.c,57 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;ProyectoMicro.c,58 :: 		}
	GOTO        L_main0
L_main1:
;ProyectoMicro.c,59 :: 		while(x>0){
L_main3:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _x+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main107
	MOVF        _x+0, 0 
	SUBLW       0
L__main107:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;ProyectoMicro.c,60 :: 		LCD_Cmd(_LCD_Shift_Left);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,61 :: 		x--;
	MOVLW       1
	SUBWF       _x+0, 1 
	MOVLW       0
	SUBWFB      _x+1, 1 
;ProyectoMicro.c,62 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;ProyectoMicro.c,63 :: 		}
	GOTO        L_main3
L_main4:
;ProyectoMicro.c,66 :: 		while(1){
L_main6:
;ProyectoMicro.c,67 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,68 :: 		while(menu == 0){
L_main8:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main108
	MOVLW       0
	XORWF       _menu+0, 0 
L__main108:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;ProyectoMicro.c,69 :: 		PORTC.B3 = 0;            //INICIO
	BCF         PORTC+0, 3 
;ProyectoMicro.c,70 :: 		LCD_Out(2,5,"COMENZAR");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,71 :: 		if(PORTA.B0){while(PORTA.B0){}
	BTFSS       PORTA+0, 0 
	GOTO        L_main10
L_main11:
	BTFSS       PORTA+0, 0 
	GOTO        L_main12
	GOTO        L_main11
L_main12:
;ProyectoMicro.c,72 :: 		menu = 1;
	MOVLW       1
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,73 :: 		}
L_main10:
;ProyectoMicro.c,74 :: 		}
	GOTO        L_main8
L_main9:
;ProyectoMicro.c,75 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,76 :: 		while(menu == 1){                 //INICIO
L_main13:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main109
	MOVLW       1
	XORWF       _menu+0, 0 
L__main109:
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;ProyectoMicro.c,77 :: 		LCD_Out(2,5,"SELECCIONE");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,78 :: 		LCD_Out(3,4,"NIÑO  ADULTO");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,79 :: 		if(PORTA.B2){while(PORTA.B2){}                //ADULTO
	BTFSS       PORTA+0, 2 
	GOTO        L_main15
L_main16:
	BTFSS       PORTA+0, 2 
	GOTO        L_main17
	GOTO        L_main16
L_main17:
;ProyectoMicro.c,80 :: 		edad = 1;
	MOVLW       1
	MOVWF       _edad+0 
	MOVLW       0
	MOVWF       _edad+1 
;ProyectoMicro.c,81 :: 		menu = 2;
	MOVLW       2
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,82 :: 		}
L_main15:
;ProyectoMicro.c,83 :: 		if(PORTA.B3){while(PORTA.B3){}                //NIÑO
	BTFSS       PORTA+0, 3 
	GOTO        L_main18
L_main19:
	BTFSS       PORTA+0, 3 
	GOTO        L_main20
	GOTO        L_main19
L_main20:
;ProyectoMicro.c,84 :: 		edad = 2;
	MOVLW       2
	MOVWF       _edad+0 
	MOVLW       0
	MOVWF       _edad+1 
;ProyectoMicro.c,85 :: 		menu = 2;
	MOVLW       2
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,86 :: 		}
L_main18:
;ProyectoMicro.c,87 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,88 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVF        R0, 0 
	SUBLW       90
L__main110:
	BTFSS       STATUS+0, 0 
	GOTO        L_main21
;ProyectoMicro.c,89 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,90 :: 		}
	GOTO        L_main22
L_main21:
;ProyectoMicro.c,92 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,93 :: 		}
L_main22:
;ProyectoMicro.c,94 :: 		}
	GOTO        L_main13
L_main14:
;ProyectoMicro.c,96 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,97 :: 		while(menu == 2){                          //MENU TIEMPO
L_main23:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main111
	MOVLW       2
	XORWF       _menu+0, 0 
L__main111:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;ProyectoMicro.c,98 :: 		LCD_Out(2,1,"DESEA DEFINIR TIEMPO");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,99 :: 		LCD_Out(3,6,"SI    NO");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,101 :: 		if(PORTA.B0){while(PORTA.B0){}           //SI
	BTFSS       PORTA+0, 0 
	GOTO        L_main25
L_main26:
	BTFSS       PORTA+0, 0 
	GOTO        L_main27
	GOTO        L_main26
L_main27:
;ProyectoMicro.c,102 :: 		menu = 3;
	MOVLW       3
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,103 :: 		}
L_main25:
;ProyectoMicro.c,104 :: 		if(PORTA.B1){while(PORTA.B1){}            //NO
	BTFSS       PORTA+0, 1 
	GOTO        L_main28
L_main29:
	BTFSS       PORTA+0, 1 
	GOTO        L_main30
	GOTO        L_main29
L_main30:
;ProyectoMicro.c,105 :: 		menu = 8;
	MOVLW       8
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,106 :: 		}
L_main28:
;ProyectoMicro.c,107 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,108 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main112
	MOVF        R0, 0 
	SUBLW       90
L__main112:
	BTFSS       STATUS+0, 0 
	GOTO        L_main31
;ProyectoMicro.c,109 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,110 :: 		}
	GOTO        L_main32
L_main31:
;ProyectoMicro.c,112 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,113 :: 		}
L_main32:
;ProyectoMicro.c,115 :: 		}
	GOTO        L_main23
L_main24:
;ProyectoMicro.c,116 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,117 :: 		while(menu == 8){                         //RUN SIN TIEMPO
L_main33:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main113
	MOVLW       8
	XORWF       _menu+0, 0 
L__main113:
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;ProyectoMicro.c,119 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,120 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,121 :: 		temperatura = 0.244*2*ADC_Read(17);
	MOVLW       17
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       35
	MOVWF       R4 
	MOVLW       219
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ProyectoMicro.c,122 :: 		presion1 = 0.2672*ADC_Read(18)-14.997;
	MOVLW       18
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion1+0 
	MOVF        R1, 0 
	MOVWF       _presion1+1 
;ProyectoMicro.c,123 :: 		presion2 = 0.2672*ADC_Read(19)-14.997;
	MOVLW       19
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion2+0 
	MOVF        R1, 0 
	MOVWF       _presion2+1 
;ProyectoMicro.c,124 :: 		O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       39
	MOVWF       R4 
	MOVLW       160
	MOVWF       R5 
	MOVLW       137
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       71
	MOVWF       R4 
	MOVLW       114
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       111
	MOVWF       R4 
	MOVLW       146
	MOVWF       R5 
	MOVLW       124
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _O2+0 
	MOVF        R1, 0 
	MOVWF       _O2+1 
;ProyectoMicro.c,125 :: 		IntToStr(humedad,txt2);
	MOVF        _humedad+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _humedad+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt2+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,126 :: 		IntToStr(presion,txt3);
	MOVF        _presion+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _presion+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt3+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,127 :: 		IntToStr(temperatura,txt4);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt4+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,128 :: 		IntToStr(O2,txt5);
	MOVF        _O2+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _O2+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt5+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,129 :: 		LCD_Out(1,1,"FLUJO =");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,130 :: 		LCD_Out(2,1,"HUMED =");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,131 :: 		LCD_Out(2,9,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,132 :: 		LCD_Out(3,1,"PRES =");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,133 :: 		LCD_Out(3,9,txt3);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,134 :: 		LCD_Out(4,1,"TEMP =");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,135 :: 		LCD_Out(4,9,txt4);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt4+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,136 :: 		LCD_Out(2,19,"O2");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       19
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,137 :: 		LCD_Out(3,15,txt5);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,138 :: 		duty = -3.6222*presion + 319.47;
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       32
	MOVWF       R4 
	MOVLW       210
	MOVWF       R5 
	MOVLW       231
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       41
	MOVWF       R4 
	MOVLW       188
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _duty+0 
	MOVF        R1, 0 
	MOVWF       _duty+1 
;ProyectoMicro.c,139 :: 		PWM3_Set_Duty(duty);
	MOVF        R0, 0 
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;ProyectoMicro.c,141 :: 		if(presion <= 30 || presion >= 80){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _presion+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main114
	MOVF        _presion+0, 0 
	SUBLW       30
L__main114:
	BTFSC       STATUS+0, 0 
	GOTO        L__main104
	MOVLW       128
	XORWF       _presion+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main115
	MOVLW       80
	SUBWF       _presion+0, 0 
L__main115:
	BTFSC       STATUS+0, 0 
	GOTO        L__main104
	GOTO        L_main37
L__main104:
;ProyectoMicro.c,142 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,143 :: 		PORTB.B2 = 1;
	BSF         PORTB+0, 2 
;ProyectoMicro.c,144 :: 		Sound_Play(329.63,500);
	MOVLW       73
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       244
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;ProyectoMicro.c,145 :: 		delay_ms(350);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       142
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	DECFSZ      R11, 1, 1
	BRA         L_main38
	NOP
;ProyectoMicro.c,146 :: 		}
	GOTO        L_main39
L_main37:
;ProyectoMicro.c,148 :: 		PORTB.B2 = 0;
	BCF         PORTB+0, 2 
;ProyectoMicro.c,149 :: 		}
L_main39:
;ProyectoMicro.c,150 :: 		if(humedad <= 90){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _humedad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main116
	MOVF        _humedad+0, 0 
	SUBLW       90
L__main116:
	BTFSS       STATUS+0, 0 
	GOTO        L_main40
;ProyectoMicro.c,151 :: 		menu = 6;
	MOVLW       6
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,152 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,153 :: 		}
	GOTO        L_main41
L_main40:
;ProyectoMicro.c,155 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,156 :: 		}
L_main41:
;ProyectoMicro.c,157 :: 		if(temperatura >= 40){     //TEMPERATURA
	MOVLW       128
	XORWF       _temperatura+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main117
	MOVLW       40
	SUBWF       _temperatura+0, 0 
L__main117:
	BTFSS       STATUS+0, 0 
	GOTO        L_main42
;ProyectoMicro.c,158 :: 		PORTB.B4 = 1;
	BSF         PORTB+0, 4 
;ProyectoMicro.c,159 :: 		}
	GOTO        L_main43
L_main42:
;ProyectoMicro.c,161 :: 		PORTB.B4 = 0;
	BCF         PORTB+0, 4 
;ProyectoMicro.c,162 :: 		}
L_main43:
;ProyectoMicro.c,164 :: 		if(edad == 1){                                                 //NIÑO
	MOVLW       0
	XORWF       _edad+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main118
	MOVLW       1
	XORWF       _edad+0, 0 
L__main118:
	BTFSS       STATUS+0, 2 
	GOTO        L_main44
;ProyectoMicro.c,165 :: 		flujo = (0.1*0.0978*ADC_Read(14))/2;
	MOVLW       14
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       75
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _flujo+0 
	MOVF        R1, 0 
	MOVWF       _flujo+1 
;ProyectoMicro.c,166 :: 		IntToStr(flujo,txt1);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,167 :: 		LCD_Out(1,9,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,169 :: 		}
L_main44:
;ProyectoMicro.c,170 :: 		if(edad == 2){                                                  //ADULTO
	MOVLW       0
	XORWF       _edad+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main119
	MOVLW       2
	XORWF       _edad+0, 0 
L__main119:
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
;ProyectoMicro.c,171 :: 		flujo = 0.1*0.0978*ADC_Read(14);
	MOVLW       14
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       75
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _flujo+0 
	MOVF        R1, 0 
	MOVWF       _flujo+1 
;ProyectoMicro.c,172 :: 		IntToStr(flujo,txt1);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,173 :: 		LCD_Out(1,9,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,174 :: 		}
L_main45:
;ProyectoMicro.c,175 :: 		if(presion1 >= 100){                 //TANQUES ALTERNANDO
	MOVLW       128
	XORWF       _presion1+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main120
	MOVLW       100
	SUBWF       _presion1+0, 0 
L__main120:
	BTFSS       STATUS+0, 0 
	GOTO        L_main46
;ProyectoMicro.c,176 :: 		PORTB.B0 = 1;
	BSF         PORTB+0, 0 
;ProyectoMicro.c,177 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;ProyectoMicro.c,178 :: 		}
L_main46:
;ProyectoMicro.c,179 :: 		if(presion2 >= 100){                   //TANQUES ALTERNANDO
	MOVLW       128
	XORWF       _presion2+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main121
	MOVLW       100
	SUBWF       _presion2+0, 0 
L__main121:
	BTFSS       STATUS+0, 0 
	GOTO        L_main47
;ProyectoMicro.c,180 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;ProyectoMicro.c,181 :: 		PORTB.B1 = 1;
	BSF         PORTB+0, 1 
;ProyectoMicro.c,182 :: 		}
L_main47:
;ProyectoMicro.c,183 :: 		if(PORTA.B1){while(PORTA.B0){}                      //VOLVER A INICIO
	BTFSS       PORTA+0, 1 
	GOTO        L_main48
L_main49:
	BTFSS       PORTA+0, 0 
	GOTO        L_main50
	GOTO        L_main49
L_main50:
;ProyectoMicro.c,184 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;ProyectoMicro.c,185 :: 		presion = 0;
	CLRF        _presion+0 
	CLRF        _presion+1 
;ProyectoMicro.c,186 :: 		humedad = 0;
	CLRF        _humedad+0 
	CLRF        _humedad+1 
;ProyectoMicro.c,187 :: 		temperatura = 0;
	CLRF        _temperatura+0 
	CLRF        _temperatura+1 
;ProyectoMicro.c,188 :: 		presion = 0;
	CLRF        _presion+0 
	CLRF        _presion+1 
;ProyectoMicro.c,189 :: 		menu = 0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProyectoMicro.c,190 :: 		}
L_main48:
;ProyectoMicro.c,191 :: 		}
	GOTO        L_main33
L_main34:
;ProyectoMicro.c,192 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,193 :: 		while(menu == 3){                          //SET TIME
L_main51:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main122
	MOVLW       3
	XORWF       _menu+0, 0 
L__main122:
	BTFSS       STATUS+0, 2 
	GOTO        L_main52
;ProyectoMicro.c,194 :: 		LCD_Out(1,5,"SET TIME");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,195 :: 		IntToStr(s_time,txtset_t);
	MOVF        _s_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _s_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtset_t+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtset_t+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,196 :: 		LCD_Out(2,5,txtset_t);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtset_t+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtset_t+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,198 :: 		if(PORTA.B2){
	BTFSS       PORTA+0, 2 
	GOTO        L_main53
;ProyectoMicro.c,199 :: 		s_time = s_time + 5;
	MOVLW       5
	ADDWF       _s_time+0, 1 
	MOVLW       0
	ADDWFC      _s_time+1, 1 
;ProyectoMicro.c,200 :: 		delay_ms(350);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       142
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
	NOP
;ProyectoMicro.c,201 :: 		}
L_main53:
;ProyectoMicro.c,202 :: 		if(PORTA.B3){
	BTFSS       PORTA+0, 3 
	GOTO        L_main55
;ProyectoMicro.c,203 :: 		s_time = s_time -5 ;
	MOVLW       5
	SUBWF       _s_time+0, 1 
	MOVLW       0
	SUBWFB      _s_time+1, 1 
;ProyectoMicro.c,204 :: 		delay_ms(350);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       142
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_main56:
	DECFSZ      R13, 1, 1
	BRA         L_main56
	DECFSZ      R12, 1, 1
	BRA         L_main56
	DECFSZ      R11, 1, 1
	BRA         L_main56
	NOP
;ProyectoMicro.c,205 :: 		}
L_main55:
;ProyectoMicro.c,206 :: 		if(PORTA.B0){while(PORTA.B0){}
	BTFSS       PORTA+0, 0 
	GOTO        L_main57
L_main58:
	BTFSS       PORTA+0, 0 
	GOTO        L_main59
	GOTO        L_main58
L_main59:
;ProyectoMicro.c,207 :: 		menu = 4;
	MOVLW       4
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,208 :: 		}
L_main57:
;ProyectoMicro.c,209 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,210 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVF        R0, 0 
	SUBLW       90
L__main123:
	BTFSS       STATUS+0, 0 
	GOTO        L_main60
;ProyectoMicro.c,211 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,212 :: 		}
	GOTO        L_main61
L_main60:
;ProyectoMicro.c,214 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,215 :: 		}
L_main61:
;ProyectoMicro.c,216 :: 		}
	GOTO        L_main51
L_main52:
;ProyectoMicro.c,217 :: 		while(menu == 4){                              //RUN CON TIEMPO
L_main62:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       4
	XORWF       _menu+0, 0 
L__main124:
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
;ProyectoMicro.c,218 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,219 :: 		flujo = 0.0978*ADC_Read(14);
	MOVLW       14
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       94
	MOVWF       R4 
	MOVLW       75
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _flujo+0 
	MOVF        R1, 0 
	MOVWF       _flujo+1 
;ProyectoMicro.c,220 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,221 :: 		temperatura = 0.244*2*ADC_Read(17);
	MOVLW       17
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       35
	MOVWF       R4 
	MOVLW       219
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ProyectoMicro.c,222 :: 		O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       39
	MOVWF       R4 
	MOVLW       160
	MOVWF       R5 
	MOVLW       137
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       71
	MOVWF       R4 
	MOVLW       114
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       111
	MOVWF       R4 
	MOVLW       146
	MOVWF       R5 
	MOVLW       124
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _O2+0 
	MOVF        R1, 0 
	MOVWF       _O2+1 
;ProyectoMicro.c,223 :: 		presion1 = 0.2672*ADC_Read(18)-14.997;
	MOVLW       18
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion1+0 
	MOVF        R1, 0 
	MOVWF       _presion1+1 
;ProyectoMicro.c,224 :: 		presion2 = 0.2672*ADC_Read(19)-14.997;
	MOVLW       19
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion2+0 
	MOVF        R1, 0 
	MOVWF       _presion2+1 
;ProyectoMicro.c,225 :: 		LCD_Out(1,1,"FLUJO = ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,226 :: 		LCD_Out(2,1,"HUMED = ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,227 :: 		LCD_Out(3,1,"PRESI = ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,228 :: 		LCD_Out(4,1,"TEMPE = ");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,229 :: 		LCD_Out(1,19,"O2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       19
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,230 :: 		duty = -3.6222*presion + 319.47; //ADULTO
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       32
	MOVWF       R4 
	MOVLW       210
	MOVWF       R5 
	MOVLW       231
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       41
	MOVWF       R4 
	MOVLW       188
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _duty+0 
	MOVF        R1, 0 
	MOVWF       _duty+1 
;ProyectoMicro.c,232 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _humedad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main125
	MOVF        _humedad+0, 0 
	SUBLW       90
L__main125:
	BTFSS       STATUS+0, 0 
	GOTO        L_main64
;ProyectoMicro.c,233 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,234 :: 		menu = 7;
	MOVLW       7
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,235 :: 		}
	GOTO        L_main65
L_main64:
;ProyectoMicro.c,237 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,238 :: 		}                                                       //NIÑO
L_main65:
;ProyectoMicro.c,240 :: 		while(time <= s_time){                              //CONTADOR DE SEGUNDOS
L_main66:
	MOVLW       128
	XORWF       _s_time+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _time+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main126
	MOVF        _time+0, 0 
	SUBWF       _s_time+0, 0 
L__main126:
	BTFSS       STATUS+0, 0 
	GOTO        L_main67
;ProyectoMicro.c,241 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,242 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,243 :: 		temperatura = 0.244*2*ADC_Read(17);
	MOVLW       17
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       35
	MOVWF       R4 
	MOVLW       219
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ProyectoMicro.c,244 :: 		presion1 = 0.2672*ADC_Read(18)-14.997;
	MOVLW       18
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion1+0 
	MOVF        R1, 0 
	MOVWF       _presion1+1 
;ProyectoMicro.c,245 :: 		presion2 = 0.2672*ADC_Read(19)-14.997;
	MOVLW       19
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion2+0 
	MOVF        R1, 0 
	MOVWF       _presion2+1 
;ProyectoMicro.c,246 :: 		O2 = -0.0042*pow(presion,2) + 0.7869*presion + 63.143;
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       39
	MOVWF       R4 
	MOVLW       160
	MOVWF       R5 
	MOVLW       137
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       71
	MOVWF       R4 
	MOVLW       114
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       111
	MOVWF       R4 
	MOVLW       146
	MOVWF       R5 
	MOVLW       124
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _O2+0 
	MOVF        R1, 0 
	MOVWF       _O2+1 
;ProyectoMicro.c,247 :: 		IntToStr(humedad,txt2);
	MOVF        _humedad+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _humedad+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt2+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,248 :: 		IntToStr(presion,txt3);
	MOVF        _presion+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _presion+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt3+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,249 :: 		IntToStr(temperatura,txt4);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt4+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,250 :: 		IntToStr(time,txttime);
	MOVF        _time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txttime+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txttime+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,251 :: 		IntToStr(O2,txt5);
	MOVF        _O2+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _O2+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt5+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,252 :: 		LCD_Out(2,9,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,253 :: 		LCD_Out(3,9,txt3);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,254 :: 		LCD_Out(4,9,txt4);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt4+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,255 :: 		LCD_Out(4,15,txttime);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txttime+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txttime+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,256 :: 		LCD_Out(3,20,"T");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       20
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,257 :: 		LCD_Out(2,15,txt5);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,258 :: 		duty = -3.6222*presion + 319.47;
	MOVF        _presion+0, 0 
	MOVWF       R0 
	MOVF        _presion+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       32
	MOVWF       R4 
	MOVLW       210
	MOVWF       R5 
	MOVLW       231
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       41
	MOVWF       R4 
	MOVLW       188
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _duty+0 
	MOVF        R1, 0 
	MOVWF       _duty+1 
;ProyectoMicro.c,259 :: 		PWM3_Set_Duty(duty);
	MOVF        R0, 0 
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;ProyectoMicro.c,261 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _humedad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main127
	MOVF        _humedad+0, 0 
	SUBLW       90
L__main127:
	BTFSS       STATUS+0, 0 
	GOTO        L_main68
;ProyectoMicro.c,262 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,263 :: 		}
	GOTO        L_main69
L_main68:
;ProyectoMicro.c,265 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,266 :: 		}
L_main69:
;ProyectoMicro.c,267 :: 		if(temperatura >= 40){     //TEMPERATURA
	MOVLW       128
	XORWF       _temperatura+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main128
	MOVLW       40
	SUBWF       _temperatura+0, 0 
L__main128:
	BTFSS       STATUS+0, 0 
	GOTO        L_main70
;ProyectoMicro.c,268 :: 		PORTB.B4 = 1;
	BSF         PORTB+0, 4 
;ProyectoMicro.c,269 :: 		}
	GOTO        L_main71
L_main70:
;ProyectoMicro.c,271 :: 		PORTB.B4 = 0;
	BCF         PORTB+0, 4 
;ProyectoMicro.c,272 :: 		}
L_main71:
;ProyectoMicro.c,274 :: 		if(presion <= 30 || presion >= 80){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _presion+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _presion+0, 0 
	SUBLW       30
L__main129:
	BTFSC       STATUS+0, 0 
	GOTO        L__main103
	MOVLW       128
	XORWF       _presion+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       80
	SUBWF       _presion+0, 0 
L__main130:
	BTFSC       STATUS+0, 0 
	GOTO        L__main103
	GOTO        L_main74
L__main103:
;ProyectoMicro.c,275 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,276 :: 		PORTB.B2 = 1;
	BSF         PORTB+0, 2 
;ProyectoMicro.c,277 :: 		Sound_Play(329.63,50);
	MOVLW       73
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       50
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;ProyectoMicro.c,278 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main75:
	DECFSZ      R13, 1, 1
	BRA         L_main75
	NOP
;ProyectoMicro.c,279 :: 		}
	GOTO        L_main76
L_main74:
;ProyectoMicro.c,281 :: 		PORTB.B2 = 0;
	BCF         PORTB+0, 2 
;ProyectoMicro.c,282 :: 		}
L_main76:
;ProyectoMicro.c,283 :: 		if(humedad <= 90){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _humedad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _humedad+0, 0 
	SUBLW       90
L__main131:
	BTFSS       STATUS+0, 0 
	GOTO        L_main77
;ProyectoMicro.c,284 :: 		menu = 7;
	MOVLW       7
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,285 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,286 :: 		}
L_main77:
;ProyectoMicro.c,288 :: 		if(edad == 1){                                                 //NIÑO
	MOVLW       0
	XORWF       _edad+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       1
	XORWF       _edad+0, 0 
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main78
;ProyectoMicro.c,289 :: 		flujo = (0.1*0.0978*ADC_Read(14))/2;
	MOVLW       14
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       75
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _flujo+0 
	MOVF        R1, 0 
	MOVWF       _flujo+1 
;ProyectoMicro.c,290 :: 		IntToStr(flujo,txt1);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,291 :: 		LCD_Out(1,9,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,293 :: 		}
L_main78:
;ProyectoMicro.c,294 :: 		if(edad == 2){                                                  //ADULTO
	MOVLW       0
	XORWF       _edad+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVLW       2
	XORWF       _edad+0, 0 
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
;ProyectoMicro.c,295 :: 		flujo = 0.1*0.0978*ADC_Read(14);
	MOVLW       14
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       75
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _flujo+0 
	MOVF        R1, 0 
	MOVWF       _flujo+1 
;ProyectoMicro.c,296 :: 		IntToStr(flujo,txt1);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProyectoMicro.c,297 :: 		LCD_Out(1,9,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,298 :: 		}
L_main79:
;ProyectoMicro.c,299 :: 		if(presion1 >= 100){   //TANQUES ALTERNANDO
	MOVLW       128
	XORWF       _presion1+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVLW       100
	SUBWF       _presion1+0, 0 
L__main134:
	BTFSS       STATUS+0, 0 
	GOTO        L_main80
;ProyectoMicro.c,300 :: 		PORTB.B0 = 1;
	BSF         PORTB+0, 0 
;ProyectoMicro.c,301 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;ProyectoMicro.c,302 :: 		}
L_main80:
;ProyectoMicro.c,303 :: 		if(presion2 >= 100){     //TANQUES ALTERNANDO
	MOVLW       128
	XORWF       _presion2+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVLW       100
	SUBWF       _presion2+0, 0 
L__main135:
	BTFSS       STATUS+0, 0 
	GOTO        L_main81
;ProyectoMicro.c,304 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;ProyectoMicro.c,305 :: 		PORTB.B1 = 1;
	BSF         PORTB+0, 1 
;ProyectoMicro.c,306 :: 		}
L_main81:
;ProyectoMicro.c,307 :: 		if(PORTA.B1){
	BTFSS       PORTA+0, 1 
	GOTO        L_main82
;ProyectoMicro.c,308 :: 		menu = 0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProyectoMicro.c,309 :: 		}
L_main82:
;ProyectoMicro.c,310 :: 		time++;
	INFSNZ      _time+0, 1 
	INCF        _time+1, 1 
;ProyectoMicro.c,311 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main83:
	DECFSZ      R13, 1, 1
	BRA         L_main83
	DECFSZ      R12, 1, 1
	BRA         L_main83
	DECFSZ      R11, 1, 1
	BRA         L_main83
	NOP
	NOP
;ProyectoMicro.c,312 :: 		}
	GOTO        L_main66
L_main67:
;ProyectoMicro.c,313 :: 		menu = 5;         //SESION TERMINADA
	MOVLW       5
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,315 :: 		}
	GOTO        L_main62
L_main63:
;ProyectoMicro.c,316 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,317 :: 		while(menu == 5){              //SESION TERMINADA
L_main84:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main136
	MOVLW       5
	XORWF       _menu+0, 0 
L__main136:
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
;ProyectoMicro.c,318 :: 		LCD_Out(2,3,"SESION TERMINADA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,319 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;ProyectoMicro.c,320 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;ProyectoMicro.c,321 :: 		PORTB.B2 = 0;
	BCF         PORTB+0, 2 
;ProyectoMicro.c,322 :: 		PORTB.B4 = 0;
	BCF         PORTB+0, 4 
;ProyectoMicro.c,323 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;ProyectoMicro.c,324 :: 		if(PORTA.B0){while(PORTA.B0){}
	BTFSS       PORTA+0, 0 
	GOTO        L_main86
L_main87:
	BTFSS       PORTA+0, 0 
	GOTO        L_main88
	GOTO        L_main87
L_main88:
;ProyectoMicro.c,325 :: 		menu = 0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProyectoMicro.c,326 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;ProyectoMicro.c,327 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;ProyectoMicro.c,328 :: 		PORTB.B2 = 0;
	BCF         PORTB+0, 2 
;ProyectoMicro.c,329 :: 		PORTB.B4 = 0;
	BCF         PORTB+0, 4 
;ProyectoMicro.c,330 :: 		s_time = 0;
	CLRF        _s_time+0 
	CLRF        _s_time+1 
;ProyectoMicro.c,331 :: 		time = 0;
	CLRF        _time+0 
	CLRF        _time+1 
;ProyectoMicro.c,332 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;ProyectoMicro.c,333 :: 		presion = 0;
	CLRF        _presion+0 
	CLRF        _presion+1 
;ProyectoMicro.c,334 :: 		humedad = 0;
	CLRF        _humedad+0 
	CLRF        _humedad+1 
;ProyectoMicro.c,335 :: 		temperatura = 0;
	CLRF        _temperatura+0 
	CLRF        _temperatura+1 
;ProyectoMicro.c,336 :: 		presion = 0;
	CLRF        _presion+0 
	CLRF        _presion+1 
;ProyectoMicro.c,337 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,338 :: 		}
L_main86:
;ProyectoMicro.c,339 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,340 :: 		if(humedad <= 90){     //HUMEDAD
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main137
	MOVF        R0, 0 
	SUBLW       90
L__main137:
	BTFSS       STATUS+0, 0 
	GOTO        L_main89
;ProyectoMicro.c,341 :: 		PORTB.B3 = 1;
	BSF         PORTB+0, 3 
;ProyectoMicro.c,342 :: 		}
	GOTO        L_main90
L_main89:
;ProyectoMicro.c,344 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;ProyectoMicro.c,345 :: 		}
L_main90:
;ProyectoMicro.c,346 :: 		}
	GOTO        L_main84
L_main85:
;ProyectoMicro.c,347 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,348 :: 		while(menu == 6){
L_main91:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVLW       6
	XORWF       _menu+0, 0 
L__main138:
	BTFSS       STATUS+0, 2 
	GOTO        L_main92
;ProyectoMicro.c,349 :: 		LCD_Out(2,3,"FALTA DE AGUA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,350 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,351 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,353 :: 		if(presion <= 30 || presion >= 80){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _presion+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVF        _presion+0, 0 
	SUBLW       30
L__main139:
	BTFSC       STATUS+0, 0 
	GOTO        L__main102
	MOVLW       128
	XORWF       _presion+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main140
	MOVLW       80
	SUBWF       _presion+0, 0 
L__main140:
	BTFSC       STATUS+0, 0 
	GOTO        L__main102
	GOTO        L_main95
L__main102:
;ProyectoMicro.c,354 :: 		presion = 0.2672*ADC_Read(16)-14.997;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       182
	MOVWF       R4 
	MOVLW       243
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _presion+0 
	MOVF        R1, 0 
	MOVWF       _presion+1 
;ProyectoMicro.c,355 :: 		PORTB.B2 = 1;
	BSF         PORTB+0, 2 
;ProyectoMicro.c,356 :: 		Sound_Play(329.63,500);
	MOVLW       73
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       244
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;ProyectoMicro.c,357 :: 		delay_ms(350);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       142
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_main96:
	DECFSZ      R13, 1, 1
	BRA         L_main96
	DECFSZ      R12, 1, 1
	BRA         L_main96
	DECFSZ      R11, 1, 1
	BRA         L_main96
	NOP
;ProyectoMicro.c,358 :: 		}
	GOTO        L_main97
L_main95:
;ProyectoMicro.c,360 :: 		PORTB.B2 = 0;
	BCF         PORTB+0, 2 
;ProyectoMicro.c,361 :: 		}
L_main97:
;ProyectoMicro.c,363 :: 		if(humedad >= 95){
	MOVLW       128
	XORWF       _humedad+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       95
	SUBWF       _humedad+0, 0 
L__main141:
	BTFSS       STATUS+0, 0 
	GOTO        L_main98
;ProyectoMicro.c,364 :: 		menu = 8;
	MOVLW       8
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,365 :: 		}
L_main98:
;ProyectoMicro.c,366 :: 		}
	GOTO        L_main91
L_main92:
;ProyectoMicro.c,367 :: 		LCD_Cmd(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProyectoMicro.c,368 :: 		while(menu == 7){
L_main99:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVLW       7
	XORWF       _menu+0, 0 
L__main142:
	BTFSS       STATUS+0, 2 
	GOTO        L_main100
;ProyectoMicro.c,369 :: 		LCD_Out(2,3,"FALTA DE AGUA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_ProyectoMicro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_ProyectoMicro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,370 :: 		humedad = 0.1543*ADC_Read(15)-23.817;
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       210
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       30
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       55
	MOVWF       R4 
	MOVLW       137
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _humedad+0 
	MOVF        R1, 0 
	MOVWF       _humedad+1 
;ProyectoMicro.c,371 :: 		LCD_Out(3,15,txttime);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txttime+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txttime+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProyectoMicro.c,373 :: 		if(humedad >= 95){
	MOVLW       128
	XORWF       _humedad+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVLW       95
	SUBWF       _humedad+0, 0 
L__main143:
	BTFSS       STATUS+0, 0 
	GOTO        L_main101
;ProyectoMicro.c,374 :: 		menu = 4;
	MOVLW       4
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProyectoMicro.c,375 :: 		}
L_main101:
;ProyectoMicro.c,377 :: 		}
	GOTO        L_main99
L_main100:
;ProyectoMicro.c,378 :: 		}
	GOTO        L_main6
;ProyectoMicro.c,379 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
