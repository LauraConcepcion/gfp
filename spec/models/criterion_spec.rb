require 'spec_helper'

describe Criterion do
  it { should belong_to :content}
  it { should belong_to :tlresult}
  it { should validate_presence_of :name }
end
