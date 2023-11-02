'
-------------------------------------------------------

S T A T I O N E R Y _ V 1 L L A G E

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠁⠀⠈⠙⠳⣦⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠈⢷⡄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⣠⣴⠶⣦⡄⠀⠀⠀⠈⣿⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⣠⡾⠋⠀⠀⢈⡿⠀⠀⠀⢀⣿⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⣠⡾⠋⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⣠⡾⠋⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⣠⡾⠋⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠉⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣾⠋⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣿⡀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⢷⣄⡀⠀⢀⣴⠟⠁⠀⠀⢠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

-------------------------------------------------------
'

# Test octave function
use_bpm 120

define :bassline do
  use_synth :square
  with_fx :lpf do
    
    play (octs (knit :c1, 4, :f1, 4, :a1,4,:g1,4 ).tick, 3).choose
    
  end
  sleep 0.5
end

define :leadline do
  use_synth :tri
  with_fx :krush do |k|
    control k, slide_gain: rrand(0, 5)
    a = play (octs (knit :c3, 4, :d3, 4, :e3,4,:f3,4 ).tick, 2).choose, pan_slide: 0.1875, note_slide: 0.075
    control a, note: ( octs (knit :e3, 4, :f3, 4, :g3,4,:a3,4 ).tick, 2).choose, pan: rrand(-1, 1)
    control k, slide_gain: rrand(0, 5)
    sleep 0.375
    control a, note: (octs (knit :c3, 4, :d3, 4, :e3,4,:f3,4 ).tick, 2).choose, pan: rrand(-1, 1)
    control k, slide_gain: rrand(0, 5)
  end
end


live_loop :main do
  bassline
  leadline
end

live_loop :perc, sync: :main do
  sample :bd_haus
  sleep 0.875*2
  sample :bd_zum
  sleep 0.875
  sample :bd_tek
  sleep 0.875
end

