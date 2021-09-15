# Portable-Oxygen-Concentrator
Oxygen Concentrator based on the WHO technical specifications for oxygen concentrators

This was a class project for the microprocessors class at my university. The project was to make an Oxygen generator it didn't matter the type or application, but after researching I decided to make a portable concetrator, something that I thought it would be more interesting for me at the time. So I implemented the [WHO technical specifications for oxygen concentrators](https://www.who.int/publications/i/item/9789241509886), there's a lot to consider specially for whom might use the concentrator. 

# Requirements #

- ISIS proteus 8.11 
- MicroC
- Microchip PIC18F45K22

# Considerations #

This project is based on the Pressure Swing Process (PSA) concentrators, and it considers both pedriatic and geriatic usage, according to the WHO technical specifications it requires:
- A flowrate up to 2 LPM for infants and up to 10 LPM for adults
- An oxygen concentration greater than 85% or near 100% (100% oxygen is almost never used because it's poisonous)
  -  Most concentrators produce an oxygen concentrator between 82% and 96%, the oxygen concentrator must activate an alarm if the concentration is less than 82%
- The oxygen concentrator must maintain the maximum rated flowrate at 40°C, 95% relative humidity

# Hardware used #

- An LCD display (20 x 4)
- 4 buttons
- A buzzer speaker
- Pressure sensor (MPX4250)
- 2 relays (valves)
- 3 LEDs
- Temperature sensor (TO92-100)
- Relative humidity sensor (HIH5030)
- A motor (pump)
- Potentiometer (flowrate control)

## Circuit schematic ##

![Circuit](https://github.com/AbeRodz/Portable-Oxygen-Concentrator/blob/main/Circuit.JPG "Schematic")

# How to use it? # 
After installing Proteus, and MicroC, you need to generate and .hex file, and upload it to the PIC on Proteus, then you can check the simulation.
