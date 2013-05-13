require 'spec_helper'

describe Content do
  it { should belong_to :criterion}
  it { should belong_to :contentblock}
  it { should validate_presence_of :name }

end
