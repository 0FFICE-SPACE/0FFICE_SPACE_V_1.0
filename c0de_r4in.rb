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
      k = play 34, sustain: 60, pan_slide: 0.1875, gain_slide: 0.2, attack: 10, attack_level: 0.6,sustain_level: 0.6, release: 25
      control k, slide_pan: rrand(-1, 1), slide_gain: rrand(0.2, 0.5)
    end
  end
  
  sleep 30
  
end
define :drip do
  live_loop :drip do
    with_fx :reverb do
      with_fx :lpf, cutoff: 70 do
        sample :hat_zap, amp: 20
        sleep rrand(0.5, 3)
      end
      if one_in 3
        with_fx :lpf, cutoff: 90 do
          sample :hat_tap, amp: 20
          sleep rrand(0.2, 1.4)
        end
      end
    end
    
  end
end

define :thunder do
  with_fx :reverb,room: 1, damp: 1 do
    sample :drum_bass_hard, rate: 0.2, amp: 25, attack: 0, release: 4
  end
  with_fx :lpf, cutoff: 40 do
    sample :drum_roll,attack: 0.1, release: 0.2
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
          k = play 10, sustain: 60, pan_slide: 0.1875, attack: 10, attack_level: 0.4,sustain_level: 0.4 ,  release: 25
          control k, slide_pan: rrand(-1, 1)
        end
      end
    end
  end
  sleep 5
  
  with_synth :pnoise do |j|
    with_fx :lpf, cutoff: 70 do
      with_fx :pitch_shift, pitch: 1 do
        with_fx :reverb do
          j = play 10, sustain: 60, pan_slide: 0.1875, gain_slide: 0.2, attack: 30, attack_level: 0.4, release: 25
          control j, slide_pan: rrand(-1, 1)
        end
      end
    end
  end
  sleep 15
end

live_loop :main do
  thunder
  
end

