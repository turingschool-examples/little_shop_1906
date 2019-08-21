class Cart

  attr_reader :contents

  def initialize(initial_contents)
     @contents = initial_contents || Hash.new(0)
  end

  def add_item(id)
    @contents[id.to_s] = count_of(id) + 1
  end

  def total_count
    @contents.values.sum
  end

  def count_of(id)
      @contents[id.to_s].to_i
  end



end
