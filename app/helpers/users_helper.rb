module UsersHelper
  def photo_path(user)
    user.photo_path ||
    (user.update(photo_path: "avatars/#{rand 1..4}.png") && user.photo_path)
  end

  def countries
    JSON.parse(Faraday.get('https://restcountries.eu/rest/v2/all?fields=name').body)
  end
end
