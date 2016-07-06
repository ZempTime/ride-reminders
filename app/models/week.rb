class Week < ApplicationRecord
  belongs_to :owner, polymorphic: true, required: false
end
