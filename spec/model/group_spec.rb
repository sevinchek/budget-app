require 'rails_helper'

RSpec.describe Group, js: true, type: :model do
  before(:each) do
    @user_1 = User.create(name: 'Kevin', email: 'kevin@gmail.com', password: '234234')
    @group_1 = Group.create(name: 'clothes', icon: 'https://www.svgrepo.com/show/275006/shirt-clothes.svg',
                            author_id: @user_1.id)
    @group_2 = Group.create(name: 'foods', icon: 'https://www.svgrepo.com/show/366737/food.svg', author_id: @user_1.id)
    @contract_1 = Contract.create(name: 'Rockys', amount: 60.5, author_id: @user_1.id)
    @contract_2 = Contract.create(name: 'Starbucks', amount: 20.3, author_id: @user_1.id)
    @contract_3 = Contract.create(name: 'Kadosh', amount: 25, author_id: @user_1.id)
    @group_contract_1 = GroupContract.create(contract_id: @contract_1.id, group_id: @group_2.id)
    @group_contract_2 = GroupContract.create(contract_id: @contract_2.id, group_id: @group_2.id)
    @group_contract_3 = GroupContract.create(contract_id: @contract_3.id, group_id: @group_1.id)
    @group_contract_4 = GroupContract.create(contract_id: @contract_3.id, group_id: @group_2.id)
  end

  it 'name is present' do
    expect(@group_1).to be_valid
    expect(@group_2).to be_valid
  end

  it 'name should be present' do
    @group_1.name = nil
    expect(@group_1).to_not be_valid
  end

  it 'icon should be present' do
    @group_1.icon = nil
    expect(@group_1).to_not be_valid
  end
end
