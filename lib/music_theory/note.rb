require 'music_theory/output'

module MusicTheory
  class Note
    include MusicTheory::Output
    attr_accessor :frequency,  :duration, :output_file_name, :distort

    def initialize(options = {})
      @frequency        = options[:frequency] || 440.0          # Note frequency in Hz
      @frequency        = @frequency.to_f
      @duration         = options[:duration] ||  1.0            # Number of seconds per note
      @distort          = options[:distort] || false
      @output_file_name = options[:output_file_name] || 'note'  # File name to write (without extension)
    end

    def total_frames
      # We want 1 second of the note, so we need 1 second's worth of frames
      (duration * sample_rate).to_i
    end

    def cycles_per_frame
      # each frame, we want this fraction of a cycle:
      frequency / sample_rate
    end

    def sine_wave_cycle
      # A cycle is a full sine wave, which is 2π radians:
      2 * Math::PI * cycles_per_frame
    end

    def samples
      # So to create a note that's one second long, we need to write out all the samples in the sine waves
      phase = 0
      samples = total_frames.times.map do
        sample = (Math.sin phase).to_f
        phase += sine_wave_cycle
        sample
      end
      samples = distort!(samples) if distort
      samples
    end

    def distort!(samples)
      samples.map do |sample|
        negative = sample < 0
        sample *= 8.to_f
        if sample.abs > 5
          sample = 5
          sample *= -1 if negative
        end
        sample /= 8.to_f
      end
    end

  end

end
