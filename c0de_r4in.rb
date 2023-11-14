'
-------------------------------------------------------
      __   _   ___
    _(  )_( )_(   )
   (C 0 D E  R A I N)
   ( _   _    _   _) 
  / /(_) (__) (__) 
 / / / / / / / /
/ / / / / / / /


-------------------------------------------------------
'

define :rain do
  with_fx :hpf, cutoff: 80 do
    with_synth :pnoise do |k|
      k = play 34, sustain: 60, pan_slide: 0.1875, gain_slide: 0.2, attack: 10, attack_level: 0.7, release: 25
      control k, slide_pan: rrand(-1, 1), slide_gain: rrand(0.2, 0.5)
    end
  end
  sleep 30
  
end

define :thunder do
  with_fx :nlpf do
    sample :bass_hard_c
  end
  sleep 1
end

define :lightning do
  
end
define :wind do
  with_synth :pnoise do |k|
    with_fx :reverb do
      with_fx :lpf, cutoff: 80  do
        with_fx :ping_pong do
          k = play 34, sustain: 60, pan_slide: 0.1875, gain_slide: 0.2, attack: 10, attack_level: 0.7, release: 25
          control k, slide_pan: rrand(-1, 1)
        end
      end
    end
  end
  sleep 30
end

live_loop :main do
  wind
  rain
end

