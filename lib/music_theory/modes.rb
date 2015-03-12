module MusicTheory
  class Modes
    S         = 1
    T         = 2
    I         = [T, T, S, T, T, T, S]
    II        = I.rotate
    III       = I.rotate(2)
    IV        = I.rotate(3)
    V         = I.rotate(4)
    VI        = I.rotate(5)
    VII       = I.rotate(6)
    CHROMATIC = [S,S,S,S,S,S,S,S,S,S,S,S]

    # Map the music theory names as class methods

    def self.ionian; I; end
    self.singleton_class.send(:alias_method, :major, :ionian)
    self.singleton_class.send(:alias_method, :i, :ionian)

    def self.dorian; II; end
    self.singleton_class.send(:alias_method, :ii, :dorian)

    def self.phrygian; III; end
    self.singleton_class.send(:alias_method, :iii, :phrygian)

    def self.lydian; IV; end
    self.singleton_class.send(:alias_method, :iv, :lydian)

    def self.mixolydian; V; end
    self.singleton_class.send(:alias_method, :v, :mixolydian)

    def self.aeolian; VI; end
    self.singleton_class.send(:alias_method, :minor, :aeolian)
    self.singleton_class.send(:alias_method, :vi, :aeolian)

    def self.locrian; VII; end
    self.singleton_class.send(:alias_method, :vii, :locrian)

    def self.chromatic; CHROMATIC; end

  end

end
