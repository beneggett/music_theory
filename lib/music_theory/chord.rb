require 'music_theory/output'

module MusicTheory
  class Chord
    include MusicTheory::Output

    attr_accessor :third, :duration, :all_notes, :output_file_name

    def initialize(third, options = {})
      @duration = options[:duration] || 2.0
      @third = third
      @output_file_name = options[:output_file_name] || 'chord' # File name to write (without extension)
    end

    def flatten_third
       third.all_notes.each {|note| note.duration = duration}
       new_samples = []
       sample_count = third.all_notes.first.samples.count
       third.samples.in_groups_of(sample_count).each do |group|
         group.each_with_index do |value, i|
           new_samples[i] ||= 0
           new_samples[i] +=  value
         end
       end
       normalize_samples(new_samples)
    end

    def normalize_samples(new_samples)
       max = new_samples.map {|s| s.abs }.max
       multiplier = 1.0 / max
       new_samples.map!{ |s| multiplier * s }
     end

    def samples
      flatten_third
    end

  end
end
