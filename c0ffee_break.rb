'
-------------------------------------------------------

C 0 F F E E _ B R E A K

  ,`)
  ;)( 
 :----:
C|====|
 |    |
 `----`

-------------------------------------------------------
'



live_loop :guit do
  rate = [ 0.5,0.625,0.5,0.625,0.75,0.5,0.5,0.75].tick
  print rate
  sample :guit_e_fifths, rate: rate
  sample :guit_e_slide, rate: rate/2
  sample :guit_em9, rate: rate
  sample :guit_harmonics, rate: rate*3
  sample :loop_safari
  sample :loop_drone_g_97, rate: rate/2
  
  
  sleep sample_duration(:loop_safari)/2
end