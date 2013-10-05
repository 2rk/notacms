require 'spec_helper'

describe PagesController do
  common_lets

  describe "GET index" do
    before do
      page
      page_other
      get :index
    end

    it { should assign_to(:pages).with([page, page_other]) }
    it { should render_template :index }
  end

  describe "GET show" do
    #before { get :show, id: page.id }
    #it { should assign_to(:page).with(page) }
    #it { should render_template :show }
  end
end
