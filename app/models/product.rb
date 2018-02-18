class Product < ApplicationRecord
  belongs_to :upc

  after_create :generate_keys


  def sell(wallet_key)
    self.wallet_key = wallet_key
    save!
  end

  def generate_keys
    public_eth_key = '0x'
    possible_chars = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']

    40.times do |number|
      public_eth_key = public_eth_key + possible_chars[Random.rand(possible_chars.count - 1)]
    end

    private_eth_key = ''

    64.times do |number|
      private_eth_key = private_eth_key + possible_chars[Random.rand(possible_chars.count - 1)]
    end

    self.public_key = public_eth_key
    self.private_key = private_eth_key
    self.save!
  end

  def generate_ethereum_keys
    # self.public_key = response.public_key
    self.save!
  end

  def capture
    # send public key to blockchain and buyer wallet address
    # blockchain smart contract sends private key to wallet_key
  end
end
