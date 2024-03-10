require "test_helper"

module Api
    class PlacesControllerTest < ActionDispatch::IntegrationTest
        test "answers places that match search term is empty" do
            # create data
            place = FactoryBot.create(:place)
            # hit an end point to see if the response is correct
                get "/api/v1/places?search_term="
                # expect (response.response).to eq(200)
                parsed_body = JSON.parse(response.body)
            # binding.break
           expected_response = (
                {
                     places: [
                        {
                            name: place.name,
                            city: place.city,
                            most_recent_download_speed: nil,
                            most_recent_download_units: nil,
                            number_of_measurements: 0
                        }.stringify_keys
                     ]
                    }.stringify_keys
            )
            assert_equal expected_response, parsed_body
    end

        test "answers all places if search term is set" do
            place_1 = FactoryBot.create(:place, "Nifty")
            place_2 = FactoryBot.create(:place, "Muna Tree")

            get "/api/v1/places?search_term=Nifty"
            parsed_body = JSON.parse(response.body)
            expected_response = (
                {
                    places: [
                       {
                           name: place_1.name,
                           city: place_1.city,
                           most_recent_download_speed: nil,
                           most_recent_download_units: nil,
                           number_of_measurements: 0
                       }.stringify_keys
                    ]
                   }.stringify_keys
            )
            assert_equal expected_response, parsed_body
         
        end
    end
end
