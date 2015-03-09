module MusicTheory
  module Output

    def sample_rate
      22050
    end

    def format
      WaveFile::Format.new :mono, :pcm_16, sample_rate
    end

    def buffer_format
      WaveFile::Format.new :mono, :float, sample_rate
    end

    def output_track
      WaveFile::Writer.new "#{output_file_name || 'music'}.wav", format do |writer|
        buffer = WaveFile::Buffer.new samples, buffer_format
        writer.write buffer
      end
    end

    def play
      output_track # unless File.file?("#{output_file_name}.wav")
      `afplay #{output_file_name}.wav`
      nil
    end

  end
end
