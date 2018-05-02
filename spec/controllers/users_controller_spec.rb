require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it 'create_bad_user' do
    post :create,
    params: {
      user: {
        firstname: Faker::Name.name,
        lastname: Faker::Name.name,
        email: Faker::Internet.email,
        username: "",
        password: Faker::Internet.password
      }
    }

    expect(JSON.parse(response.body)).to eql({
      "errors" => "Username can't be blank"
    })
  end

  it 'create_good_user' do
    post :create,
    params: {
      user: {
        firstname: Faker::Name.name,
        lastname: Faker::Name.name,
        email: Faker::Internet.email,
        username: Faker::Internet.user_name,
        password: Faker::Internet.password
      }
    }

    expect(JSON.parse(response.body)).to eql({
      "message" => "user created, now confirm your email"
    })
  end
end
