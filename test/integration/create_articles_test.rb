require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
	end

	test "get new article form and create category" do
		sign_in_as(@user, "password")
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'Article.count', 1 do
			post_via_redirect articles_path, article: {title: "Test article", description: "Test article for integartion testing", category: "Sports"}
		end
		assert_template 'articles/show'
		assert_match "Test article", response.body
	end
end