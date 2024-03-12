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
            place_1 = FactoryBot.create(:place, name: "Thayu Hotel")
            place_2 = FactoryBot.create(:place, name: "Como Cafe")

            get "/api/v1/places?search_term=Como"
            parsed_body = JSON.parse(response.body)
            expected_response = (
                {
                    places: [
                       {
                           name: place_2.name,
                           city: place_2.city,
                           most_recent_download_speed: nil,
                           most_recent_download_units: nil,
                           number_of_measurements: 0
                       }.stringify_keys
                    ]
                   }.stringify_keys
            )
            assert_equal expected_response, parsed_body
         
        end

        test "answers no places if search term does not match any place" do
            FactoryBot.create(:place, name: "Starbucks")
            get "/api/v1/places?search_term=Blah"

            parsed_body = JSON.parse(response.body)

            expected_response = {"places": []}.stringify_keys
            assert_equal expected_response, parsed_body
        end
    
    end
end
