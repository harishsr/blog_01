require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'title must exist and be in range' do
    article = Article.new(content: 'a'*10)
    [0, 4, 251].each do |n|
      article.title = 'a'*n
      refute article.valid?, "Title length #{n} should be invalid"
    end

    [5, 250].each do |n|
      article.title = 'a'*5
      assert article.valid?, "Title length #{n} should be valid"
    end
  end

  test 'content must exist and be in range' do
    article = Article.new(title: 'a'*5)
    [0, 4, 40_001].each do |n|
      article.content = 'a'*n
      refute article.valid?, "Content length #{n} should be invalid"
    end

    [5, 40_000].each do |n|
      article.content = 'a'*5
      assert article.valid?, "Content length #{n} should be valid"
    end
  end
end
