require 'music_theory/output'

module MusicTheory
  class Scale
    include MusicTheory::Output
    attr_accessor :starting_note, :number_of_octaves, :direction, :output_file_name, :all_notes, :scale_type, :scale_notes, :distort, :duration, :frequency, :sample_rate

    def initialize(scale_type  = :major, options = {})
      @scale_type = scale_type
      @distort          = options[:distort] || false
      @duration         = options[:duration] || 0.5
      @frequency        = options[:frequency] || 220.0
      @starting_note    = create_new_note     # Note to start on

      @number_of_octaves= options[:number_of_octaves] || 2                      # Number of octaves to repeat
      @direction        = options[:direction] ||  'asc'                         # Number of seconds per note
      @output_file_name = options[:output_file_name] || 'scale' # File name to write (without extension)
      set_all_notes
      set_scale_notes
    end

    def third
      third ||= MusicTheory::Third.new self
    end

    def chord
      third.chord
    end

    def twelth_root_of_two
      (2 ** (1.0/12))
    end

    def mode
       MusicTheory::Modes.send(scale_type)
    end

    def set_scale_notes
      @scale_notes = [all_notes.first]
      note_index = 0
      mode.each do |interval|
        note_index +=  interval
        scale_notes << all_notes[note_index]
      end
    end

    def create_new_note
      MusicTheory::Note.new( frequency: frequency, duration: duration, distort: distort)
    end

    def set_all_notes
      @all_notes = [@starting_note]
      12.times do
        new_note = create_new_note
        new_note.frequency  = (all_notes.last.frequency * twelth_root_of_two)
        all_notes << new_note
      end
    end

    def samples
      scale_notes.map(&:samples).flatten
    end

    def sample_rate
      starting_note.sample_rate
    end

  end

end
