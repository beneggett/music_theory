require 'music_theory'

frequency = 293.665 # Middle D
scale = MusicTheory::Scale.new :major, distort: false, frequency: frequency, duration: 0.5
arpeggios = [scale.i.arpeggio,  scale.iv.arpeggio, scale.v.arpeggio, scale.iv.arpeggio]
chords = [scale.i.chord,  scale.iv.chord, scale.v.chord, scale.iv.chord]
harmony = MusicTheory::Harmonize.new arpeggios.map(&:samples).flatten, chords.map(&:samples).flatten

p = MusicTheory::Play.new arpeggios +  [harmony] + [scale.i.chord]
