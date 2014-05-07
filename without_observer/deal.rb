class Deal
  attr_accessor :title, :state

  def initialize(title)
    @title = title
    @state = "new"
  end
end