# Welcome to Sonic Pi

define :bops do
  live_loop :bass_drum do
    sample :bd_klub, amp: rand
    sleep choose([0.1,0.2,0.3])
    if one_in 10
      sample :bd_klub, amp: rand
      with_synth :sc808_snare do
        density 10 do
          play rrand_i(45, 67), amp: rand(0.4), attack: rand(0.1), attack_level: rand(0.4), release: rand(0.3)
          with_synth :beep do
            play scale(([:Eb2,:Ab2,:Db2]).choose, :major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
          end
          sleep 1
        end
      end
    end
  end
  
  live_loop :hat do
    with_swing 0.1 do
      sample :hat_bdu, amp: rand, release: rand
    end
    sleep choose([0.1,0.2,0.3])
  end
end

define :bleeps do
  with_fx :reverb, mix: 0.2 do
    live_loop :b, sync: :bass_drum do
      play scale(([:Eb2,:Ab2,:Db2]).choose, :major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
      sleep 0.1
    end
  end
end

define :bloops do
  with_fx :reverb, mix: 0.4 do
    live_loop :bass, sync: :b do
      with_synth :beep do
        play scale(([:Eb2,:Ab2,:Db2]).choose, :major_pentatonic, num_octaves: 2).tick, release: 0.32, amp: rand
      end
      sleep 0.3
    end
  end
end



/ MAIN /
bops
sleep 15
bloops
bleeps



