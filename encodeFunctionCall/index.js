const Web3 = require('web3');

const web3 = new Web3("https://mainnet.infura.io/v3/dc4f7ecbab794372b17b8be7a4564233");

const main = async () => {
  const result = await web3.eth.abi.encodeFunctionCall({
    "inputs": [
      {
        "internalType": "address",
        "name": "_owner",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "_name",
        "type": "string"
      }
    ],
    "name": "initialize",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }, ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "b"]);
  console.log('result: ', result);
}

main();