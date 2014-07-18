require "rails_helper"

RSpec.describe User, type: :model do

it 'should have attributes :content, :user_id, title' do
		expect(subject.attributes).to include('email', 'encrypted_password')
	end

#	it 'should have many comments' do
#		t = Comment.reflect_on_association(:comments)
#		expect(t.macro).to equal :has_many
#	end
#
#	it 'should have many posts' do
#		t = Post.reflect_on_association(:posts)
#		expect(t.macro).to equal :has_many
#	end

end