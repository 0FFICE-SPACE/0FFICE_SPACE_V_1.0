'
-------------------------------------------------------
  ,----,------------------------------,------.
  | ## |    P R I N T E R _ J A M     |    - |
  | ## |                              |    - |
  |    |------------------------------|    - |
  |    ||............................||      |
  |    ||,-                        -.||      |
  |    ||___                      ___||    ##|
  |    ||---`------------------------||      |
  ''--''|_|______________________==__|''----''
-------------------------------------------------------
'

key = :c3


sleep_time =  0.75

define :my_sound do
  
  use_synth :bass_foundation
  sample :bass_thick_c, pan: [-1,-0.5,0,0.5,1].choose, rate: rrand_i(1, 4), amp: 0.6
  sample :bass_thick_c, pan: [-1,-0.5,0,0.5,1].choose, rate: rrand_i(1, 4), amp: 0.6
  play choose(chord(key, :minor)), release: rrand(0, 1), cutoff: rrand(60, 130)
  play choose(chord(key, :minor)), release: rrand(0, 1), cutoff: rrand(60, 130)
  play choose(chord(key-7, :minor7)), release: rrand(0, 1), cutoff: rrand(60, 130)
  play choose(chord(key+7, :minor, num_octaves: 3)), release: rrand(0, 1), cutoff: rrand(60, 130)
  sleep sleep_time
end


live_loop :kick do
  
  with_fx :reverb, room: 0.5 do
    with_fx :compressor, pre_amp: 10 do
      with_fx :distortion, distort: 0.5 do
        if one_in 8
          density 6 do
            sample :drum_heavy_kick, sustain_level: 1, decay: 0.1
            sample :drum_cymbal_closed
            sleep sleep_time
          end
          if one_in 4
            density 3 do
              sample :drum_heavy_kick, sustain_level: 1, decay: 0.1
              sample :drum_tom_mid_hard
              sleep sleep_time
            end
          end
        else
          sample :drum_heavy_kick, sustain_level: 1, decay: 0.1
          sleep sleep_time
        end
      end
    end
  end
end

live_loop :bleep, sync: :kick do
  
  if one_in 8
    density 4 do
      my_sound
    end
    sample :mehackit_robot2, amp: 0.6
    
  end
  if one_in 4
    density 2 do
      my_sound
      sample :elec_filt_snare, release: rrand(0, 1), cutoff: rrand(60, 130)
    end
    sample :loop_amen, start: 0.3, finish: 0.5, pan: [-1,-0.5,0,0.5,1].choose
  else
    my_sound
  end
end

live_loop :hat, sync: :kick do
  sample :drum_cymbal_hard
  sleep sleep_time *2
end

live_loop :tom, sync: :kick do
  sample :drum_tom_lo_hard
  sleep sleep_time
  sample :drum_tom_lo_hard
  sleep sleep_time
end

