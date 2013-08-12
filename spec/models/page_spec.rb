require 'spec_helper'

describe Page do
  common_lets

  describe '#get_page' do
    context 'user not found' do
      it { expect(Page.get_page(page.id, nil)).to be_nil }
    end

    context 'user found' do
      context 'page not found' do
        it { expect(Page.get_page('', user.id)).to be_nil }
      end
      context 'page found' do
        context 'no position' do
          it { expect { Page.get_page(page.id, user.id) }.to change(Position, :count).by(1) }
          context 'get_page' do
            subject { Page.get_page(page.id, user.id) }
            its(:user) { should == user }
            its(:page) { should == page }
          end
        end
        context 'previous position' do
          it do
            position
            expect(Page.get_page(page.id, user.id)).to eq(position)
          end
        end
      end
    end
  end
end
