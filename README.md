# MusicTheory

Learn Music through Ruby!

Based on my presentation at MtnWest Ruby Conference.

[Slides on SpeakerDeck](https://speakerdeck.com/beneggett/writing-music-with-ruby)

[Recording on Confreaks.tv](http://confreaks.tv/videos/mwrc2015-writing-music-with-ruby-a-subtle-introduction-to-music-theory)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'music_theory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install music_theory

## Usage

Play any of the sample songs by running them with ruby

```
ruby samples/arpeggios.rb
```


``` ruby
require 'music_theory'
```
Make new notes

```
MusicTheory::Note.new
```

Play Notes

```
MusicTheory::Note.new.play
```

Create scales

```
MusicTheory::Scale.new
```

Play Scales

```
MusicTheory::Scale.new.play
```

Play chords
```
MusicTheory::Scale.new.chord.play
```

Play third
```
MusicTheory::Scale.new.third.play
```

Play arpeggios
```
MusicTheory::Scale.new.arpeggio.play
```



## Contributing

1. Fork it ( https://github.com/[my-github-username]/music_theory/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Thanks

1. URUG community
2. Alex Speller (for indirect inspiration)
