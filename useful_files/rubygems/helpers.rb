def make_gemfile
  %i[each_entry].flat_map do |sym|
    Gem::Specification.to_enum(sym).map  do |spec|
      "gem \'#{spec.name}\', :version => \'#{spec.version}\'"
    end
  end
end
