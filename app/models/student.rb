class Student < ApplicationRecord
    has_many :ducks

    validates :mod, numericality: {only_integer: true, greater_than: 0, less_than: 6}
    validates :name, presence: true
end
