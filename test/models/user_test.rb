require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test that by entering wrong data abou the user with empty fields wont save it into the database
  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
    end

  # test that by entering wrong password length won't save the user into the database.
    test 'should not save invalid user password length' do
      user = User.new
      user.email= 'oj@oj.com'
      user.password= '128'
      user.save
      refute user.valid?
      end

  # test that by inputting correct format data regarding the user (email, password) will save the user successfully into the database.
    test 'should save valid user' do
      user = User.new
      user.email= 'oj@oj.com'
      user.password= '123678'
      user.save
      assert user.valid?
    end
end
