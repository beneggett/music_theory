require 'music_theory'


frequency = 349.228 # Middle F

pattern = [
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 0.75 },
  { notes: 5, duration: 0.5 },
  { notes: 3, duration: 0.5 },
  { notes: 3, duration: 0.5 },
  { notes: 1, duration: 0.5 },
  { notes: 4, duration: 0.25 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 0.75 },
  { notes: 4, duration: 0.5 },
  { notes: 3, duration: 0.25 },
  { notes: 4, duration: 1.0 },
  { notes: 1, duration: 0.25 },
  { notes: 1, duration: 0.5 },
  { notes: 3, duration: 0.75 }
  ];

base_note = MusicTheory::Scale.new :mixolydian, frequency: frequency;

melody = pattern.map {|note| MusicTheory::Note.new( frequency: base_note.scale_notes[ note[:notes] ].frequency, duration: note[:duration] ) };
scale = MusicTheory::Scale.new :major, distort: false, frequency: frequency, duration: 0.5;

chord_progression = [scale.vi.chord,  scale.v.chord, scale.v.chord, scale.i.chord];

melody_samples =  melody.map(&:samples).flatten;

chord_progression_samples = chord_progression.map(&:samples).flatten;

harmonization = MusicTheory::Harmonize.new(melody_samples, chord_progression_samples);

song = melody + [harmonization]

p = MusicTheory::Play.new song
