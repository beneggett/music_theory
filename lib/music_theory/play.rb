require 'music_theory/output'

module MusicTheory
  class Play
    include MusicTheory::Output
    attr_accessor :samples, :output_file_name, :playable_music

    def initialize(playable_music = [], options = {} )
      @playable_music    = playable_music
      @output_file_name  = options[:output_file_name] || 'music'
      @play              = options[:play] || true
      extract_samples
      play if play
    end

    def extract_samples
      @samples = playable_music.map  { |music| music.samples }.flatten
    end
  end

end
