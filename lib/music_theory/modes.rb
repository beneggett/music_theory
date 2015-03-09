require 'music_theory/output'

module MusicTheory
  class Modes
    include MusicTheory::Output
    S = 1
    T = 2
    I = [T, T, S, T, T, T, S]
    II = I.rotate
    III = I.rotate(2)
    IV = I.rotate(3)
    V = I.rotate(4)
    VI = I.rotate(5)
    VII = I.rotate(6)
    CHROMATIC = [S,S,S,S,S,S,S,S,S,S,S,S]

    # Map the music theory names as class methods

    def self.ionian; I; end
    self.singleton_class.send(:alias_method, :major, :ionian)
    def self.dorian; II; end
    def self.phrygian; III; end
    def self.lydian; IV; end
    def self.mixolydian; V; end
    def self.aeolian; VI; end
    self.singleton_class.send(:alias_method, :minor, :aeolian)
    def self.locrian; VII; end
    def self.chromatic; CHROMATIC; end


  end

end
