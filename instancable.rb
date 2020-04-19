module Instancable
  attr_accessor :instances

  alias_method :all, :instances

  def find(option)
    attribute = option.keys.first
    value = option[attribute]

    all.each do |instance|
      if instance.method(attribute).call == value
        return instance
      end
    end
  end
end