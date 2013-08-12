require 'spec_helper'

describe ViewsController do
  common_lets

  describe 'index' do
    before { user }
    it 'has no cookie set' do
      expect {
        get :index
      }.to change(User, :count).by(1)
    end

    it 'has cookie set but does not match' do
      request.cookies[:notacms] = '0'
      expect {
        get :index
      }.to change(User, :count).by(1)

    end

    it 'has cookie set and matches user' do
      request.cookies[:notacms] = user.id.to_s
      expect {
        get :index
      }.to change(User, :count).by(0)

    end
  end

end
