require 'music_theory'
frequency = 349.228 # Middle F

pattern = [
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 1, duration: 0.25 },
  { notes: 4, duration: 0.5 },
  { notes: 4, duration: 0.5 },
  { notes: 5, duration: 0.5 },
  { notes: 4, duration: 0.25 },
  { notes: 5, duration: 0.25 },
  { notes: 6, duration: 0.25 },
  { notes: 5, duration: 0.25 },
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 0.25 }
]

base_note = MusicTheory::Scale.new :major, frequency: frequency

melody = pattern.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration] ) }

scale = MusicTheory::Scale.new :major, distort: false, frequency: frequency, duration: 0.5
clean = [scale.i.chord,  scale.v.chord, scale.vi.chord, scale.iv.chord]

melody_samples =  melody.map(&:samples).flatten

first_chords = scale.i.chord.samples + scale.v.chord.samples
second_chords = scale.vi.chord.samples + scale.iv.chord.samples

first_harmony = MusicTheory::Harmonize.new melody_samples, first_chords
second_harmony = MusicTheory::Harmonize.new melody_samples, second_chords
harmonies = [first_harmony, second_harmony]

p = MusicTheory::Play.new melody  + harmonies + harmonies + clean.map {|x| x.duration = 0.50; x } + [scale.i.chord]
