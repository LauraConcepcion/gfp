require 'spec_helper'

describe Score do
 it { should belong_to :qualifyingentity}
 it { should belong_to :student}
 it { should validate_presence_of :grade }

end
