class Product < ApplicationRecord
    validates : title, prsence: true
    validates : price, presence: true
    validates : stock_quantity, presence: true
end
