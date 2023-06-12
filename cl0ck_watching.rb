# Welcome to Sonic Pi

'
-------------------------------------------------------
  _______
 /  12   \
|    |    |
|9   |   3| 
|     \   |
|         |
 \___6___/

C L 0 C K _ W A T C H I N G
-------------------------------------------------------
'
use_bpm 120


define :tick_tock do
  sample :bass_trance_c
  sleep 1
  sample :bass_voxy_hit_c
  sleep 1
end

define :bass_loop do | notes|
  use_synth :tb303
  play notes, sustain: [4,2,8].choose, amp: 0.5, attack: 0.2
  use_synth :hoover
  play notes, sustain: [4,2,8].choose, amp: 0.5, attack: 0.5
end

live_loop :time do
  tick_tock
  sample :bass_hit_c
end
live_loop :lead, sync: :time, delay: 31 do
  4.times do
    use_synth :tech_saws
    notes = [:c4, :c4, :e4].tick
    play notes,amp: 1.1
    sleep 0.25
  end
  if one_in 2
    4.times do
      use_synth :tech_saws
      notes = [:c4, :c5, :g4].tick
      play notes ,amp: 1.4
      sleep 0.25
    end
  else
    4.times do
      use_synth :tech_saws
      notes = [:c4, :c4, :f4].tick
      play notes,amp: 1.2
      sleep 0.25
    end
  end
  if one_in 8
    sample :ambi_drone
  end
end

live_loop :bass, sync: :time, delay: 127 do
  bass_loop [:c2, :c3, :c2].tick
  sleep 4
  bass_loop [:c2, :c1, :g2].choose
  sleep 2
  bass_loop [:c2, :c3, :f2].choose
  sleep 2
end
