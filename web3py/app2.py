# Sending transactions on Ethereum

from web3 import Web3

ganache_url = "http://127.0.0.1:7545"

web3 = Web3(Web3.HTTPProvider(ganache_url))
# print(web3.isConnected())
# print(web3.eth.block_number)

account_1 = "0x07a5744DEb76e1839c92c71239b5Caf9757c81Bf"
account_2 = "0x665B1Aa6708AF71955323172174bb180873a942f"

# private key of account_1 which authorizes it to send ethers to account_2
private_key = "955e0c340b410da79f600fecd7cb63c31b6cd9c17a85ee15f96536781ab19a11"

# get the nonce
nonce = web3.eth.getTransactionCount(account_1)

# build a transaction
tx = {
    'nonce': nonce,
    'to': account_2,
    'value': web3.toWei(1, 'ether'),
    'gas': 2000000,
    'gasPrice': web3.toWei('50', 'gwei')
}

# sign transaction
signed_tx = web3.eth.account.signTransaction(tx, private_key)

# send transaction
tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)

# get transaction hash
print(web3.toHex(tx_hash)) 