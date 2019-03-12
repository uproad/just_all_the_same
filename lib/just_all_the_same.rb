require "just_all_the_same/version"

module JustAllTheSame
  class ::Array
    def all_nil?
      all?(nil)
    end
  end
end
