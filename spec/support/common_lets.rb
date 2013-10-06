
def common_lets
  let(:user) { create(:user) }

  let(:content) { create(:content) }
  let(:content_other) { create(:content) }

  let(:position) { create(:position, content: content, user: user) }

end
