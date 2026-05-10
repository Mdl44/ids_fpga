#27 Mhz
#1 / 27.000.000 = 37.037 nanosecunde
#Waveform {0 18.518} -> Duty cycle de 50% (37.037 / 2 = 18.518).

create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}]
