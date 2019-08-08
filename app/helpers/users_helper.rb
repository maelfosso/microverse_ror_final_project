module UsersHelper
  def photo_path(user)
    user.photo_path || user.photo_path = "avatars/#{rand 1..4}.png"
  end

  def countries
    JSON.parse(Faraday.get('https://restcountries.eu/rest/v2/all?fields=name').body)
  end
end
