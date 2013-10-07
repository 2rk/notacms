
def common_lets
  let(:user) { create(:user) }

  let(:content) { create(:content) }
  let(:content_other) { create(:content) }

  let(:menu) { create(:menu, content: content)}
  let(:menu_other) { create(:menu, content: content_other)}

  let(:position) { create(:position, content: content, user: user) }

end
