require 'english/dresner'
require 'test/unit'

class TC_Dresner < Test::Unit::TestCase

  def test_dresner
    # assert_still_legible ;-)
    assert_nothing_raised { "How are you today?".en.dresner }
  end

  #def test_dresner
  #  # assert_still_legible ;-)
  #  assert_nothing_raised { "How are you today?".dresner! }
  #end

end

