require "rails_helper"

RSpec.describe Supports::PostSupport, type: :model do
  let!(:user){FactoryGirl.create :user}
  let!(:work_space){FactoryGirl.create :work_space}
  let(:topic) {FactoryGirl.create :topic}
  let!(:post) do
    FactoryGirl.create :post, work_space: work_space, user: user, topic: topic
  end

  subject {Supports::PostSupport.new Post, topic.id, "newest", true, 1}

  describe "#initialize" do
    it {expect(subject.post).to eq Post}
  end

  describe "#recent_posts" do
    it {expect(subject.recent_posts).to eq [post]}
  end

  describe "#popular_posts" do
    it {expect(subject.popular_posts).to eq [post]}
  end

  describe "#posts_no_answer" do
    it "post no answer" do
      expect(subject.posts_no_answer).to eq [post]
    end

    it "post have answer" do
      FactoryGirl.create :answer, user: user, post: post

      expect(subject.posts_no_answer).to eq []
    end
  end

  describe "#hot_post" do
    it {expect(subject.hot_post).to eq [post]}
  end
end
