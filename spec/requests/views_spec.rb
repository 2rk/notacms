require 'spec_helper'

module CapybaraExtension
  def drag_by(right_by, down_by)
    base.drag_by(right_by, down_by)
  end
end

module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    #resynchronize { driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform }
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform
  end
end

::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension



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
      User.delete_all
      visit views_path
    end
    it 'create user' do
      expect(User.count).to eq(1)
      expect(page).not_to have_selector("#dialog#{content.id}")
      visit views_path
      expect(page).not_to have_selector("#dialog#{content.id}")
    end
    context 'click start and menu item' do
      before do
        click_link 'Start'
        click_link menu.content_text
      end
      it 'creates window' do
        expect(page).to have_selector("#dialog#{content.id}")
      end
      it 'move window' do
        sleep(1)
        p Capybara.current_session.driver.browser.page_source
        el =  Capybara.current_session.driver.browser.find_elements :class_name, 'ui-dialog-titlebar'
        p el
        el1 = el.first
        el1.drag_by(100,100)
        #Capybara.current_session.driver.browser.action.drag_and_drop_by(el.first, '200px', '200px' )
        #Capybara.current_session.driver.browser.action.drag_by(el.first, '200px', '200px' )
        #Capybara.current_session.driver.browser.action.drag_and_drop_by(el.first, 1000,1000)
        #Capybara.current_session.driver.browser.action.click_and_hold(el1).move_by(200,200).release().perform

        #sleep(10)
        #Capybara.current_session.driver.browser.action #.down("#dialog#{content.id}").move_to(200,200).up.perform
      end
      it 'meme' do
        sleep(1)
        page.find('.ui-dialog-titlebar').drag_by(30, 0)
        #p 'hello'
      end

      context 'when page reloaded' do
        before { visit views_path }
        it 'returns previously open window' do
          expect(page).to have_selector("#dialog#{content.id}")
        end
      end
    end
  end
end
