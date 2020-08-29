
require 'test_helper'
class ContentTest < ActiveSupport::TestCase
  test 'search_by_title' do
    faker_contents = Array.new
    100.times do
      faker_contents << FactoryBot.create(:content)
    end
    sample_faker_content = faker_contents.sample
    searched_content = Content.search_by_title(sample_faker_content.title).first
    assert_equal sample_faker_content, searched_content
  end
  test 'search_by_tag' do
    faker_contents = Array.new
    100.times do
      faker_contents << FactoryBot.create(:content)
    end
    sample_faker_content = faker_contents.sample
    searched_contents = Content.search_by_tag(sample_faker_content.tags.first)
    assert_equal 1, searched_contents.count
    assert_equal sample_faker_content.tags, searched_contents.first.tags
  end
  test 'search_by_category_name' do
    faker_contents = Array.new
    faker_categorys = Array.new
    faker_sources = Array.new
    100.times do
      content = FactoryBot.build(:content)
      source = FactoryBot.build("Sources::TwitterAccount")
      category = FactoryBot.create("Configs::Category")
      source.category_id = category.id
      source.save
      content.source_id = source.id
      content.save
      faker_contents << content
      faker_categorys << category
      faker_sources << source
    end
    keyword = faker_categorys.sample.key
    searched_contents = Content.search_by_category_name(keyword)
    assert_equal 1, searched_contents.count
    assert_equal searched_contents.first.source.category.key, keyword
  end
  test "search_by_mixed(title)" do
    faker_contents = Array.new
    faker_categorys = Array.new
    faker_sources = Array.new
    100.times do
      content = FactoryBot.build(:content)
      source = FactoryBot.build("Sources::TwitterAccount")
      category = FactoryBot.create("Configs::Category")
      source.category_id = category.id
      source.save
      content.source_id = source.id
      content.save
      faker_contents << content
      faker_categorys << category
      faker_sources << source
    end
    sample_faker_content = faker_contents.sample
    search = Proc.new do |keyword|
      searched_contents = Content.search_by_mixed(keyword)
      searched_contents.each do |content|
        assert content.title.match(/#{keyword}/) || content.tags.include?(keyword) || content.source.category.key.match(/#{keyword}/)
      end
    end

    keyword = sample_faker_content.title
    search.call(keyword)

    keyword = sample_faker_content.tags.sample
    search.call(keyword)

    keyword = sample_faker_content.source.category.key
    search.call(keyword)
  end
end