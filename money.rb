class Money
  attr_reader :value

  def initialize
    @value ||= 0
  end

  def push(rate)
    @value += rate
  end

  def all
    @value = 0
  end
end
