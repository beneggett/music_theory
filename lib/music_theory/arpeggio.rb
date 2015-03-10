require 'music_theory/output'

module MusicTheory
  class Arpeggio
    include MusicTheory::Output

    attr_accessor :third, :duration, :all_notes, :output_file_name

    def initialize(third, options = {})
      @duration = options[:duration] || 0.25
      @third = third
      @output_file_name = options[:output_file_name] || 'chord' # File name to write (without extension)
    end

    def arpeggionate
       third.all_notes.each {|note| note.duration = duration}
       third.all_notes + [third.all_notes[2], third.all_notes[1], third.all_notes[0], third.all_notes[1]]
    end

    def samples
      arpeggionate.map(&:samples).flatten
    end

  end
end
