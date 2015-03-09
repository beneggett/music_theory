require 'music_theory/output'

module MusicTheory
  class Octave
    include MusicTheory::Output
    attr_accessor :starting_note, :number_of_octaves, :direction, :output_file_name, :all_notes

    def initialize(options = {})
      @starting_note    = options[:starting_note] || MusicTheory::Note.new      # Note to start on
      @number_of_octaves= options[:number_of_octaves] || 2                      # Number of octaves to repeat
      @direction        = options[:direction] ||  'asc'                         # Number of seconds per note
      @output_file_name = options[:output_file_name] || 'octave' # File name to write (without extension)
      @all_notes = []
      all_notes << starting_note
      number_of_octaves.to_i.times do
        new_note = all_notes.last.clone
        if direction == 'asc'
          new_note.frequency = all_notes.last.frequency * 2
        elsif direction == 'desc'
          new_note.frequency = all_notes.last.frequency / 2
        end
        all_notes << new_note unless new_note.frequency > 20000
      end
    end

    def samples
      all_notes.map(&:samples).flatten
    end

    def sample_rate
      starting_note.sample_rate
    end
  end

end
