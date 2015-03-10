module MusicTheory
  module ScaleSteps # Concern for Scale

    def i
      self
    end

    def ii
      set_scale_step(1)
    end

    def iii
      set_scale_step(2)
    end

    def iv
      set_scale_step(3)
    end

    def v
      set_scale_step(4)
    end

    def vi
      set_scale_step(5)
    end

    def vii
      set_scale_step(6)
    end

    def viii
      set_scale_step(7)
    end

    private

    def set_scale_step(jump)
      new_chord_scale =  MusicTheory::Scale.new scale_type, distort: distort, frequency: scale_notes[jump].frequency, duration: duration
      new_chord_scale
    end

  end
end
