

    CITY SHOW VIEW ATTRACTIONS NOT WORKING:
    <ul>
      <% @city.attractions.each do |attraction| %>
      <li><%= attraction.name %></li>
      <li><%= attraction.review %></li>
      <% end  %>
    </ul>

    SEPARATING VISIED FROM YET-TO-VISIT:

I want to add an if statement to my countries/index.erb so that only the countries I have visited show up. How to do this?

Could I add an if statement to the for loop? (Tried but does not work):
  <%= if country.has_visited_country == true %>


    AUTOFILL ON FORM COUNTRIES/NEW:

How can I have the form autocomplete has_visited_country from whether visits_to_country is >0?

    ADD A NEW CITY:

How can I add a new city so that it is linked to the country and shows up there? Where would I put the function to add a new city?

    CREATE A TOTAL-VISITED METHOD FOR HOMEPAGE

My thinking so far but returns nil (on Country model):

def self.count_if_visited()
  countries = self.all
  total_visited = countries.reduce(0) do |total, country|
    total + 1 if country.has_visited_country == true
  end
end

    ATTRACTION TO COUNTRY CASCADE POSSIBLE?

As attraction is the lowest item on my database, is there a way to add a new attraction that then fills in the city table & country table?
