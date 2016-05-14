json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :website, :description, :president
  json.url club_url(club, format: :json)
end
