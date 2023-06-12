'
            /\
/vvvvvvvvvv \-----------------------------------,
`^^^^^^^^^^ /=================================="
            \/

                B 0 S S _ F I G H T

            /\
/vvvvvvvvvv \-----------------------------------,
`^^^^^^^^^^ /=================================="
            \/
'


rate = 1
sample_time = sample_duration(:loop_amen_full)/rate

define :amen do |rate|
  
  if one_in 2
    sample :loop_amen_full, start: 0.75, finish: 1, pan: [-1,-0.5,0,0.5,1].choose, rate: rate
  end
  if one_in 2
    sample :loop_amen_full, start: 0.25, finish: 0.5, pan: [-1,-0.5,0,0.5,1].choose, rate: rate
  end
  if one_in 2
    sample :loop_amen_full, start: 0.5, finish: 0.75, pan: [-1,-0.5,0,0.5,1].choose, rate: rate
  else
    sample :loop_amen_full, start: 0.0, finish: 0.25, pan: [-1,-0.5,0,0.5,1].choose, rate: rate
  end
  
end

define :key_change do
  key = [:e4, :f4, :c4, :e3].choose
end
define :bass_key_change do
  key = [:e2, :f2, :c2, :e1].choose
end


define :drum_pattern do |rate|
  sample :drum_bass_hard
  with_fx :flanger,wave: 4, phase: 1, phase_slide: 5 do |e|
    with_fx :distortion, distort: 0.8 do
      amen rate
      control e, phase: [1, 2, 4].choose
    end
  end
end

sample :drum_roll, amp:2


live_loop :main, delay: 6 do
  if one_in 4
    density 8 do
      sample :drum_bass_hard
      
      density 2 do
        sample :drum_tom_mid_soft
        sample :drum_cymbal_closed
        
      end
      sleep sample_time/4
    end
  else
    drum_pattern rate
    sleep sample_time/4
  end
  key_change
  bass_key_change
end


live_loop :lead do
  use_synth :chiplead
  play choose(chord(key_change, :minor, num_ocataves: 4)), release: 0.3, cutoff: rrand(60, 120)
  sleep sample_time/64
end


live_loop :bass, sync: :main, delay: 2 do
  use_synth :chipbass
  play choose(chord(bass_key_change, :minor, num_ocataves: 4)), release: 0.3, cutoff: rrand(60, 120)
  sleep sample_time/32
end






