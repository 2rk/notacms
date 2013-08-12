
def common_lets
  let(:user) { create(:user) }

  let(:page) { create(:page) }
  let(:page_other) { create(:page) }

  let(:position) { create(:position, page: page, user: user) }

end
