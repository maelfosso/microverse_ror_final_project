module UsersHelper
  def countries
    JSON.parse(Faraday.get('https://restcountries.eu/rest/v2/all?fields=name').body)
  end
end
