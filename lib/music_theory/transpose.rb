require 'music_theory/output'

module MusicTheory
  class Transpose
    include MusicTheory::Output

    attr_accessor :samples

    def initialize(*things_to_flatten)
      @samples = []
      [*things_to_flatten].each do |group|
        group.each_with_index do |value, i|
         @samples[i] ||= 0
         @samples[i] +=  value
        end
      end
       max = @samples.map {|s| s.abs }.max
       multiplier = 1.0 / max
       @samples.map!{ |s| multiplier * s }
    end




  end
end
