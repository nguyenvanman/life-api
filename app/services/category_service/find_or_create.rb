module CategoryService::FindOrCreate
  def self.call(name)
    Category.find_or_create_by!(name: name)
  end
end