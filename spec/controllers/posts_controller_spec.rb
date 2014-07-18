require "rails_helper"

RSpec.describe PostsController, type: :controller do
	before(:each) do
		@user=User.create(email: 'test@test.pl', password: 'testpassword')
		sign_in @user
		#@post = Post.create(title: 'Titletest', content: 'Contenttest', user_id: @user.id)
	end

	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end


	describe "GET #show/:id" do
		it 'should responds successfully with an HTTP 200 status code' do
			@post = Post.create(title: 'TestTitle', content: 'TestContent', user_id: 1)
			get :show, id: @post.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end

	it "renders the index template" do
		get :index
		expect(response).to render_template("index")
	end

	it "loads all of the posts into @posts" do
		post1, post2 = Post.create(content: "Test Content", title: 'TestTitle', user_id: 5), Post.create(content: "Test Content", title: 'TestTitle', user_id: 7)
		get :index
		expect(assigns(:posts)).to match_array([post1, post2])
	end

end