require 'spec_helper'

describe "Views" do
  common_lets
  context 'cookies' do
    context 'no cookie' do
      it do
        expect {
          get views_path
        }.to change(User, :count).by(1)
      end
    end

    context 'cookie exists' do
      before { user }
      it 'user does not match cookie' do
        expect {
          get views_path, {}, {"HTTP_COOKIE" => "notacms=0"}
        }.to change(User, :count).by(1)
      end

      it 'user matches cookie' do
        expect {
          get views_path, {}, {"HTTP_COOKIE" => "notacms=#{user.id}"}
        }.to change(User, :count).by(0)
      end
    end

    context 'sets cookie' do
      it do
        expect {
          get views_path
        }.to change(User, :count).by(1)
        expect {
          get views_path
        }.to change(User, :count).by(0)
      end
    end
  end

  context 'Menus', js: true  do
    before do
      menu
      menu_other
    end
    it 'new user' do
      visit views_path
      expect(page).not_to have_selector("#dialog#{content.id}")
    end
    it 'existing user' do
      visit views_path
      click_link 'Start'
      click_link menu.content_text
      expect(page).to have_selector("#dialog#{content.id}")
    end
  end
end
