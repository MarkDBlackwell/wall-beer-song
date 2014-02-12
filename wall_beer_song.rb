=begin
Author: Mark D. Blackwell
Dates:
2007 - created.
2014 - improved code style.
=end

class WallBeerSong
# INITIAL_BOTTLES_NUMBER = 5
  INITIAL_BOTTLES_NUMBER = 99
       ONE_BOTTLE_NUMBER = 1
       NO_BOTTLES_NUMBER = 0
  PHRASE_GO_STORE  = 'go to the store and buy some more'
  PHRASE_ON_WALL   = 'on the wall'
  PHRASE_TAKE_DOWN = 'take one down and pass it around'

  def count()
    INITIAL_BOTTLES_NUMBER.downto(ONE_BOTTLE_NUMBER) do |number|
      yield "#{
          first_clause                                   number
          };\n#{PHRASE_TAKE_DOWN}: #{
                phrase_bottles        bottles_left       number
          } #{  PHRASE_ON_WALL}.\n\n"
    end
    yield   "#{
          first_clause                        NO_BOTTLES_NUMBER
          }!\n#{PHRASE_GO_STORE.capitalize}...#{
                phrase_bottles           INITIAL_BOTTLES_NUMBER
          } #{  PHRASE_ON_WALL}. :)\n"
  end

  private

  def      bottles_left(number)
    number - ONE_BOTTLE_NUMBER
  end

  def first_clause(    number)
    s = phrase_bottles number
    "#{s.capitalize} #{PHRASE_ON_WALL}, #{s}"
  end

  def phrase_bottles(number)
    maybe_plural  =  number == ONE_BOTTLE_NUMBER ? '' : 's'
    "#{              number == NO_BOTTLES_NUMBER ? 'no more' : number.to_s
        } bottle#{maybe_plural} of beer"
  end
end

WallBeerSong.new.count{|verse| print verse}
