require 'csv'

class Upc < ApplicationRecord
  has_many :products

  def import(file)
    rows = CSV.parse(file)

    rows.compact.each do |row|
      public_id = row[0]

      self.products.create(public_id: public_id)
    end
  end
end
