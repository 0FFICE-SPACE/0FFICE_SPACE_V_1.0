# MSN MESSENGER LOVE LANGUAGE

b = [0.05, 0.075, 0.1, 0.125]

define :drum_bass do
  in_thread do
    loop do
      sample :drum_heavy_kick
      sleep 1
    end
  end
end

define :strum do |chord|
  use_synth :blade
  3. times do
    play chord.tick attack_level: 2, attack: 0.05, sustain: 2, release: 2
    sleep 0.05
  end
  play chord, attack: 0.85, release: 2
end


define :twinkle do |chord, r|
  (r * 4).times do
    use_synth :blade
    play choose(chord), release: choose(b)
    sleep choose(b)
  end
end



strum(chord(:C4, :minor7))
sleep 2
strum(chord(:C4, :minor))
sleep 2
strum(chord(:G4, :minor7))
sleep 0.5
strum(chord(:D4, :minor7))
sleep 0.5
strum(chord(:C4, :minor7))
twinkle(chord(:D4, :minor7), 1)
twinkle(chord(:G4, :minor7), 1)
twinkle(chord(:C4, :minor7), 2)
sleep 3
strum(chord(:D4, :minor7))
sleep 1
twinkle(chord(:G4, :minor7), 1)
twinkle(chord(:C4, :minor7), 2)
twinkle(chord(:D4, :minor7), 1)
sleep 2
strum(chord(:G4, :minor7))
twinkle(chord(:G4, :minor7), 3)




