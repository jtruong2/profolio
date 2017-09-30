def stub_linkedin
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
    "provider"=>"linkedin",
    "uid"=>"AbC123",
    "info"=> {
      "name"=>"John Doe",
      "email"=>"john@doe.com",
      "nickname"=>"John Doe",
      "first_name"=>"John",
      "last_name"=>"Doe",
      "location"=>"Greater Boston Area, US",
      "description"=>"Senior Developer, Hammertech",
      "image"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
      "phone"=>"null",
      "headline"=> "Senior Developer, Hammertech",
      "industry"=>"Internet",
      "urls"=>{
        "public_profile"=>"http://www.linkedin.com/in/johndoe"
      }
    },
  })
end
