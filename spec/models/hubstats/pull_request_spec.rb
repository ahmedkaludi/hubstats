require 'spec_helper'

module Hubstats
  describe PullRequest, :type => :model do
    it 'should create and return a pull request with a merge' do
      pull = build(:pull_request_hash)
      pull_request = PullRequest.create_or_update(pull)
      expect(pull_request.id).to eq(pull[:id])
      expect(pull_request.user_id).to eq(pull[:user][:id])
      expect(pull_request.repo_id).to eq(pull[:repository][:id])
      expect(pull_request.number).to eq(pull[:number])
      expect(pull_request.merged_by).to eq(pull[:merged_by][:id])
    end

    it 'should create and return a pull request without a merge' do
      pull = build(:pull_request_hash_no_merge)
      pull_request = PullRequest.create_or_update(pull)
      expect(pull_request.id).to eq(pull[:id])
      expect(pull_request.user_id).to eq(pull[:user][:id])
      expect(pull_request.repo_id).to eq(pull[:repository][:id])
      expect(pull_request.number).to eq(pull[:number])
    end
  end
end
