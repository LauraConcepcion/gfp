require 'spec_helper'

describe Contentblock do
 it { should belong_to :quarter}
 it { should belong_to :matter}
 it { should belong_to :tlresult}
 it { should belong_to :aacce}
 it { should have_and_belong_to_many :qualifyingentities }
 it { should validate_presence_of :name }

end
