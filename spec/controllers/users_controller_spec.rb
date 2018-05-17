require 'rails_helper'

RSpec.describe UsersController, type: :controller do

let!(:user) { create(:user) }

  it 'create_bad_user' do
    post :create,
    params: {
      user: {
        firstname: 'firstname',
        lastname: 'lastname',
        email: 'email@gmail.ua',
        username: 'username',
        password: ''
      }
    }
    expect(JSON.parse(response.body)).to eql({
      "errors" => "Password can't be blank"
    })
  end

  it 'create_good_user' do
    post :create,
    params: {
      user: {
        firstname: user.firstname,
        lastname: user.lastname,
        email: user.email,
        username: user.username,
        password: user.password
      }
    }

    expect(JSON.parse(response.body)).to eql({
      "errors" => "Email has already been taken"
    })
  end
end
