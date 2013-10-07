require 'spec_helper'

describe MenusController do
  describe 'routing' do

    it('routes to #index') { get('/menus').should route_to('menus#index') }
    it('routes to #new') { get('/menus/new').should route_to('menus#new') }
    it('routes to #show') { get('/menus/1').should route_to('menus#show', id: '1') }
    it('routes to #edit') { get('/menus/1/edit').should route_to('menus#edit', id: '1') }
    it('routes to #create') { post('/menus').should route_to('menus#create') }
    it('routes to #update') { put('/menus/1').should route_to('menus#update', id: '1') }
    it('routes to #destroy') { delete('/menus/1').should route_to('menus#destroy', id: '1') }
  end
end
