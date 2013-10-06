require 'spec_helper'

describe ContentsController do
  common_lets

  describe "GET index" do
    before do
      content
      content_other
      get :index
    end

    it { should assign_to(:contents).with([content, content_other]) }
    it { should render_template :index }
  end

  describe "GET show" do
    #before { get :show, id: content.id }
    #it { should assign_to(:content).with(content) }
    #it { should render_template :show }
  end
end
