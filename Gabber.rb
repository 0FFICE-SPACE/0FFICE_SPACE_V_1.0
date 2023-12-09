# Welcome to Sonic Pi
define :kickov do
  live_loop :gabber do
    sample :bd_zum
    sample :bd_808
    sample :bd_fat
    with_synth :gabberkick do
      play 22
      play 32
      sample :glitch_bass_g, amp: 0.3
      sleep 0.3
    end
  end
end

define :beati do
  live_loop :snare, sync: :gabber do
    a = sample :elec_fuzz_tom, amp: 0.6
    sleep 0.15
  end
end

define :synco do
  live_loop :hat, sync: :gabber do
    s = sample :elec_hi_snare
    sleep ([0.15, 0.3]).choose
  end
end

define :drop do
  live_loop :glitch, sync: :gabber do
    g = sample :glitch_perc1
    h = sample :hat_sci
    sleep ([0.15, 0.3]).choose
  end
end

/ Main /
with_fx :reverb, mix: 0.5 do
  kickov
end
sleep 9.3
beati
sleep 9.6
synco
sleep 19.2
drop


