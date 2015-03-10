require 'music_theory/output'
require 'music_theory/scale_steps'

module MusicTheory
  class Scale
    include MusicTheory::Output
    include MusicTheory::ScaleSteps
    attr_accessor :starting_note, :output_file_name, :all_notes, :scale_type, :scale_notes, :distort, :duration, :frequency

    def initialize(scale_type  = :major, options = {})
      @scale_type       = scale_type
      @distort          = options[:distort] || false
      @duration         = options[:duration] || 0.5
      @frequency        = options[:frequency] || 220.0
      @starting_note    = create_new_note(frequency)     # Note to start on
      @output_file_name = options[:output_file_name] || 'scale' # File name to write (without extension)
      set_all_notes
      set_scale_notes
    end

    def twelfth_root_of_two
      2 ** (1.0/12)
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

    def create_new_note(note_frequency)
      MusicTheory::Note.new( frequency: note_frequency, duration: duration, distort: distort)
    end

    def set_all_notes
      @all_notes = [@starting_note]
      12.times do
        new_note = create_new_note(all_notes.last.frequency * twelfth_root_of_two)
        all_notes << new_note
      end
    end

    def samples
      scale_notes.map(&:samples).flatten
    end

    def third
      third ||= MusicTheory::Third.new self
    end

    def arpeggio
      arpeggio ||= third.arpeggio
    end

    def chord
      third.chord
    end

  end

end
