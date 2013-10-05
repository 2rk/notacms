require "spec_helper"

describe PositionsController do
  describe "routing" do
    it('#update') { put('/positions/1').should route_to('positions#update', id: '1') }

    it('#index') { get('/positions').should_not be_routable }
    it('#new') { get('/positions/new').should_not be_routable }
    it('#show') { get('/positions/1').should_not be_routable }
    it('#edit') { get('/positions/1/edit').should_not be_routable }
    it('#create') { post('/positions').should_not be_routable }
    it('#destroy') { delete('/positions/1').should_not be_routable }
  end
end
