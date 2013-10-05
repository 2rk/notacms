require 'spec_helper'

describe Page do
  common_lets

  describe '#get_meme' do
    context 'user does not exist' do
      it { expect(Page.get_meme 0, 0).to be_nil }
    end
    context 'user exists' do
      before { user }
      context 'page does not exist' do
        it { expect(Page.get_meme(0, user.id)).to eq(Page::PAGE_NOT_FOUND) }
      end
      context 'page does exist' do
        context 'position does not exist' do
          it 'should create a position record' do
            expect { Page.get_meme(page.id, user.id) }.to change(Position, :count).by(1)
          end
          context 'content & position' do
            subject {Page.get_meme(page.id, user.id)}

            its(['title']) { should == page.title }
            its(['content']) { should == page.content }
            its(['top']) { should == page.top }
            its(['left']) { should == page.left }
            its(['width']) { should == page.width }
            its(['height']) { should == page.height }
            its(['position_id']) { should == Position.last.id }
          end
          context 'create position' do
            before { Page.get_meme(page.id, user.id) }
            subject { Position.last }

            its(:user) { should == user }
            its(:page) { should == page }
            its(:top) { should == page.top }
            its(:left) { should == page.left }
            its(:width) { should == page.width }
            its(:height) { should == page.height }
          end
        end
        context 'position does exist' do
          before { position }
          subject { Page.get_meme(page.id, user.id) }

          its(['top']) { should == position.top }
          its(['left']) { should == position.left }
          its(['width']) { should == position.width }
          its(['height']) { should == position.height }
          its(['position_id']) { should == position.id }
        end
      end
    end
  end
end
