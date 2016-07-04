class Week < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
