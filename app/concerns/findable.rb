module Findable
  def find_or_create_by_name(string)
    find_by_name(string) || create_by_name(string) unless string.empty?
  end

  def find_by_name(string)
    all.detect{|o| o.name == string}
  end

  def create_by_name(string)
    new.tap{|o| o.name = string}
  end
end