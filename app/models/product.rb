class Product < ApplicationRecord
  belongs_to :upc

  after_create :generate_keys

  def sell(wallet_key)
    self.wallet_key = wallet_key
    save!
  end

  def generate_keys
    self.public_key = Digest::SHA2.hexdigest(self.public_id)
    self.save!
  end

  def generate_ethereum_keys
    self.public_key = response.public_key
    self.save!
  end

  def capture
    # send public key to blockchain and buyer wallet address
    # blockchain smart contract sends private key to wallet_key
  end
end
