require 'spec_helper'

describe Schelude do
  it { should belong_to :classroom}
  it { should validate_presence_of :diasemana }
  it { should validate_presence_of :hora }

end
