require 'spec_helper'

describe Content do
  common_lets

  describe '#get_meme' do
    context 'user does not exist' do
      it { expect(Content.get_meme 0, 0).to be_nil }
    end
    context 'user exists' do
      before { user }
      context 'content does not exist' do
        it { expect(Content.get_meme(0, user.id)).to eq(Content::PAGE_NOT_FOUND) }
      end
      context 'content does exist' do
        context 'position does not exist' do
          it 'should create a position record' do
            expect { Content.get_meme(content.id, user.id) }.to change(Position, :count).by(1)
          end
          context 'content & position' do
            subject {Content.get_meme(content.id, user.id)}

            its(['title']) { should == content.title }
            its(['content']) { should == content.content }
            its(['top']) { should == content.top }
            its(['left']) { should == content.left }
            its(['width']) { should == content.width }
            its(['height']) { should == content.height }
            its(['position_id']) { should == Position.last.id }
          end
          context 'create position' do
            before { Content.get_meme(content.id, user.id) }
            subject { Position.last }

            its(:user) { should == user }
            its(:content) { should == content }
            its(:top) { should == content.top }
            its(:left) { should == content.left }
            its(:width) { should == content.width }
            its(:height) { should == content.height }
          end
        end
        context 'position does exist' do
          before { position }
          subject { Content.get_meme(content.id, user.id) }

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
