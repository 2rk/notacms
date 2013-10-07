require 'spec_helper'

describe MenusController do
  render_views
  common_lets

  before :all do
    Fracture.define_selector :new_menu_link
    Fracture.define_selector :cancel_new_menu_link
    Fracture.define_selector :edit_menu_link
    Fracture.define_selector :cancel_edit_menu_link
  end

  #context 'not logged in' do
  #  #before { sign_out user }
  #
  #  {index: :get, show: :get, new: :get, create: :post, edit: :get, update: :put, destroy: :delete}.each do |v, m|
  #    it "#{m} #{v} should logout" do
  #      self.send(m, v, id: menu)
  #      should redirect_to new_user_session_path
  #    end
  #  end
  #end

  context 'logged in as user' do
    #before { sign_in user }

    describe 'GET index' do
      before do
        menu
        menu_other
        get :index
      end

      it { should assign_to(:menus).with([menu, menu_other]) }
      it { should render_template :index }
      it { should have_only_fractures(:new_menu_link) }
    end

    describe 'GET show' do
      before { get :show, id: menu }

      it { should assign_to(:menu).with(menu) }
      it { should render_template :show }
      it { should have_only_fractures(:edit_menu_link) }
    end

    describe 'GET new' do
      before { get :new }

      it { should assign_to(:menu).with_kind_of(Menu) }
      #it { should assign_to('menu.parent').with(parent) }
      it { should render_template :new }
      it { should have_only_fractures :cancel_new_menu_link }
      #it { should have_a_form.that_is_new.with_path_of(menus_path)}
    end

    describe 'POST create' do
      context 'valid' do
        before do
          Menu.any_instance.stub(:valid?).and_return(true)
          post :create
        end

        it { should redirect_to menu_path(Menu.last) }
        it { should assign_to(:menu).with(Menu.last) }
        #it { should assign_to('menu.parent').with(parent) }
      end

      context 'invalid' do
        before do
          Menu.any_instance.stub(:valid?).and_return(false)
          post :create
        end

        it { should assign_to(:menu).with_kind_of(Menu) }
        #it { should assign_to('menu.parent').with(parent) }
        it { should render_template :new }
        it { should have_only_fractures :cancel_new_menu_link }
        #it { should have_a_form.that_is_new.with_path_of(menus_path)}
      end
    end

    describe 'GET edit' do
      before { get :edit, id: menu }

      it { should assign_to(:menu).with(menu) }
      it { should render_template :edit }
      it { should have_only_fractures :cancel_edit_menu_link }
      #it { should have_a_form.that_is_edit.with_path_of(menu_path) }
    end

    describe 'PUT update' do
      context 'valid' do
        before do
          Menu.any_instance.stub(:valid?).and_return(true)
          put :update, id: menu
        end

        it { should assign_to(:menu).with(menu) }
        it { should redirect_to menu_path(menu) }
      end
      context 'invalid' do
        before do
          menu
          Menu.any_instance.stub(:valid?).and_return(false)
          put :update, id: menu
        end

        it { should assign_to(:menu).with(menu) }
        it { should render_template :edit }
        it { should have_only_fractures :cancel_edit_menu_link }
        #it { should have_a_form.that_is_edit.with_path_of(menu_path) }
      end
    end

    describe 'DELETE destroy' do
      before { delete :destroy, id: menu }

      it { expect(Menu.find_by_id(menu.id)).to be_nil }
      it { should redirect_to menus_path }
    end
  end
end
