require 'spec_helper'

describe PositionsController do
  common_lets
  
  describe 'PUT update' do
    context 'owned' do
      context 'valid' do
        before do
          Position.any_instance.stub(:valid?).and_return(true)
          put :update, id: position
        end

        it { should assign_to(:position).with(position) }
      end
      context 'invalid' do
        before do
          position
          Position.any_instance.stub(:valid?).and_return(false)
          put :update, id: position
        end

        it { should assign_to(:position).with(position) }
        it { should render_template :edit }
      end
    end
    context 'un-owned' do
      #it { expect { put :update, id: position, vendor_id: vendor, retailer_id: retailer_other }.to raise_error ActiveRecord::RecordNotFound }
    end
  end
end
