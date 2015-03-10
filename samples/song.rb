require 'music_theory'


low_a = 220 # Middle A
middle_c = 261.6 # Middle C
middle_d = 293.665 # Middle D
middle_f = 349.228 # Middle F
middle_g_sharp = 415.30 # Middle G#
middle_a = 440 # A

frequency = [low_a, middle_c, middle_d, middle_f, middle_g_sharp, middle_a ].sample

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

pattern_2 = [
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 1, duration: 0.25 },
  { notes: 4, duration: 0.5 },
  { notes: 4, duration: 0.5 },
  { notes: 3, duration: 0.5 },
  { notes: 1, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.125 },
  { notes: 4, duration: 0.125 },
  { notes: 3, duration: 0.125 },
  { notes: 4, duration: 0.125 },
  { notes: 3, duration: 0.25 },
  { notes: 1, duration: 0.25 } ]

pattern_3 = [
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 1, duration: 0.25 },
  { notes: 4, duration: 0.5 },
  { notes: 4, duration: 0.5 },
  { notes: 3, duration: 0.5 },
  { notes: 1, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.125 },
  { notes: 4, duration: 0.125 },
  { notes: 6, duration: 0.125 },
  { notes: 4, duration: 0.125 },
  { notes: 3, duration: 0.25 },
  { notes: 1, duration: 0.25 } ]

patterns = [pattern, pattern_2, pattern_3]

base_note = MusicTheory::Scale.new :major, frequency: frequency
base_note_2 = MusicTheory::Scale.new :major, frequency: frequency * 2
base_note_3 = MusicTheory::Scale.new :major, frequency: frequency * 3

melody = pattern.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration] ) }
melody_2 = pattern_2.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration] ) }
melody_3 = pattern_3.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration] ) }

distorted_melody = pattern.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration], distort: true ) }
distorted_melody_2 = pattern_2.map {|note| MusicTheory::Note.new( frequency: base_note_2.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration], distort: true ) }
distorted_melody_3 = pattern_3.map {|note| MusicTheory::Note.new( frequency: base_note_3.scale_notes[ note[:notes] - 1].frequency, duration: note[:duration], distort: true ) }

scale = MusicTheory::Scale.new :major, distort: false, frequency: frequency, duration: 0.5
distorted_scale = MusicTheory::Scale.new :major, distort: true, frequency: frequency, duration: 0.5

clean_chord_progression = [scale.i.chord,  scale.v.chord, scale.vi.chord, scale.iv.chord]
distorted_chord_progression = [distorted_scale.i.chord,  distorted_scale.v.chord, distorted_scale.vi.chord, distorted_scale.iv.chord]


melody_samples =  melody.map(&:samples).flatten
melody_samples_2 =  melody_2.map(&:samples).flatten
melody_samples_3 =  melody_3.map(&:samples).flatten
melodies = [melody_samples, melody_samples_2, melody_samples_3]

first_chords = scale.i.chord.samples + scale.v.chord.samples
second_chords = scale.vi.chord.samples + scale.iv.chord.samples

first_harmony = MusicTheory::Harmonize.new melodies.sample, first_chords
second_harmony = MusicTheory::Harmonize.new melodies.sample, second_chords
harmonies = [first_harmony, second_harmony]

distorted_melody_samples =  distorted_melody.map(&:samples).flatten
distorted_melody_samples_2 =  distorted_melody_2.map(&:samples).flatten
distorted_melody_samples_3 =  distorted_melody_3.map(&:samples).flatten
distorted_melodies = [distorted_melody_samples, distorted_melody_samples_2, distorted_melody_samples_3]

distorted_first_chords = distorted_scale.i.chord.samples + distorted_scale.v.chord.samples
distorted_second_chords = distorted_scale.vi.chord.samples + distorted_scale.iv.chord.samples

mixed_first_harmony = MusicTheory::Harmonize.new distorted_melodies.sample, first_chords
mixed_second_harmony = MusicTheory::Harmonize.new distorted_melodies.sample, second_chords
mixed_harmonys = [mixed_first_harmony, mixed_second_harmony]


distorted_first_harmony = MusicTheory::Harmonize.new distorted_melodies.sample, distorted_first_chords
distorted_second_harmony = MusicTheory::Harmonize.new distorted_melodies.sample, distorted_second_chords
distorted_harmonys = [distorted_first_harmony, distorted_second_harmony]

song = melody  + harmonies + mixed_harmonys + distorted_harmonys  + distorted_chord_progression.map {|x| x.duration = 0.50; x } + [scale.i.chord]

p = MusicTheory::Play.new song
