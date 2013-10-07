require 'spec_helper'

describe Menu do
  common_lets
  describe '.content_text' do
    context 'related content does not exist' do
      let(:menu_unrelated) { create(:menu) }
      it('menu name is blank') do
        menu_unrelated.update_attribute(:name, nil)
        expect(menu_unrelated.content_text).to eq('')
      end
      it do
        expect(menu_unrelated.content_text).to eq(menu_unrelated.name)
      end
    end
    context 'related content does exist' do
      context 'menu name is blank' do
        after { expect(menu.content_text).to eq(content.title) }

        it('name is nil') { menu.update_attribute(:name, nil) }
        it('name is ""') { menu.update_attribute(:name, "") }
        it('name is " "') { menu.update_attribute(:name, " ") }
      end
      context 'menu name is set' do
        it { expect(menu.content_text).to eq(menu.name) }
      end
    end
  end
end
