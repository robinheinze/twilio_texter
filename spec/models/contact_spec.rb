require 'spec_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should ensure_length_of(:phone).is_equal_to(10) }
end
