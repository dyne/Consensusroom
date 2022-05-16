echo "
Rule caller restroom-mw

Given I have a 'string' named 'add-identity'
Given I have a 'string dictionary' named 'post'
# Given I have a 'string dictionary' named 'output'
Given I have a 'string dictionary' named 'output'
Given I connect to 'add-identity' and pass it the content of 'post' and save the output into 'output'


Then print the 'output'



"> ./contracts/consensusroom-announce.zen
echo ✔ Imported consensusroom-announce.zen

echo "{}" > ./contracts/consensusroom-announce.keys
echo ✔ Imported consensusroom-announce.keys





echo "

Scenario 'ecdh': Create the keypair
Scenario 'ethereum': Create the keypair
Scenario 'reflow': Create the keypair
Scenario 'schnorr': Create the keypair

Given I have the 'keyring'
When I create the ecdh public key
When I create the reflow public key
When I create the schnorr public key

When I create the bitcoin address
When I create the ethereum address

Then print the 'ecdh public key'
Then print the 'reflow public key'
Then print the 'schnorr public key'

Then print the 'bitcoin address'
Then print the 'ethereum address'

"> ./contracts/consensusroom-generate-all-public-keys.zen
echo ✔ Imported consensusroom-generate-all-public-keys.zen

echo "
Rule caller restroom-mw
Scenario 'ecdh': verifies the signature from Apiroom 
Given I have a 'string dictionary' named 'updateInfo'
Given I have a 'string dictionary' named 'update' inside 'updateInfo'
Given I have a 'base64 dictionary' named 'update.signature' inside 'updateInfo'
# Given I have a 'string' named 'myFile' inside 'update'
Given I have a 'string' named 'myFolder' 

# Given I have a 'signature' named 'update.signature' 
Given I have a 'ecdh public key' from 'Apiroom' 

When I verify the 'update' has a signature in 'update.signature' by 'Apiroom' 

When I create the copy of 'myFile' from dictionary 'update'
When I rename the 'copy' to 'myFile'

Then print the string 'Zenroom verified the Apiroom signature are all correct!' 
Then print the 'myFile'
Then print the 'myFolder'

Then I download the 'myFile' and extract it into 'myFolder'
"> ./contracts/consensusroom-update.zen
echo ✔ Imported consensusroom-update.zen

echo "{\"Apiroom\":{\"ecdh_public_key\":\"BPMbqmvEwUJsB6MmrswxKxza5+Lt82X20mAjcmknT7E7RysW6fACs/L3sXEOEh8qYxHKNAvcBCAetcIEuIEUVC4=\"},\"myFolder\":\"./contracts\"}" > ./contracts/consensusroom-update.keys
echo ✔ Imported consensusroom-update.keys

echo "
Rule caller restroom-mw
Given I have a 'string' named 'myTimestamp'
Given I fetch the local timestamp and store it into 'myTimestamp'
Then print 'myTimestamp'
"> ./contracts/consensusroom-get-timestamp.zen
echo ✔ Imported consensusroom-get-timestamp.zen


echo "
Rule unknown ignore
Given I connect to 'endpoint' and pass it the content of 'myDataToPOST' and save the output into 'dataFromEndpoint'
Given I have a 'string dictionary' named 'dataFromEndpoint'
Then print the 'dataFromEndpoint'
"> ./contracts/consensusroom-http-post.zen
echo ✔ Imported consensusroom-http-post.zen

echo "
Given nothing
Then print the string 'I am alive!'
"> ./contracts/consensusroom-ping.zen
echo ✔ Imported consensusroom-ping.zen

echo "
ledgers:
  ping:
    interval: 300
    contract: consensusroom-ping
"> ./L1.yaml
echo ✔ Imported L1.yaml


echo "
Rule caller restroom-mw
Given I connect to 'endpoint' and pass it the content of 'post' and save the output into 'output'
Given I have a 'string dictionary' named 'output'
Then print the 'output'
"> ./contracts/consensusroom-http-post.zen
echo ✔ Imported onsensusroom-http-post.zen


echo "
Rule caller restroom-mw
Scenario 'ecdh': ecdh
Scenario 'schnorr': ecdh

Given I read the content of 'contracts/identity.json'
Given I read the content of 'contracts/pubkeys.json'


# Given I have a 'keyring'
Given I have a 'base64' named 'schnorr'
Given I have a 'base64 dictionary' named 'schnorr.signature'
Given I have a 'ecdh public key' from 'Issuer'
Given I have a 'string dictionary' named 'identity'


When I verify the 'schnorr' has a signature in 'schnorr.signature' by 'Issuer' 
#When I create the schnorr public key

# When I create the ecdh signature of 'identity'
# When I rename the 'ecdh signature' to 'ecdh.signature.identity'

When I create the 'base64 dictionary' named 'keyring'
When I insert 'schnorr' in 'keyring'


Then print the 'identity'

Then print the 'keyring'

# then print data
"> ./contracts/zenswarm-oracle-key-issuance-1.zen
echo ✔ Imported zenswarm-oracle-key-issuance-1.zen

echo "{}" > ./contracts/zenswarm-oracle-key-issuance-1.keys
echo ✔ Imported zenswarm-oracle-key-issuance-1.keys

echo "
Scenario 'schnorr': create Schnorr signature

Given I have a 'keyring'

Given I have a 'string dictionary' named 'identity'

When I create the schnorr signature of 'identity'
# When I create the schnorr public key

When I rename the 'schnorr signature' to 'schnorr.signature.identity'

# Here we print the signatyre, the public key and the message
# Then print my 'schnorr public key' 
# Then print the 'schnorr signature'
# Then print the 'message'

Then print the 'identity'

Then print the 'schnorr.signature.identity'
"> ./contracts/zenswarm-oracle-key-issuance-2.zen
echo ✔ Imported zenswarm-oracle-key-issuance-2.zen


echo "
Rule caller restroom-mw
Scenario 'ecdh': ecdh
Scenario 'schnorr': ecdh

Given I read the content of 'contracts/keyring.json'

Given I have a 'keyring'
Given I have a 'string dictionary' named 'identity'

Given I have a 'base64' named 'schnorr.signature.identity'

When I create the ecdh signature of 'identity'
When I rename the 'ecdh signature' to 'ecdh.signature.identity'

When I create the ecdh public key 

Then print the 'identity'
Then print the 'ecdh.signature.identity'
Then print the 'schnorr.signature.identity'
Then print the 'ecdh public key'

"> ./contracts/zenswarm-oracle-key-issuance-3.zen
echo ✔ Imported zenswarm-oracle-key-issuance-3.zen

echo "{}" > ./contracts/zenswarm-oracle-key-issuance-3.keys
echo ✔ Imported zenswarm-oracle-key-issuance-3.keys


echo "
zenchain: 1.0
start: id_0
blocks:
  id_0:
    zenFile: zenswarm-oracle-key-issuance-1.zen
    keysFile: zenswarm-oracle-key-issuance-1.keys
    next: id_1
  id_1:
    zenFile: zenswarm-oracle-key-issuance-2.zen
    next: id_2
  id_2:
    zenFile: zenswarm-oracle-key-issuance-3.zen
    keysFile: zenswarm-oracle-key-issuance-3.keys

"> ./contracts/zenswarm-oracle-key-issuance.yml
echo ✔ Imported zenswarm-oracle-key-issuance.yml

echo "{\"Issuer\":{\"ecdh_public_key\":\"BE7M0w9jugjgxyLn5C4ws6tnViv5rRc1zVSz+sm0M2NJUaZPaweefY3p6di7Da24TazNZ0HYVHcOEnVYlSZevqY=\"}}" > ./contracts/pubkeys.json
echo ✔ Imported pubkeys.json

echo "

### Ethereum notarization

Given I have a 'string dictionary' named 'post'
Given I have a 'string' named 'endpoint'
Given I have a 'string array' named 'result' in 'params'

# Given I have a  'result' in 'params'

#Given I have a 'hex' named 'hash' in 'result'

When I create the copy of 'hash' from dictionary 'result'
When I rename the 'copy' to 'hash'

When I create the 'hex array' named 'params'
When I insert 'hash' in 'params' 
When I insert false '' in 'params'

When I insert 'params' in 'post'

Then print the 'post'
Then print the 'endpoint'
"> ./contracts/ethNotarization-0-newhead.zen
echo ✔ Imported ethNotarization-0-newhead.zen

echo "{\"post\":{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBlockByHash\",\"id\":1},\"true\":true}" > ./contracts/ethNotarization-0-newhead.keys
echo ✔ Imported ethNotarization-0-newhead.keys

echo "

# simulate a call by the callback from ethereum subscription to new heads

# curl --location --request POST 'http://test.fabchain.net:8545' --header 'Content-Type: application/json' --data-raw \
# '{ "jsonrpc":"2.0", "method":"eth_getBlockByHash", "params":[ "HASH", false ], "id":1 }'

# Always use 'Rule caller restroom-mw' when using Restroom
Rule caller restroom-mw

Given I connect to 'endpoint' and pass it the content of 'post' and save the output into 'output'
Given I have a 'string' named 'endpoint'
Given I have a 'string dictionary' named 'post'
Given I have a 'string dictionary' named 'result' in 'output'
When I rename the 'result' to 'params'
then print the 'params'



"> ./contracts/ethNotarization-1-newhead.zen
echo ✔ Imported ethNotarization-1-newhead.zen


echo "
Given I have a 'hex dictionary' named 'result' in 'params'
# and I have a 'number' named 'system_timestamp'
When I create the 'hex dictionary' named 'newblock'
When I move 'hash' from 'result' to 'newblock'
When I move 'number' from 'result' to 'newblock'
When I move 'parentHash' from 'result' to 'newblock'
When I move 'timestamp' from 'result' to 'newblock'
# When I insert 'system_timestamp' in 'newblock'

When I create the mpack of 'newblock'
When I rename the 'mpack' to 'newblock-mpack'
Then print the 'newblock'
Then print the 'newblock-mpack'

"> ./contracts/ethNotarization-2-filter-newhead.zen
echo ✔ Imported ethNotarization-2-filter-newhead.zen

echo "{\"fabchain\":\"http://test.fabchain.net:8545\",\"myTag\":\"239fb776c62bb583dd6464804cd6183945a4fa5722090b23a7281dcafc8b436b\"}" > ./contracts/Ethereum-retrieve-A.keys
echo ✔ Imported Ethereum-retrieve-A.keys

echo "
Rule unknown ignore
Scenario ethereum: test store
Given I have the 'keyring'
Given I have a ethereum endpoint named 'fabchain'
Given I have a 'ethereum address' named 'storage contract'
Given I have a 'ethereum nonce'
Given I read the ethereum nonce for 'my_address'
and a 'gas price'
and a 'gas limit'
Given I have a 'base64' named 'newblock-mpack'

# Given I read the # ethereum suggested gas price
When I create the ethereum transaction to 'storage contract'
When I use the ethereum transaction to store 'newblock-mpack'

When I create the signed ethereum transaction for chain 'fabt'
Then print the 'signed ethereum transaction'
Then I ask ethereum to broadcast the 'signed_ethereum_transaction' and save the transaction id in 'txid'
Then print data

"> ./contracts/ethNotarization-3-ethereum-store.zen
echo ✔ Imported ethNotarization-3-ethereum-store.zen

echo "{\"keyring\":{\"ethereum\":\"2bb7018d08990874cea523d52642ecd470021a4e7d8b93553bbfcd2343ee8b37\"},\"my_address\":\"28c44EeA27c304bE7416a220515A823E29a0Fb83\",\"fabchain\":\"http://test.fabchain.net:8545\",\"gas limit\":\"100000\",\"gas price\":\"1000000000\",\"gwei value\":\"0\",\"storage_contract\":\"1b620cA5172A8D6A64798FcA2ee690066F7A7816\"}" > ./contracts/ethNotarization-3-ethereum-store.keys
echo ✔ Imported ethNotarization-3-ethereum-store.keys

echo "
Given I have a 'base64' named 'newblock-mpack'
Given I have a 'hex' named 'txid'

When I create the 'newblock' decoded from mpack 'newblock-mpack'

Then print the 'txid'
Then print the 'newblock-mpack'
Then print the 'newblock' as 'hex'


"> ./contracts/ethNotarization-4-ethereum-store.zen
echo ✔ Imported ethNotarization-4-ethereum-store.zen

### End Ethereum notarization

echo "
zenchain: 1.0
start: id_0
blocks:
  id_0:
    zenFile: ethNotarization-0-newhead.zen
    keysFile: ethNotarization-0-newhead.keys
    next: id_1
  id_1:
    zenFile: ethNotarization-1-newhead.zen
    next: id_2
  id_2:
    zenFile: ethNotarization-2-filter-newhead.zen
    keysFile: Ethereum-retrieve-A.keys
    next: id_3
  id_3:
    zenFile: ethNotarization-3-ethereum-store.zen
    keysFile: ethNotarization-3-ethereum-store.keys
    next: id_4
  id_4:
    zenFile: ethNotarization-4-ethereum-store.zen

"> ./contracts/ethereum-notarization.yml
echo ✔ Imported ethereum-notarization.yml

echo "
Scenario 'ecdh': ecdh
Scenario 'schnorr': ecdh

Given I read the content of 'contracts/identity.json'
Given I read the content of 'contracts/pubkeys.json'


# Given I have a 'keyring'
Given I have a 'base64' named 'schnorr'
Given I have a 'base64 dictionary' named 'schnorr.signature'
Given I have a 'ecdh public key' from 'Issuer'
Given I have a 'string dictionary' named 'identity'


When I verify the 'schnorr' has a signature in 'schnorr.signature' by 'Issuer' 
#When I create the schnorr public key

# When I create the ecdh signature of 'identity'
# When I rename the 'ecdh signature' to 'ecdh.signature.identity'

When I create the 'base64 dictionary' named 'keyring'
When I insert 'schnorr' in 'keyring'


Then print the 'identity'

Then print the 'keyring'

# then print data
"> ./contracts/zenswarm-oracle-key-issuance-1.zen
echo ✔ Imported zenswarm-oracle-key-issuance-1.zen

echo "{}" > ./contracts/zenswarm-oracle-key-issuance-1.keys
echo ✔ Imported zenswarm-oracle-key-issuance-1.keys

echo "
Scenario 'schnorr': create Schnorr signature

Given I have a 'keyring'

Given I have a 'string dictionary' named 'identity'

When I create the schnorr signature of 'identity'
# When I create the schnorr public key

When I rename the 'schnorr signature' to 'schnorr.signature.identity'

# Here we print the signatyre, the public key and the message
# Then print my 'schnorr public key' 
# Then print the 'schnorr signature'
# Then print the 'message'

Then print the 'identity'

Then print the 'schnorr.signature.identity'
"> ./contracts/zenswarm-oracle-key-issuance-2.zen
echo ✔ Imported zenswarm-oracle-key-issuance-2.zen


echo "
Scenario 'ecdh': ecdh
Scenario 'schnorr': ecdh

Given I read the content of 'contract/keyring.json'

Given I have a 'keyring'
Given I have a 'string dictionary' named 'identity'

Given I have a 'base64' named 'schnorr.signature.identity'

When I create the ecdh signature of 'identity'
When I rename the 'ecdh signature' to 'ecdh.signature.identity'

When I create the ecdh public key 

Then print the 'identity'
Then print the 'ecdh.signature.identity'
Then print the 'schnorr.signature.identity'
Then print the 'ecdh public key'

"> ./contracts/zenswarm-oracle-key-issuance-3.zen
echo ✔ Imported zenswarm-oracle-key-issuance-3.zen

echo "{}" > ./contracts/zenswarm-oracle-key-issuance-3.keys
echo ✔ Imported zenswarm-oracle-key-issuance-3.keys


echo "
zenchain: 1.0
start: id_0
blocks:
  id_0:
    zenFile: zenswarm-oracle-key-issuance-1.zen
    keysFile: zenswarm-oracle-key-issuance-1.keys
    next: id_1
  id_1:
    zenFile: zenswarm-oracle-key-issuance-2.zen
    next: id_2
  id_2:
    zenFile: zenswarm-oracle-key-issuance-3.zen
    keysFile: zenswarm-oracle-key-issuance-3.keys

"> ./contracts/zenswarm-oracle-key-issuance.yml
echo ✔ Imported zenswarm-oracle-key-issuance.yml

echo "
Rule caller restroom-mw

Given I read the content of 'contracts/identity.json'
Given I read the content of 'contracts/blockchain-subscriptions.json'


Given I have a 'string dictionary' named 'identity'
Given I have a 'string dictionary' named 'subscriptions'

Then print data
"> ./contracts/zenswarm-oracle-get-identity.zen
echo ✔ Imported zenswarm-oracle-get-identity.zen


### Sawroom notarization

echo "
Given I have a 'string' named 'block_id'
Given I have a 'number' named 'block_num'
Given I have a 'string' named 'previous_block_id'

Given I have a 'string' named 'endpoint'


When I create the 'string dictionary'
When I rename the 'string dictionary' to 'sawroomNewBlock'

When I insert 'block_id' in 'sawroomNewBlock'
When I insert 'previous_block_id' in 'sawroomNewBlock'
When I insert 'block_num' in 'sawroomNewBlock'


When I create the copy of 'block_id' from dictionary 'sawroomNewBlock'
When I rename the 'copy' to 'block_id'
When I write string 'blocks/' in 'blocks'
When I append 'blocks' to 'endpoint'
When I append 'block_id' to 'endpoint'

then print the 'endpoint'
then print the 'sawroomNewBlock'
# Then print the 'url'
"> ./contracts/sawroom-notarization-0.zen
echo ✔ Imported sawroom-notarization-0.zen


echo "
Rule caller restroom-mw

Given that I have an endpoint named 'endpoint' 
Given I connect to 'endpoint' and save the output into 'dataFromEndpoint'
Given I fetch the local timestamp and store it into 'oracleTimestamp'

Given I have a 'string dictionary' named 'sawroomNewBlock'
Given I have a 'string' named 'endpoint'
Given I have a 'string dictionary' named 'dataFromEndpoint'
Given I have a 'string' named 'oracleTimestamp'

Then print the 'dataFromEndpoint'
Then print the 'oracleTimestamp'



"> ./contracts/sawroom-notarization-1.zen
echo ✔ Imported sawroom-notarization-1.zen


echo "
Given I have a 'string dictionary' named 'result' inside 'dataFromEndpoint'
Given I have a 'string' named 'oracleTimestamp' 
When I pickup from path 'result.data.batches.header_signature'
When I pickup from path 'result.data.header.previous_block_id' 
When I pickup from path 'result.data.header.block_num' 


When I create the 'string dictionary' named 'newSawroomBlock'

When I insert 'header_signature' in 'newSawroomBlock'
When I insert 'previous_block_id' in 'newSawroomBlock'
When I insert 'oracleTimestamp' in 'newSawroomBlock'
When I insert 'block_num' in 'newSawroomBlock'

When I create the mpack of 'newSawroomBlock'
When I rename the 'mpack' to 'newSawroomBlock-mpack'

Then print the 'newSawroomBlock'
Then print the 'newSawroomBlock-mpack'



"> ./contracts/sawroom-notarization-2.zen
echo ✔ Imported sawroom-notarization-2.zen


echo "
Rule unknown ignore
Scenario ethereum: test store
Given I have the 'keyring'
Given I have a ethereum endpoint named 'fabchain'
Given I have a 'ethereum address' named 'storage contract'
Given I have a 'ethereum nonce'
Given I read the ethereum nonce for 'my_address'
and a 'gas price'
and a 'gas limit'
Given I have a 'base64' named 'newSawroomBlock-mpack'

# Given I read the # ethereum suggested gas price
When I create the ethereum transaction to 'storage contract'
When I use the ethereum transaction to store 'newSawroomBlock-mpack'

When I create the signed ethereum transaction for chain 'fabt'
Then print the 'signed ethereum transaction'
Then I ask ethereum to broadcast the 'signed_ethereum_transaction' and save the transaction id in 'txid'
Then print data

"> ./contracts/sawroom-notarization-3.zen
echo ✔ Imported sawroom-notarization-3.zen


echo "
Given I have a 'base64' named 'newSawroomBlock-mpack'
Given I have a 'hex' named 'txid'

When I create the 'newSawroomblock' decoded from mpack 'newSawroomBlock-mpack'

Then print the 'txid'
Then print the 'newSawroomBlock-mpack'
Then print the 'newSawroomblock' as 'hex'


"> ./contracts/sawroom-notarization-4.zen
echo ✔ Imported sawroom-notarization-4.zen



echo "
zenchain: 1.0
start: id_0
blocks:
  id_0:
    zenFile: sawroom-notarization-0.zen
    next: id_1
  id_1:
    zenFile: sawroom-notarization-1.zen
    next: id_2
  id_2:
    zenFile: sawroom-notarization-2.zen
    next: id_3
  id_3:
    zenFile: sawroom-notarization-3.zen
    next: id_4
  id_4:
    zenFile: sawroom-notarization-4.zen

"> ./contracts/sawroom-notarization.yml
echo ✔ Imported sawroom-notarization.yml

### End Sawroom notarization


