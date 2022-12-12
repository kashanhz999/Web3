# create transactions that are triggered by smart contracts on blockchain

import json
from web3 import Web3

ganache_url = "http://127.0.0.1:7545"
web3 = Web3(Web3.HTTPProvider(ganache_url))

web3.eth.defaultAccount = web3.eth.accounts[0]

abi = json.loads('[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"greet","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"greeting","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"_greeting","type":"string"}],"name":"setGreeting","outputs":[],"stateMutability":"nonpayable","type":"function"}]')
address = web3.toChecksumAddress("0x00B50F4D5Aed3aC29D5223E55b0eA394C2218b4D")

contract = web3.eth.contract(address=address, abi=abi)
print(contract.functions.greet().call())

# writing smart contract
tx_hash = contract.functions.setGreeting('NEW GREETINGGGG!').transact()

# code will stop executing until we go there
web3.eth.waitForTransactionReceipt(tx_hash)

print('Updated greeting: {}'.format(
    contract.functions.greet().call()
))