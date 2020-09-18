require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new



describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    # Arrange
    hand = ["King", "Queen"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 20
  end

  it 'calculates aces as 11 where it does not go over 21' do

    # Arrange
    hand = ["Ace", 5, 3]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 19
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    # Arrange
    hand = ["Ace", 7, 5]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13
  end

  it 'raises an ArgumentError for invalid cards' do

    # Arrange
    hand = [13, 3, 5, "Queen"]

    # Assert
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError, "Invalid Card"
  end
  # The code isn't executing until the expect method wants it to. It's an argument for the expect method.

  it 'raises an ArgumentError for scores over 21' do

    # Arrange
    hand = [5, 3, 5, "Queen"]

    # Act && Assert
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError, "Bust"
  end

end


# My sketch
# describe "blackjack_score"
# it "king and jack score" do
#   # arrange
#   hand = ["king", "jack"]
#   # act
#   score = count(hand)
#   # assert
#   expect(score).must_equal 20
#   end
#
# # more tests in same format
# end