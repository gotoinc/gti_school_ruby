require_relative 'instancable.rb'
require_relative 'idable.rb'

class User
  class UniqNameError < StandardError; end

  private_class_method :new

  attr_accessor :id, :name, :email

  extend Instancable
  extend Idable

  self.instances = []
  self.current_id = 0

  def initialize(name, email)
    @name = name
    @email = email
    self.class.current_id += 1
    self.class.instances << self
    @id = self.class.current_id
  end

  def self.add(options)
    # if valid?(options[:name])
    #   new(options[:name], options[:email])
    # end

    begin
      validate_name!(options[:name])
      new(options[:name], options[:email])
    rescue UniqNameError => e
      e.message
    end
  end

  def self.validate_name!(name)
    names = instances.map { |user| user.name }
    if names.include?(name)
      raise UniqNameError, "This name already exist"
    end
  end

  def self.valid?(name)
    names = instances.map { |user| user.name }
    !names.include?(name)
  end
end
