# interact with blockchain and look at data from blocks themselves

from web3 import Web3

infura_url = "https://mainnet.infura.io/v3/054ca0f729624fd2b0a76111196071c4"
web3 = Web3(Web3.HTTPProvider(infura_url))

latest = web3.eth.blockNumber
# print(latest)

# print(web3.eth.getBlock(latest))

# # data for 10 blocks using loop
# for i in range(0, 10):
#     print(web3.eth.getBlock(latest-i))

# specific block
hash = '0x0b04f73b5019f173598e15ecbe3517dceec7308ea94d5ad903d5a507cc2cb7f1'
print(web3.eth.getTransactionByBlock(hash, 2))