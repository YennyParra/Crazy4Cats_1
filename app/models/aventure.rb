class Aventure < ApplicationRecord
    has_many :articles, dependent: :destroy
end
