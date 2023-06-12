# Welcome to Sonic Pi
'
-------------------------------------------------------
 ______________
||            ||
||            ||
||            ||
||            ||
||____________|| T H E _ I T _ R 0 0 M
|______________|
 \\############\\
  \\############\\
   \      ____    \   
    \_____\___\____\CA15 
-------------------------------------------------------
'

use_sample_bpm :loop_electric
time = sample_duration :loop_electric
define :riff do
  with_fx :reverb, mix: 0.5 do
    with_fx :compressor, mix: 0.6 do
      with_fx :distortion, distort: 0.4 do
        sample :loop_electric
      end
    end
  end
end
define :driver do |length|
  with_fx :ixi_techno, phase: length do
    use_synth :prophet
    play :a1, sustain: time*length, amp: 1
  end
end

define :kick do
  with_fx :compressor, pre_amp: 20 do
    sample :drum_bass_hard
  end
end


define :snare do
  with_fx :compressor, pre_amp: 5 do
    sample :sn_dolf
  end
end

define :hat do
  with_fx :compressor, pre_amp: 20 do
    with_fx :lpf , cutoff: 90 do
      sample:elec_cymbal, attack: 0.05, release: 0.2
    end
  end
end

define :un_tshh do
  2.times do
    kick
    sleep 0.125
    snare
    hat
    sleep 0.125
    kick
    sleep 0.125
    kick
    snare
    sleep 0.125
  end
  
end


# MAIN

driver 4
4.times do
  riff
  sleep 1
end
driver 16
8.times do
  riff
  density [1,1,2,2,4,4,8,16].tick do
    kick
    sleep 1
  end
end
kill driver 1
riff
16.times do
  kick
  sleep 0.03125
end
driver 8
8.times do
  riff
  
  with_fx :distortion ,distort: 0.4 do
    un_tshh
  end
  
end

1.times do
  kill driver 1
  riff
  sleep 1
end

driver 16
in_thread do
  16.times do
    riff
    with_fx :distortion ,distort: 0.4 do
      un_tshh
    end
  end
end
in_thread do
  128.times do
    if one_in 8
      density 3 do
        hat
        sleep 0.125
      end
      
    else
      hat
      
      splash = sample :drum_splash_hard, amp: 0.6
      
      sleep 0.125
    end
  end
end
